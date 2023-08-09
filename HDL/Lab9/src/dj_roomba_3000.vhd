-- Dr. Kaputa
-- Lab 8: DJ Roomba 3000 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dj_roomba_3000 is 
  port(
    clk                 : in std_logic;
    reset               : in std_logic;
    execute_btn         : in std_logic;
    sync                : in std_logic;
    led                 : out std_logic_vector(7 downto 0);
    audio_out           : out std_logic_vector(15 downto 0)
  );
end dj_roomba_3000;

architecture beh of dj_roomba_3000 is
--state definitions
type state_type is (idle, fetch, decode, execute, error); --states
signal current_state, next_state : state_type; --defining what holds the states

--constants for command decoding
constant PLAY_C     :   std_logic_vector(1 downto 0) := "00";
constant PAUSE_C    :   std_logic_vector(1 downto 0) := "01";
constant SEEK_C     :   std_logic_vector(1 downto 0) := "10";
constant STOP_C     :   std_logic_vector(1 downto 0) := "11";
 
  -- instruction memory
  component rom_instructions
    port(
      address    : in std_logic_vector (4 DOWNTO 0);
      clock      : in std_logic  := '1';
      q          : out std_logic_vector (7 DOWNTO 0)
    );
  end component;
  
  -- data memory
  component rom_data
    port(
      address  : in std_logic_vector (13 DOWNTO 0);
      clock    : in std_logic  := '1';
      q        : out std_logic_vector (15 DOWNTO 0)
    );
  end component;
  
  --rising edge sync
  component rising_edge_synchronizer 
  port (
    clk               : in std_logic;
    reset             : in std_logic;
    input             : in std_logic;
    edge              : out std_logic
  );
  end component;
  
signal data_address  : std_logic_vector(13 downto 0) := "00000000000000";
signal data_address_reg : std_logic_vector(13 downto 0) := "00000000000000";
signal data_address_play  : std_logic_vector(13 downto 0) := "00000000000000";
signal data_address_play_repeat  : std_logic_vector(13 downto 0) := "00000000000000";
signal data_address_stop  : std_logic_vector(13 downto 0) := "00000000000000";
signal data_address_seek  : std_logic_vector(13 downto 0) := "00000000000000";
signal data_address_pause  : std_logic_vector(13 downto 0) := "00000000000000";
signal instruction   : std_logic_vector(7 downto 0);
signal inst_addr     : std_logic_vector(4 downto 0);

signal play_cmd      : std_logic := '0';
signal pause_cmd     : std_logic := '0';
signal seek_cmd      : std_logic := '0';
signal seek_addr     : std_logic_vector(4 downto 0) := "00000";
signal stop_cmd      : std_logic := '0';

signal execute_en    : std_logic;
--signal instr_fetch   : std_logic;

--instruction bus decoding
alias opcode        :   std_logic_vector(1 downto 0) is instruction(7 downto 6);
alias repeat_func   :   std_logic is instruction(5);
alias seek_valule   :   std_logic_vector(4 downto 0) is instruction(4 downto 0);

begin

-- data instantiation
u_rom_data_inst : rom_data
  port map (
    address    => data_address_reg,
    clock      => clk,
    q          => audio_out
  );

-- data instantiation
instructions : rom_instructions
  port map (
    address    => inst_addr,
    clock      => clk,
    q          => instruction
  );

exeEdge: rising_edge_synchronizer 
  port map(
    clk     => clk,
    reset   => reset,
    input   => execute_btn,
    edge    => execute_en
  );
  
--next state set
nextState: process(clk, reset)
	begin
		if(reset = '1') then
			current_state <= idle;
		elsif(clk'event and clk = '1') then
			current_state <= next_state;
		end if;
end process;

--uses current state to determine outputs of FSM
logic: process(clk, current_state, opcode, reset, execute_btn, instruction)
	begin
		case (current_state) is
			--READ THE COMMAND REGISTER (8-bit)
			when idle =>
                --instr_fetch <= '1';
                --instr_cntr <= '0';
				if(execute_en = '1') then 		--if push button pressed
					next_state <= fetch;  --transition 
                else
					next_state <= idle;  --otherwise stay in current state
				end if;
			--get the instruction from the ROM
			when fetch =>
				--instr_fetch <= '0';
                --instr_cntr <= '1';
				next_state <= decode;
			--Based on outputs of ROM, set which command to do
			when decode =>
				--instr_fetch <= '0';
                --instr_cntr <= '0';
				if(opcode = PLAY_C) then 		--if push button pressed
					next_state <= execute;  --transition 
                    play_cmd  <= '1';
                    pause_cmd <= '0';
                    seek_cmd  <= '0';
                    stop_cmd  <= '0';
                elsif(opcode = PAUSE_C) then
                    next_state <= execute;
                    play_cmd  <= '0';
                    pause_cmd <= '1';
                    seek_cmd  <= '0';
                    stop_cmd  <= '0';
                elsif(opcode = SEEK_C and seek_addr /= "00000") then
                    next_state <= execute;
                    play_cmd  <= '0';
                    pause_cmd <= '0';
                    seek_cmd  <= '1';
                    stop_cmd  <= '0';
                elsif(opcode = STOP_C) then
                    next_state <= execute;
                    play_cmd  <= '0';
                    pause_cmd <= '0';
                    seek_cmd  <= '0';
                    stop_cmd  <= '1';
                else
					next_state <= error;  --otherwise stay in current state
				end if;
			--give the system time to execute the command
			when execute =>
				--instr_fetch <= '0';
                --instr_cntr <= '0';
				next_state <= idle;  --otherwise stay in current state
			--if errored, abort and return to idle
			when error =>
			    --instr_fetch <= '0';
                --instr_cntr <= '0';
                play_cmd  <= '0';
                pause_cmd <= '0';
                seek_cmd  <= '1';
                stop_cmd  <= '0';
				--led <= "11111111";
				next_state <= idle;  --otherwise stay in current state
			--OTHERS
			when others =>
				next_state <= idle;      --if lost go to idle
				
		end case;
end process;



--picks address for Audio ROM
whichAddress: process(sync, opcode, repeat_func, clk)
	begin
	if (reset = '1') then                       --if reset, return to start
		data_address <= (others => '0');
	else        --if seeking, get seek address
		if(opcode = SEEK_C) then
			data_address <= data_address_seek;
		elsif(opcode = STOP_C) then             --if stopping, get stop address
			data_address <= data_address_stop;
		elsif(opcode = PLAY_C) then             --if playing, get play address
			if(repeat_func = '1') then          --choose between repeat and normal address
				data_address <= data_address_play_repeat;
			else
				data_address <= data_address_play;
			end if;
		end if;
	end if;
end process;

--process for data_register
dataReg: process(clk, reset)
begin
    if (reset = '1') then
        data_address_reg <= (others => '0');
    elsif(clk'event and clk = '1') then
        if (sync = '1') then
            data_address_reg <= data_address;
        end if;
    end if;
end process;

--counter for Instruction ROM
instrCounter: process(clk, reset, execute_en, instruction)
begin
    if(reset = '1') then        --if reset start over
        inst_addr <= (others => '0');
    elsif(clk'event and clk = '1') then
        if(execute_en = '1') then    --otherwise increment when executing
            inst_addr <= std_logic_vector(unsigned(inst_addr) + 1);
        else
            inst_addr <= inst_addr;
        end if;
    end if;
end process;

  -- loop audio file
-- dataPlay: process(clk, reset)
-- begin 
    -- if(reset = '1') then
    -- data_address_play <= (others => '0');
    -- else
        -- if(sync = '1') then
            -- if (data_address_reg = "11111111111111") then
                -- data_address_play <= (others => '1');
            -- else
                -- data_address_play <= std_logic_vector(unsigned(data_address_reg) + 1);
            -- end if;
        -- end if;
    -- end if;
-- end process;
data_address_play <= (others => '1') when data_address_reg = "11111111111111"
                       else std_logic_vector(unsigned(data_address_reg) + 1);
data_address_play_repeat <= std_logic_vector(unsigned(data_address_reg) + 1);
data_address_stop <= "00000000000000";
data_address_seek <= seek_addr & "000000000";
data_address_pause <= data_address_reg;

led <= "000" & inst_addr;
end beh;
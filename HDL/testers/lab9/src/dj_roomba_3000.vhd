-- Dr. Kaputa
-- Lab 9: DJ Roomba 3000 

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
  
  component rising_edge_synchronizer
    port (
      clk      : in std_logic;
      reset    : in std_logic;
      input    : in std_logic;
      edge     : out std_logic
    );
  end component;
  
  
  type states_t is (IDLE, FETCH, DECODE, EXECUTE, DECODE_ERROR);
  
  signal curr_state : states_t;
  signal next_state : states_t;
  signal key_press : std_logic;
  signal data_address  : std_logic_vector(13 downto 0);
  signal instruc_count : std_logic_vector(4 downto 0) := (others => '0');
  signal instruction : std_logic_vector(7 downto 0);
  
  alias seek   is instruction(4 downto 0);
  alias repeat is instruction(5);
  alias option is instruction(7 downto 6);

begin

  execute_sync : rising_edge_synchronizer
    port map (
      clk       => clk,
      reset     => reset,
      input     => execute_btn,
      edge      => key_press
    );
    
  -- data instantiation
  u_rom_instruc_inst : rom_instructions
    port map (
      address    => instruc_count,
      clock      => clk,
      q          => instruction
    );

  -- data instantiation
  u_rom_data_inst : rom_data
    port map (
      address    => data_address,
      clock      => clk,
      q          => audio_out
    );
    
  -- loop audio file
  process(clk, reset)
  begin 
    if (reset = '1') then 
      data_address <= (others => '0');
    elsif (clk'event and clk = '1') then
      if (sync = '1') then    
        data_address <= std_logic_vector(unsigned(data_address) + 1 );
      end if;
    end if;
  end process;

  led <= "10101010";
  
  state_change : PROCESS(reset, clk)
  BEGIN
    IF(reset = '1') THEN
      curr_state <= IDLE;
      
    ELSIF(rising_edge(clk)) THEN
      curr_state <= next_state;
    END IF;
  END PROCESS state_change;
  
  state_proc : PROCESS(key_press, clk)
  BEGIN
    CASE curr_state IS
      WHEN IDLE =>
        
        IF(key_press = '1') THEN
          next_state <= FETCH;
        ELSE
          next_state <= IDLE;
          
        END IF;      
      WHEN FETCH =>
        instruc_count <= std_logic_vector(unsigned(instruc_count) + 1);
        
        next_state <= DECODE;
        
      WHEN DECODE => 
        led <= instruction;
        
        next_state <= EXECUTE;
        
      WHEN EXECUTE =>
        IF(option = "00" AND repeat = '0') THEN -- PLAY ONCE
          IF(data_address < max_count) THEN
            data_address <= std_logic_vector(unsigned(data_address) + 1 );
          ELSE 
            data_address <= max_count;
          END IF;
        ELSIF(option = "00" AND repeat - '1') THEN -- REPEAT
          data_address <= std_logic_vector(unsigned(data_address) + 1 );
        ELSIF(option = "01") THEN          -- PAUSE
          data_address <= data_address;
        ELSIF(option = "10") THEN          -- SEEK
          data_address <= seek & "000000000";
        ELSIF(opcode = "11") THEN          -- STOP
          data_address <= (others => '0');
        ELSE
          next_state <= DECODE_ERROR;
        END IF;
      
      WHEN DECODE_ERROR =>
        led <= instruction;
        
        next_state <= IDLE;
    END CASE;
  END PROCESS state_proc;
  
end beh;
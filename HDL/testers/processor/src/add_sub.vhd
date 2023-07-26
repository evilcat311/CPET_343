--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  <enter your name here>
--
--       LAB NAME:  Labx: <name of lab>
--
--      FILE NAME:  add_sub.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--    This file uses an FSM to add or subtract two 8-bit values 
--    set with the switches on the board.  The state is advanced 
--	  by using the push button on the board.
--  REVISION HISTORY
--
--  _______________________________________________________________________
-- |  DATE    | USER | Ver |  Description                                  |
-- |==========+======+=====+================================================
-- |          |      |     |
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE add_sub_pkg IS
  COMPONENT add_sub IS    -- REPLACE adderSingleBitStructural with the name of this file

    Port ( 	clk_50mhz 	    : in  STD_LOGIC; --Input clock
            op_mode         : in  STD_LOGIC_VECTOR(1 downto 0) := "00";
			a_in			: in  STD_LOGIC_VECTOR(7 downto 0) := "00000000";
			pb_in		    : in  STD_LOGIC_VECTOR(3 downto 0) := "0000";
			--
			hex2	    : out STD_LOGIC_VECTOR(6 downto 0);  --7-seg display outputs (g to a)
			hex1	    : out STD_LOGIC_VECTOR(6 downto 0);  --for 7seg display
			hex0	    : out STD_LOGIC_VECTOR(6 downto 0);
			ledOut      : out STD_LOGIC_VECTOR(3 downto 0) := "0000"
			);
  END COMPONENT;
END PACKAGE add_sub_pkg;


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
--Import Packages from working directory
library work;
USE work.common_pkg.ALL;
USE work.bcd2seven_seg_pkg.ALL;
USE work.edge_detect_pkg.ALL;
USE work.clock_synchronizer_pkg.ALL;
USE work.double_dabble_pkg.ALL;
USE work.alu_pkg.ALL;
USE work.raminfr_pkg.ALL;


entity add_sub is
	Port ( 	clk_50mhz 	    : in  STD_LOGIC; --Input clock
            op_mode         : in  STD_LOGIC_VECTOR(1 downto 0) := "00";
			a_in			: in  STD_LOGIC_VECTOR(7 downto 0) := "00000000";
			--reset_n			: in  STD_LOGIC;
			pb_in		    : in  STD_LOGIC_VECTOR(3 downto 0) := "1111";
			--
			hex2	    : out STD_LOGIC_VECTOR(6 downto 0);  --7-seg display outputs (g to a)
			hex1	    : out STD_LOGIC_VECTOR(6 downto 0);  --for 7seg display
			hex0	    : out STD_LOGIC_VECTOR(6 downto 0);
			ledOut      : out STD_LOGIC_VECTOR(3 downto 0) := "0000" --displays current state
			); 
end add_sub;

architecture count of add_sub is --created implementation
--state definitions
type state_type is (read_work, write_work, write_work_wait, read_save, write_save, write_save_wait); --states
signal current_state, next_state : state_type; --defining what holds the states
--signal declarations 
--synchronized/edge detecting signals (inputs, then internal)
signal pb_sync    : std_logic_vector(3 downto 0) := "0000";
signal a_sync     : std_logic_vector(7 downto 0) := "00000000";
signal reset_edge : std_logic;
signal op_sync    : std_logic_vector(1 downto 0) := "00";

signal execute    : std_logic := '0';
signal memSave    : std_logic := '0';
signal memRstr    : std_logic := '0';

signal load_save  : std_logic := '0';
signal result_en  : std_logic := '0';
signal memAddr    : std_logic := '0';
signal memRWen    : std_logic := '0';

signal result_reg : std_logic_vector(7 downto 0) := "00000000";
signal alu_out    : std_logic_vector(7 downto 0) := "00000000";
signal memOut     : std_logic_vector(7 downto 0) := "00000000";
signal output     : std_logic_vector(7 downto 0) := "00000000";
signal out_12b    : std_logic_vector(11 downto 0):= "000000000000";
--signal pbhold     : std_logic := '0';
--hex output signals
signal hex1s      : std_logic_vector(3 downto 0) := "0000";
signal hex10s     : std_logic_vector(3 downto 0) := "0000";
signal hex100s    : std_logic_vector(3 downto 0) := "0000";
--register signals
-- signal a_reg      : std_logic_vector(7 downto 0) := "00000000";
-- signal b_reg      : std_logic_vector(7 downto 0) := "00000000";
-- signal add_reg    : std_logic_vector(7 downto 0) := "00000000";
-- signal sub_reg    : std_logic_vector(7 downto 0) := "00000000";

begin

--define ALU and RAM units 
alu_def: alu
    port map(
      clock => clk_50mhz,
      reset_n => pb_in(0),
      op_mode => op_sync,
      data_a  => memOut,
      data_b  => a_sync,
      --
      result => alu_out
      );
ramUnit: raminfr 
    generic map(
      addr_width => 1
    )
    port map(
      clock => clk_50mhz,
      reset_n => pb_in(0),
      we_n => memRWen,
      address(0) => memAddr,
      din => output,
      --
      dout => memOut
    );
--define double dabble
hexOuts: double_dabble
    port map(
	  result_padded => out_12b,
      --
	  ones => hex1s,
	  tens => hex10s,
	  hundreds => hex100s
	);
--7 segment display components
hexHund: bcd2seven_seg --output 7seg
port map(
  bcd_number => hex100s,
  --
  seven_segment => hex2
);
hexTen: bcd2seven_seg --A Input 7seg
port map(
  bcd_number => hex10s,
  --
  seven_segment => hex1
);
hexOne: bcd2seven_seg --B Input 7seg
port map(
  bcd_number => hex1s,
  --
  seven_segment => hex0
);
--synchronization definitions
pbSync: clock_synchronizer -- sync push buttons
  generic map (
    bit_width => 3
  )
  port map (
    clock => clk_50mhz,
    reset_n  => pb_in(0),
    async_in => pb_in(3 downto 1),
    --
    sync_out => pb_sync(3 downto 1)
);

opSync: clock_synchronizer -- sync push buttons
  generic map (
    bit_width => 2
  )
  port map (
    clock => clk_50mhz,
    reset_n  => pb_in(0),
    async_in => op_mode,
    --
    sync_out => op_sync
);

-- resetSync: clock_synchronizer -- sync push buttons
  -- generic map (
    -- bit_width => 1
  -- )
  -- port map (
    -- clock => clk_50mhz,
    -- reset_n  => reset_n,
    -- async_in => pb_in(0),
    
    -- sync_out => pb_sync(0)
-- );

resetEdge: edge_detect --detects reset rising edge
port map(
  clock => clk_50mhz,
  reset_n => pb_in(0),
  DataIn  => pb_in(0),
  --
  RisingEdge => reset_edge,
  FallingEdge => open
);

execEdge: edge_detect --detects reset rising edge
port map(
  clock => clk_50mhz,
  reset_n => pb_in(0),
  DataIn  => pb_sync(3),
  --
  RisingEdge => open,
  FallingEdge => execute
);

saveEdge: edge_detect --detects reset rising edge
port map(
  clock => clk_50mhz,
  reset_n => pb_in(0),
  DataIn  => pb_sync(2),
  --
  RisingEdge => open,
  FallingEdge => memSave
);

restoreEdge: edge_detect --detects reset rising edge
port map(
  clock => clk_50mhz,
  reset_n => pb_in(0),
  DataIn  => pb_sync(1),
  --
  RisingEdge => open,
  FallingEdge => memRstr
);

ASync: clock_synchronizer -- sync A Input
  generic map (
    bit_width => 8
  )
  port map (
    clock => clk_50mhz,
    reset_n  => pb_in(0),
    async_in => a_in,
    --
    sync_out => a_sync
);
--transition to next state
--states are: read_work, write_work, write_work_wait, read_save, write_save, write_save_wait
sync: process(clk_50mhz, reset_edge)
	begin
		if(reset_edge = '1') then
			current_state <= read_work;
		elsif(clk_50mhz'event and clk_50mhz = '1') then
			current_state <= next_state;
		end if;
end process;
--uses current state to determine outputs of FSM
logic: process(current_state, op_sync, a_sync, reset_edge, execute, memSave, memRstr)
	begin
		case (current_state) is
			--READ THE WORK REGISTER (8-bit)
			when read_work =>
				--ledOut <= "0001";
                load_save <= '0';
                result_en <= '0';
                memRWen <= '1';  --reading the
                memAddr <= '0'; --work register
				if(execute = '1') then 		--if push button pressed
					next_state <= write_work_wait;  --transition 
				elsif(memSave = '1') then
                    next_state <= write_save;
                elsif(memRstr = '1') then
                    next_state <= read_save;
                else
					next_state <= read_work;  --otherwise stay in current state
				end if;
			--WRITE TO THE WORK REGISTER (8-bit)
			when write_work =>
			    --ledOut <= "0010";
				load_save <= '0';
                result_en <= '0'; --update result
                memRWen <= '0';  --writing the
                memAddr <= '0'; --work register
				next_state <= read_work;
			--WAIT TO WRITE TO WORK register
			when write_work_wait =>
			    --ledOut <= "0010";
				load_save <= '0';
                result_en <= '1'; --update result
                memRWen <= '0';  --writing the
                memAddr <= '0'; --work register
				next_state <= write_work;
			--READ FROM THE SAVE REGISTER
			when read_save =>
			    --ledOut <= "0100";
				load_save <= '1';
                result_en <= '0';
                memRWen <= '1';  --reading the
                memAddr <= '1'; --save register
				next_state <= write_save_wait;  --otherwise stay in current state
			--WRITE TO THE SAVE REGISTER
			when write_save =>
			    --ledOut <= "1000";
				load_save <= '1';
                result_en <= '0';
                memRWen <= '0';  --writing the
                memAddr <= '1'; --save register
				next_state <= write_save_wait;  --otherwise stay in current state
			--WAITING TO WRITE TO THE SAVE register
			when write_save_wait =>
			    --ledOut <= "1000";
				load_save <= '1';
                result_en <= '1';
                memRWen <= '1';  --reading the
                memAddr <= '1'; --save register
				next_state <= write_work;  --otherwise stay in current state
			--OTHERS
			when others =>
				next_state <= read_work;      --if lost go to read work
				
		end case;
end process;

opDisplay: process(clk_50mhz, reset_edge, op_sync)
	begin
		if(reset_edge = '1') then
			ledOut <= "0000";
		else
			case(op_sync) is
				--ADDITION
				when "00" =>
					ledOut <= "0001";   --if adding, first led is on
				--SUBTRACTION
				when "01" =>
					ledOut <= "0010";   --if subtracting, second led is on
				--MULTIPLICATION
				when "10" =>
					ledOut <= "0100";   --if multiplying, third led is on  
				--DIVISION
				when "11" =>
					ledOut <= "1000";   --if dividing, fourth led is on   
				--OTHERS
				when others =>
					ledOut <= "1111";   --if lost, all leds on to signal big oops
			end case;
		end if;
end process;

--picking which output to send to result register
-- if(load_save = '0') then
    -- result_reg <= alu_out;
-- else
    -- result_reg <= memOut;
-- end if;
mux: process(clk_50mhz, load_save, alu_out, memOut)
    begin
        if(reset_edge = '1') then
            result_reg <= "00000000";
        elsif(clk_50mhz'event and clk_50mhz = '1') then
            case(load_save) is
                when '0' =>
                    if(result_en = '1') then
                        result_reg <= alu_out;
                    else
                        result_reg <= result_reg;
                    end if;
                when '1' =>
                    if(result_en = '1') then
                        result_reg <= memOut;
                    else
                        result_reg <= result_reg;
                    end if;
                when others =>
                    result_reg <= result_reg;
            end case;
        end if;
end process;
--process for updating the result register
--alu or memory
regSelect: process(clk_50mhz, result_en, result_reg, output)
	begin
		if(reset_edge = '1') then
			output <= "00000000";
		else
            output <= result_reg;
		end if;
end process;


--================================================
--set output signal to be 12 bits
setOut12b: process(clk_50mhz, reset_edge, current_state, output)
	begin
		if(reset_edge = '1') then
			out_12b <= "000000000000";
		elsif(clk_50mhz'event and clk_50mhz = '1') then
			-- case(current_state) is
				----INPUT A
				-- when input_a =>
					-- out_12b <= "0000" & output;
				----INPUT B                
				-- when input_b =>          
					-- out_12b <= "0000" & output;
				----DISP_SUM
				-- when disp_sum =>
					-- out_12b <= "000" & coutSigA & output;
				----DISP_DIFF
				-- when disp_diff =>
					-- out_12b <= "000" & coutSigS & output;
				--OTHERS
				-- when others =>
					-- out_12b <= out_12b;
			-- end case;
            out_12b <= "0000" & output;
		end if;
end process;

end count;
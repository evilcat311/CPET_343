LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE add_sub_pkg IS
  COMPONENT add_sub IS    -- REPLACE adderSingleBitStructural with the name of this file

    Port ( 	clk_50mhz 	    : in  STD_LOGIC; --Input clock
			a_in			: in  STD_LOGIC_VECTOR(2 downto 0) := "000";
			b_in			: in  STD_LOGIC_VECTOR(2 downto 0) := "000";
			reset_n			: in  STD_LOGIC;
			add				: in  STD_LOGIC := '1';
			subtract		: in  STD_LOGIC := '1';
			--
			hexA	    : out STD_LOGIC_VECTOR(6 downto 0);  --7-seg display outputs (g to a) for 7seg display
			hexB	    : out STD_LOGIC_VECTOR(6 downto 0);
			hexSum	    : out STD_LOGIC_VECTOR(6 downto 0)
			);
  END COMPONENT;
END PACKAGE add_sub_pkg;


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

library work;
USE work.bcd2seven_seg_pkg.ALL;
USE work.generic_adder_beh_pkg.ALL;
USE work.generic_subtractor_beh_pkg.ALL;
USE work.edge_detect_pkg.ALL;
USE work.clock_synchronizer_pkg.ALL;

entity add_sub is
	Port ( 	clk_50mhz 	    : in  STD_LOGIC; --Input clock
			a_in			: in  STD_LOGIC_VECTOR(2 downto 0) := "000"; --input 1
			b_in			: in  STD_LOGIC_VECTOR(2 downto 0) := "000"; -- input 2
			reset_n			: in  STD_LOGIC;
			add				: in  STD_LOGIC := '1'; --input to start adding
			subtract		: in  STD_LOGIC := '1'; --" subtracting
			--
			hexA	    : out STD_LOGIC_VECTOR(6 downto 0);  --7-seg display outputs (g to a) for 7seg display
			hexB	    : out STD_LOGIC_VECTOR(6 downto 0);  -- A & B display the inputs of the same name
			hexSum	    : out STD_LOGIC_VECTOR(6 downto 0)   --displays the output
			); 
end add_sub;

architecture count of add_sub is --created implementation
--signal declarations 
signal a_sync	: std_logic_vector(2 downto 0) := "000";
signal b_sync	: std_logic_vector(2 downto 0) := "000";
signal reset_edge : std_logic;
signal add_sync : std_logic;
signal add_hold : std_logic := '0';
signal add_out : std_logic_vector(3 downto 0) := "0010";
signal sub_out : std_logic_vector(3 downto 0) := "0100";
signal sub_sync : std_logic;
signal sub_hold : std_logic := '0';
signal sum : std_logic_vector(3 downto 0) := "0000";
signal a_4bit : std_logic_vector(3 downto 0) := "0000";
signal b_4bit : std_logic_vector(3 downto 0) := "0000";

begin

--define add and subtract units 
gen_add: generic_adder_beh --adder
	port map(
	  a => a_4bit,
	  b => b_4bit,
	  cin => '0',
	  --
	  sum => add_out,
	  cout => open
	);
gen_sub: generic_subtractor_beh --subtractor
	port map(
	  a => a_4bit,
	  b => b_4bit,
	  cin => '0',
	  --
	  sum => sub_out,
	  cout => open
	);
--7 segment display components
hexOutput: bcd2seven_seg --output 7seg
port map(
  bcd_number => sum,
  --
  seven_segment => hexSum
);
aConvert: bcd2seven_seg --A Input 7seg
port map(
  bcd_number => a_4bit,
  --
  seven_segment => hexA
);
bConvert: bcd2seven_seg --B Input 7seg
port map(
  bcd_number => b_4bit,
  --
  seven_segment => hexB
);
--synchronization definitions
resetEdge: edge_detect --detects reset rising edge
port map(
  clock => clk_50mhz,
  reset_n => reset_edge,
  DataIn  => reset_n,
  --
  RisingEdge => reset_edge,
  FallingEdge => open
);
ASync: clock_synchronizer -- sync A Input
  generic map (
    bit_width => 3
  )
  port map (
    clock => clk_50mhz,
    reset_n  => reset_n,
    async_in => a_in,
    --
    sync_out => a_sync
);
BSync: clock_synchronizer -- sync B Input
  generic map (
    bit_width => 3
  )
  port map (
    clock => clk_50mhz,
    reset_n  => reset_n,
    async_in => b_in,
    --
    sync_out => b_sync
);
addEdge: edge_detect --detects addition rising edge
port map(
  clock => clk_50mhz,
  reset_n => reset_n,
  DataIn  => add,
  --
  RisingEdge => open,
  FallingEdge => add_sync
);
subEdge: edge_detect --detects addition rising edge
port map(
  clock => clk_50mhz,
  reset_n => reset_n,
  DataIn  => subtract,
  --
  RisingEdge => open,
  FallingEdge => sub_sync
);
--choose whether to add or subtract ( could be async but this feels more clean)
whichFunc : PROCESS(add_sync, sub_sync) is
  BEGIN
    IF(add_sync = '1') THEN
		add_hold <= '1';
		sub_hold <= '0';
	ELSIF(sub_sync = '1') THEN
		add_hold <= '0';
		sub_hold <= '1';
	END IF;
  END PROCESS whichFunc;
--determines whether to take add or sub output (could be more efficient but not in scope
											--  of this lab)
output : PROCESS(a_in, b_in, reset_n, add_hold, sub_hold) IS
  BEGIN
    --IF (reset_edge = '1') THEN
      --enable    <= '0';
    -- IF rising_edge(clk_50mhz) THEN
      -- IF (enable = '1') THEN
	    -- IF(sum = "1010") THEN
		   -- sum_reg <= "0000";
		-- Else
		   -- sum_reg <= sum;
		-- END IF;
      -- END IF;
    -- END IF;
	IF (add_hold = '1' and sub_hold = '0') THEN
		sum <= add_out;
	ELSIF (add_hold = '0' and sub_hold =  '1') THEN
		sum <= sub_out;
	ELSE
		sum <= sum;
	END IF;
  END PROCESS output;
a_4bit <= ('0' & a_sync);
b_4bit <= ('0' & b_sync);
end count;
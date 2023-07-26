--*****************************************************************************
--*****************************   VHDL Source Code  ***************************
--*****************************************************************************
--
--  DESIGNER NAME: Link
--
--      FILE NAME: bcd2seven_seg_tb.vhd
--
------------------------------------------------------------------------------
-- DESCRIPTION 
--     
--    This file will create seven segment test bench. 
--
--*****************************************************************************
--*****************************************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;
USE work.bcd2seven_seg_pkg.ALL;
USE work.generic_adder_beh_pkg.ALL;
USE work.generic_subtractor_beh_pkg.ALL;
USE work.edge_detect_pkg.ALL;
USE work.clock_synchronizer_pkg.ALL;
USE work.add_sub_pkg.ALL;
USE work.processor_pkg.ALL;

ENTITY processor_tb IS
END processor_tb;

ARCHITECTURE arch OF processor_tb IS
  SIGNAL sim_done : boolean   := false;
  -- Constants for test bench design
  CONSTANT PERIOD_c    : time    := 20 ns;
  CONSTANT MAX_COUNT_c : integer := 7;

  -- signals for test bench design
  SIGNAL a_tb : std_logic_vector(7 DOWNTO 0) := "00000000";
  SIGNAL op_tb: std_logic_vector(1 downto 0) := "00";
  --SIGNAL b_tb : std_logic_vector(7 DOWNTO 0) := "00000000";
  
  SIGNAL hex2_tb      : std_logic_vector(6 DOWNTO 0) := (OTHERS => '0');
  SIGNAL hex1_tb        : std_logic_vector(6 DOWNTO 0) := (OTHERS => '0');
  SIGNAL hex0_tb        : std_logic_vector(6 DOWNTO 0) := (OTHERS => '0');
  SIGNAL ledout_tb      : std_logic_vector(3 downto 0) := (OTHERS => '0');
  SIGNAL clk_tb         : std_logic := '0';
  signal reset_tb     : std_logic := '1';
  signal exe_tb         : std_logic := '1';

  -- create a new type, an array seven-segment values (ie: 2D array)
  TYPE seven_seg_t IS ARRAY (0 TO 16) OF std_logic_vector (6 DOWNTO 0);
  SIGNAL seven_seg_values : seven_seg_t := (
                          ZERO_c, ONE_c, TWO_c, THREE_c, FOUR_c, FIVE_c,
                          SIX_c, SEVEN_c, EIGHT_c, NINE_c, A_c, B_c, C_c, 
						  D_c, E_c, F_c, BLANK_c);

PROCEDURE Cycle_Pushbutton (signal pb_n : out std_logic) is
BEGIN
    pb_n <= '0';
    WAIT FOR 5*PERIOD_c;
    
    pb_n <= '1';
    WAIT FOR 5*PERIOD_c;
    
END PROCEDURE Cycle_Pushbutton;

BEGIN
clk_tb <= NOT clk_tb AFTER PERIOD_c/2 WHEN (NOT sim_done) ELSE '0';
--pb_tb <= NOT pb_tb AFTER 60ns WHEN (NOT sim_done) ELSE '0';
  -- instantiate the Unit Under Test
  UUT : processor PORT MAP(
    clk_50mhz   => clk_tb,
	reset       => reset_tb,
	execute	    => exe_tb,
	--
	hex2	    => hex2_tb,
	hex1	    => hex1_tb,    
	hex0	    => hex0_tb,
	ledOut      => ledout_tb 
);
   

  -----------------------------------------------------------------------------
  -- PROCESS: Stimulus will generate a counter that counts from 0 to max count
  -- and then stop. For each input, out will be verified.
  -----------------------------------------------------------------------------
  stimulus : PROCESS
  BEGIN
	reset_tb <= '0';
    wait for 1*PERIOD_c;
    reset_tb <= '1';
    -- now lets sync the stimulus to the clock
    -- and move data off clock edge
    WAIT UNTIL (clk_tb'event and clk_tb = '1');
    
    Cycle_Pushbutton(exe_tb); --Proceed to 1
    Wait for 4*PERIOD_c;
    
    Cycle_Pushbutton(exe_tb); --Proceed to 2
    Wait for 4*PERIOD_c;
    
    Cycle_Pushbutton(exe_tb); --Proceed to 3
    Wait for 4*PERIOD_c;
    
    Cycle_Pushbutton(exe_tb); --Proceed to 4
    Wait for 4*PERIOD_c;
    
    Cycle_Pushbutton(exe_tb); --Proceed to 5
    Wait for 4*PERIOD_c;
    
    Cycle_Pushbutton(exe_tb); --Proceed to 6
    Wait for 4*PERIOD_c;
    
    Cycle_Pushbutton(exe_tb); --Proceed to 7
    Wait for 4*PERIOD_c;
    
    Cycle_Pushbutton(exe_tb); --Proceed to 8
    Wait for 4*PERIOD_c;

    -- we are done to wait two more clocks & set flag sim_done to true
    WAIT FOR 2 * PERIOD_c;
    WAIT UNTIL clk_tb = '0';
    sim_done <= true;

    -- Added a simple message to say we are done
    REPORT "Simulation Completed Successfully.";

    WAIT;                               -- wait here forever
END PROCESS;

END ARCHITECTURE arch;

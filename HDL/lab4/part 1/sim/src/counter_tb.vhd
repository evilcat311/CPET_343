--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Connor Ott
--
--       LAB NAME:  Lab4: Seven Segment Display Counter; test bench
--
--      FILE NAME:  counter.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will test the top level design of the counter. 
--
--
-------------------------------------------------------------------------------
--
--  REVISION HISTORY
--
--  _______________________________________________________________________
-- |  DATE    | USER | Ver |  Description                                  |
-- |==========+======+=====+================================================
-- |          |      |     |
-- | 06/14/23 | CMO  | 1.0 | Created
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************
-------------------------------------------------------------------------------

-- include ieee packages here
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

-- include your packages here
LIBRARY work;
-- USE work.top_pkg.ALL;

ENTITY counter_tb IS

END ENTITY counter_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF counter_tb IS

    COMPONENT top IS
      PORT (
        CLOCK_50 : IN  std_logic;
        reset    : IN  std_logic;
        HEX0     : OUT std_logic_vector(6 DOWNTO 0)
      );
    END COMPONENT;
    
    SIGNAL clk_tb    : std_logic := '0';
    SIGNAL reset_tb    : std_logic := '0';
    SIGNAL hex0_tb   : std_logic_vector(6 downto 0);
    SIGNAL sim_done  : boolean := false;
    
    CONSTANT PERIOD_c   : time := 20 ns;
    
BEGIN  -- test

    clk_tb <= NOT clk_tb AFTER (PERIOD_c / 2) WHEN (NOT sim_done) ELSE '0';
    
    ---------------------------------------------------------------------------
    -- instantiate the unit under test (UUT)
    ---------------------------------------------------------------------------
    UUT : top
    PORT MAP (
      CLOCK_50 => clk_tb,
      reset => reset_tb,
      HEX0 => hex0_tb
    );

    stimulus : PROCESS
    BEGIN
    
      reset_tb <= '1';
      WAIT FOR 2 * PERIOD_c;
      reset_tb <= '0';
      WAIT FOR 200 * PERIOD_c;
      
      sim_done <= true;
      WAIT FOR PERIOD_c;
      
      wait;
    END PROCESS  stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------

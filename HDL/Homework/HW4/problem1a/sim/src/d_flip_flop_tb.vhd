--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  
--
--       LAB NAME:  Homework 4 - Question 1a; testbench
--
--      FILE NAME:  d_flip_flop_tb.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will <insert detailed description of design>. 
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
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************

-- include ieee packages here
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- include your packages here
LIBRARY work;
USE work.d_flip_flop_pkg.ALL;


ENTITY d_flip_flop_tb IS

END ENTITY d_flip_flop_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF d_flip_flop_tb IS

  SIGNAL clk_tb    : std_logic := '0';
  SIGNAL data_tb   : std_logic := '0';
  SIGNAL que_tb    : std_logic := '0';
  SIGNAL sim_done  : boolean   := false;
  
  CONSTANT PERIOD_C : time := 20 ns;  
 
BEGIN  -- test

    clk_tb <= NOT clk_tb AFTER (PERIOD_C / 2) WHEN (NOT sim_done) ELSE '0';
    
    ---------------------------------------------------------------------------
    -- instantiate the unit under test (UUT)
    ---------------------------------------------------------------------------
    UUT : d_flip_flop 
    PORT MAP (
      data => data_tb,
      clk => clk_tb,
      que => que_tb
    );
    
    ---------------------------------------------------------------------------
    -- the process will apply the test vectors to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
    BEGIN  -- PROCESS stimulus
    
      REPORT "Starting simulation...";
    
      data_tb <= '0';
      WAIT FOR PERIOD_C;
      
      WAIT UNTIL (clk_tb'event AND clk_tb = '1');
      WAIT FOR 2 ns;
      
      WAIT FOR PERIOD_C;
      
      ASSERT (data_tb = que_tb)
        REPORT "Failed simulation: Data expected to be 0, received 1"
        SEVERITY failure;
        
      data_tb <= '1';
      WAIT FOR PERIOD_C;
      
      WAIT UNTIL (clk_tb'event AND clk_tb = '1');
      WAIT FOR 2 ns;
      
      WAIT FOR PERIOD_C;
      
      ASSERT (data_tb = que_tb)
        REPORT "Failed simulation: Data expected to be 1, received 0"
        SEVERITY failure;
        
      WAIT FOR 2 * PERIOD_C;
      sim_done <= true;
      WAIT FOR  PERIOD_C;
      
      REPORT "Simulation completed successfully...";
      -----------------------------------------------------------------------
      -- stop simulation, wait here forever
      -----------------------------------------------------------------------
      wait;
    END PROCESS stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------

--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME: 
--
--       LAB NAME:  Homework 4 - Question 2; testbench
--
--      FILE NAME:  jk_flip_flop_tb.vhd
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
-------------------------------------------------------------------------------

-- include ieee packages here
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- include your packages here
LIBRARY work;
USE work.jk_flip_flop_pkg.ALL;


ENTITY jk_flip_flop_tb IS

END ENTITY jk_flip_flop_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF jk_flip_flop_tb IS

  SIGNAL j_tb         : std_logic := '0';
  SIGNAL k_tb         : std_logic := '0';
  SIGNAL preset_n_tb  : std_logic := '0';
  SIGNAL clear_n_tb   : std_logic := '0';
  SIGNAL clk_tb       : std_logic := '0';
  
  SIGNAL que_tb       : std_logic;
  SIGNAL que_n_tb     : std_logic;
  
  SIGNAL sim_done     : boolean   := false;

  TYPE test_vector IS ARRAY(0 to 15) OF std_logic_vector(5 downto 0);
  
  -- Test Cases Format:
  -- Preset Clear J K Q Q_n
  -- 5 downto 0
  CONSTANT test_cases : test_vector := (
      "000011",
      "000111",
      "001011",
      "001111",
      "010010",
      "010110",
      "011010",
      "011110",
      "100001",
      "100101",
      "101001",
      "101101",
      "110001",
      "1101HH",
      "1110--",
      "111110"
    );
  CONSTANT PERIOD_c   : time := 20 ns;
  
BEGIN  -- test

    clk_tb <= NOT clk_tb AFTER (PERIOD_c / 2) WHEN (NOT sim_done) ELSE '0';

    ---------------------------------------------------------------------------
    -- instantiate the unit under test (UUT)
    ---------------------------------------------------------------------------
    UUT : jk_flip_flop 
    PORT MAP (
      j => j_tb,
      k => k_tb,
      clk => clk_tb,
      preset_n => preset_n_tb,
      clear_n => clear_n_tb,
      que => que_tb,
      que_n => que_n_tb
    );


    ---------------------------------------------------------------------------
    -- the process will apply the test vectors to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
      VARIABLE expected_que, expected_que_n : std_logic := '0';
    BEGIN 
    
      REPORT "Simulation starting...";
      
      j_tb <= '0';
      k_tb <= '0';
      preset_n_tb <= '0';
      clear_n_tb <= '0';
      
      WAIT UNTIL (clk_tb'event AND clk_tb = '1');
      WAIT FOR PERIOD_c;
        
      FOR ind IN 0 TO 15 LOOP
      
        -- Assign the input signals from the test case performed
        (preset_n_tb, clear_n_tb) <= test_cases(ind)(5 downto 4);
        WAIT FOR 2 ns;
        (j_tb, k_tb) <= test_cases(ind)(3 downto 2);
        
        
        IF(test_cases(ind)(5 downto 2) = "1110") THEN
          expected_que   := que_n_tb;
          expected_que_n := que_tb;
        ELSIF(test_cases(ind)(5 downto 2) = "1101") THEN
          expected_que   := que_tb;
          expected_que_n := que_n_tb;
        ELSE
          expected_que   := test_cases(ind)(1);
          expected_que_n := test_cases(ind)(0);
        END IF;
        
        WAIT FOR PERIOD_c;

        ASSERT(que_tb = expected_que)
            REPORT "Failed test. Case: " & integer'image(ind) &
                   " for que with value " & std_logic'image(expected_que) &
                   " expected " & std_logic'image(test_cases(ind)(1))
            SEVERITY warning;
            
        ASSERT(que_n_tb = expected_que_n)
          REPORT "Failed test. Case: " & integer'image(ind) &
                 " for que_n with value " & std_logic'image(expected_que_n) &
                 " expected " & std_logic'image(test_cases(ind)(0))
          SEVERITY warning;
          
        REPORT "Test case " & integer'image(ind) & " completed successfully.";
        
        WAIT FOR PERIOD_c;
          
      END LOOP;

      REPORT "Simulation completed successfully...";
      WAIT FOR PERIOD_c;
      sim_done <= true;
      WAIT FOR PERIOD_c;
      
      wait;
    END PROCESS stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------

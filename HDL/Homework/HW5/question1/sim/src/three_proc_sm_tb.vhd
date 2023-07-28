-- include ieee packages here
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- include your packages here
LIBRARY work;
USE work.three_proc_sm_pkg.ALL;


ENTITY three_proc_sm_tb IS

END ENTITY three_proc_sm_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF three_proc_sm_tb IS

  SIGNAL reset_n_tb          : std_logic := '0';
  SIGNAL clk_tb              : std_logic := '0';
  SIGNAL serial_bit_tb       : std_logic := '0';
  
  SIGNAL pattern_found_tb    : std_logic;
  
  SIGNAL sim_done            : boolean   := false;
  
  -- Test vector contains:
  --  9 test cases, 8 failure and 1 success
  --  Each test case contains an MSB which is the desired result and the rest is the test vec
  TYPE test_vect_t IS ARRAY(0 to 8) OF std_logic_vector(7 downto 0); 
  
  CONSTANT PERIOD_c          : time         := 20 ns;
  CONSTANT TEST_CASES_c      : test_vect_t  := (
    "01101011", -- FAIL - bit 1 incorrect
    "10101011", -- FAIL - bit 2 incorrect
    "11001011", -- FAIL - bit 3 incorrect
    "11111011", -- FAIL - bit 4 incorrect
    "11100011", -- FAIL - bit 5 incorrect
    "11101111", -- FAIL - bit 6 incorrect
    "11101001", -- FAIL - bit 7 incorrect
    "11101010", -- FAIL - bit 8 incorrect
    "11101011"  -- SUCCESS
  );
  
BEGIN  -- test

    clk_tb <= NOT clk_tb AFTER (PERIOD_c / 2) WHEN (NOT sim_done) ELSE '0';

    UUT : three_proc_sm
    PORT MAP (
      reset_n => reset_n_tb,
      clk => clk_tb,
      serial_bit => serial_bit_tb,
      --
      pattern_found => pattern_found_tb
    );


    stimulus : PROCESS
      VARIABLE serial_signal_v : std_logic_vector(0 to 7);
    BEGIN  -- PROCESS stimulus
      
      -- Assign signals
      reset_n_tb <= '0';
      serial_bit_tb <= '0';

      -- Reset the system before testing
      reset_n_tb <= '0';
      WAIT FOR PERIOD_c * 2;
      reset_n_tb <= '1';
      -- WAIT FOR PERIOserial_signal_v(s_bit)D_c;
      
      -- Check if reset works
      ASSERT (pattern_found_tb = '0')
        REPORT "Reset is not working"
        SEVERITY failure;
      
      -- Iterate through the test case vector
      test_iter : FOR test_case_ind IN 1 TO (TEST_CASES_c'length-1) LOOP
        REPORT "Test case " & integer'image(test_case_ind) & " starting.";
      
        serial_signal_v := TEST_CASES_c(test_case_ind);
        
        -- Assign serial bit one at a time
        ser_bit_iter : FOR s_bit IN 0 TO (serial_signal_v'length-1) LOOP
          -- Assign individual bit
          serial_bit_tb <= serial_signal_v(s_bit);
          
          -- Looking for a HIGH ouput only for the last test case
          -- Only test when at the last bit. 
          IF(s_bit = 8 AND test_case_ind = (TEST_CASES_c'length-1)) THEN
            ASSERT(pattern_found_tb = '1')
              REPORT "Test case " & integer'image(test_case_ind) & " failed. " & std_logic'image(pattern_found_tb) & std_logic'image(PATTERN_TO_FOLLOW_c(s_bit))
              SEVERITY warning;
          ELSIF(s_bit = 8) THEN
            ASSERT(pattern_found_tb = '0')
              REPORT "Test case " & integer'image(test_case_ind) & " failed. " & std_logic'image(pattern_found_tb) & std_logic'image(PATTERN_TO_FOLLOW_c(s_bit))
              SEVERITY warning;
          END IF;
          
          WAIT FOR PERIOD_c;
        END LOOP ser_bit_iter;
        
        REPORT "Test case " & integer'image(test_case_ind) & " successful.";
      END LOOP test_iter;

      WAIT FOR PERIOD_c;
      sim_done <= true;
      WAIT FOR PERIOD_c;
      -----------------------------------------------------------------------
      -- stop simulation, wait here forever
      -----------------------------------------------------------------------
      wait;
    END PROCESS stimulus;

END ARCHITECTURE test;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE one_hot_fsm_pkg IS
  COMPONENT one_hot_fsm IS
    PORT (
      reset_n        : IN std_logic;
      clk            : IN std_logic;
      serial_bit     : IN std_logic;
      --
      pattern_found  : OUT std_logic
    );
  END COMPONENT;
  
  CONSTANT PATTERN_TO_FOLLOW_c : std_logic_vector(0 to 7) := "11101011";
  
END PACKAGE one_hot_fsm_pkg;



------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY work;
USE work.one_hot_fsm_pkg.ALL;

ENTITY one_hot_fsm IS
  PORT (
    reset_n        : IN std_logic;
    clk            : IN std_logic;
    serial_bit     : IN std_logic;
    --
    pattern_found  : OUT std_logic
  );
END ENTITY one_hot_fsm;

ARCHITECTURE behave OF one_hot_fsm IS
  
  TYPE sm_states_t IS (IDLE_BIT_1, BIT_2, BIT_3, BIT_4, BIT_5, BIT_6, BIT_7, BIT_8);
  
  SIGNAL curr_state : sm_states_t;
  SIGNAL next_state : sm_states_t;

  ATTRIBUTE syn_encoding : string;
  ATTRIBUTE syn_encoding OF sm_states_t : TYPE IS "one-hot, Safe";
  
BEGIN

  update_proc : PROCESS(reset_n, clk) IS
  BEGIN
    IF(reset_n = '0') THEN
      curr_state <= IDLE_BIT_1;
    ELSIF(rising_edge(clk)) THEN
      curr_state <= next_state;
    END IF;
  END PROCESS update_proc;
  
  main : PROCESS(serial_bit, curr_state) IS
  BEGIN
    CASE(curr_state) IS
      WHEN IDLE_BIT_1 =>
        -- Output the 0 because sequence not complete
        pattern_found <= '0';
      
        -- Check the bit with respective state
        IF(serial_bit = PATTERN_TO_FOLLOW_c(0)) THEN
          next_state <= BIT_2;
        ELSE
          next_state <= IDLE_BIT_1;
        END IF;
      WHEN BIT_2 =>
        -- Output the 0 because sequence not complete
        pattern_found <= '0';
      
        -- Check the bit with respective state
        IF(serial_bit = PATTERN_TO_FOLLOW_c(1)) THEN
          next_state <= BIT_3;
        ELSE
          next_state <= IDLE_BIT_1;
        END IF;
      WHEN BIT_3 =>
        -- Output the 0 because sequence not complete
        pattern_found <= '0';
      
        -- Check the bit with respective state
        IF(serial_bit = PATTERN_TO_FOLLOW_c(2)) THEN
          next_state <= BIT_4;
        ELSE
          next_state <= IDLE_BIT_1;
        END IF;
      WHEN BIT_4 =>
        -- Output the 0 because sequence not complete
        pattern_found <= '0';
      
        -- Check the bit with respective state
        IF(serial_bit = PATTERN_TO_FOLLOW_c(3)) THEN
          next_state <= BIT_5;
        ELSE
          next_state <= IDLE_BIT_1;
        END IF;
      WHEN BIT_5 =>
        -- Output the 0 because sequence not complete
        pattern_found <= '0';
      
        -- Check the bit with respective state
        IF(serial_bit = PATTERN_TO_FOLLOW_c(4)) THEN
          next_state <= BIT_6;
        ELSE
          next_state <= IDLE_BIT_1;
        END IF;
      WHEN BIT_6 =>
        -- Output the 0 because sequence not complete
        pattern_found <= '0';
      
        -- Check the bit with respective state
        IF(serial_bit = PATTERN_TO_FOLLOW_c(5)) THEN
          next_state <= BIT_7;
        ELSE
          next_state <= IDLE_BIT_1;
        END IF;
      WHEN BIT_7 =>
        -- Output the 0 because sequence not complete
        pattern_found <= '0';
      
        -- Check the bit with respective state
        IF(serial_bit = PATTERN_TO_FOLLOW_c(6)) THEN
          next_state <= BIT_8;
        ELSE
          next_state <= IDLE_BIT_1;
        END IF;
      WHEN BIT_8 =>
        -- Check the bit with respective state
        IF(serial_bit = PATTERN_TO_FOLLOW_c(7)) THEN
          -- Output the 1 because sequence complete and serial bit correct
          pattern_found <= '1';
        ELSE 
          -- Serial bit not valid 
          pattern_found <= '0';
        END IF;
        next_state <= IDLE_BIT_1;
    END CASE;
  END PROCESS main;

END ARCHITECTURE behave;
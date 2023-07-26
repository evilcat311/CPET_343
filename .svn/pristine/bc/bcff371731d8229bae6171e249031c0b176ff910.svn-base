--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Lab 6 - 8-bit Hardware Add/Subtract with State Machine
--
--      FILE NAME:  calculator_fsm.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will create a state machine that takes two 8-bit numbers as
--    inputs. In the first two states the inputs are requested, third state
--    displays the output for addition, and fourth state displays the subtraction. 
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
-- | 10/07/20 | ACS  | 1.0 | Created
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************

------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- ||||                                                                   ||||
-- ||||                    COMPONENT PACKAGE                              ||||
-- ||||                                                                   ||||
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE calculator_fsm_pkg IS
  COMPONENT calculator_fsm IS   
    PORT (
      clock      : IN  std_logic;
      reset_n    : IN  std_logic;
      exe_n      : IN  std_logic;
      --
      led        : OUT std_logic_vector(8 downto 0);
      op_code    : OUT std_logic_vector(1 downto 0);
      inp_a_en   : OUT std_logic;
      inp_b_en   : OUT std_logic
    );
  END COMPONENT;
END PACKAGE calculator_fsm_pkg;



------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY calculator_fsm IS
  PORT (
    clock      : IN  std_logic;
    reset_n    : IN  std_logic;
    exe_n      : IN  std_logic;
    --
    led        : OUT std_logic_vector(8 downto 0);
    op_code    : OUT std_logic_vector(1 downto 0);
    inp_a_en   : OUT std_logic;
    inp_b_en   : OUT std_logic
  );
END ENTITY calculator_fsm;

ARCHITECTURE behave OF calculator_fsm IS

  TYPE states_t IS (INPUT_A, INPUT_B, DISP_SUM, DISP_DIFF);
  
  SIGNAL curr_state : states_t;
  SIGNAL next_state : states_t;
  
BEGIN
  
  ----------------------------------------
  --          State Transition          --
  ----------------------------------------
  state_change : PROCESS(reset_n, clock) IS
  BEGIN
    IF(reset_n = '0') THEN
      curr_state <= INPUT_A;
    ELSIF(rising_edge(clock)) THEN
      curr_state <= next_state;
    END IF;
  END PROCESS state_change;
  ----------------------------------------
  --        END State Transition        --
  ----------------------------------------
  
  
  ----------------------------------------
  -- State Transition Logic and Outputs --
  ----------------------------------------
  state_logic : PROCESS(exe_n, curr_state) IS
  BEGIN
    CASE(curr_state) IS
      WHEN INPUT_A =>
        -- Output
        led <= "000001000";
        op_code <= "00";
        -- Enable writing new value to input a, disable input b
        inp_a_en <= '1';
        inp_b_en <= '0';
        
        -- State Transition Logic
        IF(exe_n = '0') THEN
          next_state <= INPUT_B;
        ELSE
          next_state <= INPUT_A;
        END IF;
      WHEN INPUT_B => 
        -- Output
        led <= "000001100";
        op_code <= "00";
        -- Enable writing new value to input b, disable input a
        inp_a_en <= '0';
        inp_b_en <= '1';
        
        -- State Transition Logic
        IF(exe_n = '0') THEN
          next_state <= DISP_SUM;
        ELSE
          next_state <= INPUT_B;
        END IF;
      WHEN DISP_SUM => 
        -- Output
        led <= "000001110";
        op_code <= "10";
        -- Disable writing new value to input a and input b
        inp_a_en <= '0';
        inp_b_en <= '0';
        
        -- State Transition Logic
        IF(exe_n = '0') THEN
          next_state <= DISP_DIFF;
        ELSE
          next_state <= DISP_SUM;
        END IF;
      WHEN DISP_DIFF => 
        -- Output
        led <= "000001111";
        op_code <= "01";
        -- Disable writing new value to input a and input b
        inp_a_en <= '0';
        inp_b_en <= '0';
        
        -- State Transition Logic
        IF(exe_n = '0') THEN
          next_state <= INPUT_A;
        ELSE
          next_state <= DISP_DIFF;
        END IF;
    END CASE;
  END PROCESS state_logic;
  ----------------------------------------
  --  END Transition Logic and Outputs  --
  ----------------------------------------

END ARCHITECTURE behave;

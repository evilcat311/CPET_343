--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Lab 5 - 3-Bit Hardware Add and Subtract; testbench
--
--      FILE NAME:  calculator_tb.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will test the top level calculator module.
--
-------------------------------------------------------------------------------
--
--  REVISION HISTORY
--
--  _______________________________________________________________________
-- |  DATE    | USER | Ver |  Description                                  |
-- |==========+======+=====+================================================
-- |          |      |     |
-- | 10/01/20 | ACS  | 1.0 | Created
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
USE work.calculator_pkg.ALL;


ENTITY calculator_tb IS

END ENTITY calculator_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF calculator_tb IS

  SIGNAL clk_tb       : std_logic := '0';
  SIGNAL sw_tb        : std_logic_vector(9 downto 0);
  SIGNAL op_inp_tb    : std_logic_vector(3 downto 0); -- To test addition/subtraction op inputs
  --
  SIGNAL HEX0_tb      : std_logic_vector(6 downto 0);
  SIGNAL HEX2_tb      : std_logic_vector(6 downto 0);
  SIGNAL HEX4_tb      : std_logic_vector(6 downto 0);
  --
  SIGNAL sim_done     : boolean :=  false;
  
  CONSTANT PERIOD_c   : time := 20 ns;  -- 50 MHz
    
BEGIN  -- test

    clk_tb <= NOT clk_tb AFTER (PERIOD_c / 2) WHEN (NOT sim_done) ELSE '0';
    
    ---------------------------------------------------------------------------
    -- instantiate the unit under test (UUT)
    ---------------------------------------------------------------------------
    UUT : calculator
    PORT MAP (
      CLOCK_50 => clk_tb,
      SW => sw_tb,
      KEY => op_inp_tb,
      --
      HEX0 => HEX0_tb,
      HEX2 => HEX2_tb,
      HEX4 => HEX4_tb
    );


    ---------------------------------------------------------------------------
    -- the process will apply the test vectors to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
    BEGIN  -- PROCESS stimulus
    
    sw_tb <= (others => '0');
    op_inp_tb <= (others => '0');

      -- Allow the system to reset to initial state
      sw_tb(9) <= '0';
      WAIT FOR PERIOD_c * 2;
      sw_tb(9) <= '1';
      WAIT FOR PERIOD_c;
      
      -- Iterate over possible key press states
      ops_iter : FOR op_code IN 0 TO ((2**op_inp_tb'length)-1) LOOP
        op_inp_tb <= std_logic_vector(to_unsigned(op_code, op_inp_tb'length));
        
        -- Iterate over all switch position combinations
        sw_iter : FOR sw_status IN 0 TO ((2**sw_tb'length)-1) LOOP
          sw_tb <= std_logic_vector(to_unsigned(sw_status, sw_tb'length)) OR "1000000000";
          
          WAIT FOR PERIOD_c;
          -- Once all values for 6-bits tested exit loop for switches
          -- Once all values for 2-bits tested exit loop for operation codes
          -- Prevent unnecessary iterations
          EXIT sw_iter WHEN (sw_tb(6) = '1');
          EXIT ops_iter WHEN (op_inp_tb(2) = '1');
        
        END LOOP sw_iter;
      END LOOP ops_iter;
      
      sim_done <= true;
      WAIT FOR PERIOD_c;
      
      -- End simulation
      wait;
    END PROCESS stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------

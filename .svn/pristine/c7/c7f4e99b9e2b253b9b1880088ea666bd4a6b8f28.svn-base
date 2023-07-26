--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Lab 5 - 3-Bit Hardware Add and Subtract; testbench
--
--      FILE NAME:  add_sub_tb.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will test the addition and subtraction module.
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
USE work.add_sub_pkg.ALL;


ENTITY add_sub_tb IS

END ENTITY add_sub_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF add_sub_tb IS

  SIGNAL op_code_tb    : std_logic_vector(1 downto 0);
  SIGNAL inp_a_tb      : std_logic_vector(2 downto 0);
  SIGNAL inp_b_tb      : std_logic_vector(2 downto 0);
  SIGNAL op_enabled_tb : std_logic;
  SIGNAL result_tb     : std_logic_vector(3 downto 0);
    
BEGIN  -- test

    UUT : add_sub 
    PORT MAP (
      op_code    => op_code_tb,
      inp_a      => inp_a_tb,
      inp_b      => inp_b_tb,
      op_enabled => op_enabled_tb,
      result     => result_tb
    );

    stimulus : PROCESS
    BEGIN  -- PROCESS stimulus
    
      op_code_tb <= (others => '0');
      inp_a_tb <= (others => '0');
      inp_b_tb <= (others => '0');
      -- result_tb <= (others => '0');
      WAIT FOR 20 ns;

      -- Use op_code_tb in place of a counter signal
      FOR op IN 0 TO ((2**op_code_tb'length)-1) LOOP
        op_code_tb <= std_logic_vector(to_unsigned(op, op_code_tb'length));
        
        -- Loop over inputs a and b to test all values
        FOR a IN 0 TO ((2**inp_a_tb'length)-1) LOOP
          FOR b IN 0 TO ((2**inp_b_tb'length)-1) LOOP
            inp_b_tb <= std_logic_vector(to_unsigned(b, inp_b_tb'length));
            WAIT FOR 20 ns;
          END LOOP;
          
          inp_a_tb <= std_logic_vector(to_unsigned(a, inp_a_tb'length));
        END LOOP;
        
      END LOOP;

      -----------------------------------------------------------------------
      -- stop simulation, wait here forever
      -----------------------------------------------------------------------
      wait;
    END PROCESS stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------

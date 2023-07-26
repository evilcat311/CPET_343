--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  
--
--       LAB NAME:  Homework 3 - Full Adder 3 bit; test bench
--
--      FILE NAME:  full_adder_3bit_tb.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will test the design of the 3-bit full adder. 
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
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

-- include your packages here
LIBRARY work;
USE work.full_adder_3bit_pkg.ALL;


ENTITY full_adder_3bit_tb IS

END ENTITY full_adder_3bit_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF full_adder_3bit_tb IS
    
  SIGNAL count   : STD_LOGIC_VECTOR(6 DOWNTO 0);
  SIGNAL a_tb    : STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL b_tb    : STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL cin_tb  : STD_LOGIC;
  SIGNAL sum_tb  : STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL cout_tb : STD_LOGIC;
  
  SIGNAL answer  : STD_LOGIC_VECTOR(3 DOWNTO 0);
  
BEGIN  -- test


    ---------------------------------------------------------------------------
    -- instantiate the unit under test (UUT)
    ---------------------------------------------------------------------------
    UUT : full_adder_3bit 
    PORT MAP (
       a => a_tb,
     b => b_tb,
     cin => cin_tb,
     sum => sum_tb,
     cout => cout_tb
    );

    a_tb <= count(2 downto 0);
  b_tb <= count(5 downto 3);
  cin_tb <= count(6);

    answer <= ('0' & a_tb) + ('0' & b_tb) + ("000" & cin_tb);
    ---------------------------------------------------------------------------
    -- the process will apply the test vectors to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
    BEGIN  -- PROCESS stimulus

        REPORT "Simulation starting...";

        FOR i IN 0 TO 2**(count'length)-1 LOOP
      
        count <= STD_LOGIC_VECTOR(to_unsigned(i, count'length));
      WAIT FOR 20 ns;
        
      ASSERT (answer(3) = cout_tb)
          REPORT "Failure in the carry out"
        SEVERITY failure;
      
      ASSERT (answer(2 downto 0) = sum_tb)
          REPORT "Failure in the sum"
        SEVERITY failure;
        
    END LOOP;
       
      REPORT "Simulation completed successfully...";
    
        -----------------------------------------------------------------------
        -- stop simulation, wait here forever
        -----------------------------------------------------------------------
        wait;
    END PROCESS stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------

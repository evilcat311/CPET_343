--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Connor Ott
--
--       LAB NAME:  Lab 2 - Full Addder; test bench
--
--      FILE NAME:  adderSingleBitStructural_tb.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will check if the single bit structural adder is working. 
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
-- | 05/31/23 | CMO  | 1.0 | Created
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
USE work.adderSingleBitStructural_pkg.ALL;


ENTITY adderSingleBitStructural_tb IS

END ENTITY adderSingleBitStructural_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF adderSingleBitStructural_tb IS

SIGNAL first_tb  : STD_LOGIC;
SIGNAL second_tb : STD_LOGIC;
SIGNAL cin_tb    : STD_LOGIC;
SIGNAL cout_tb   : STD_LOGIC;
SIGNAL sum_tb    : STD_LOGIC;
SIGNAL count     : STD_LOGIC_VECTOR(2 DOWNTO 0);
  
BEGIN  -- test

    ---------------------------------------------------------------------------
    -- instantiate the unit under test (UUT)
    ---------------------------------------------------------------------------
    UUT : adderSingleBitStructural 
    PORT MAP (
        a => first_tb,
    b => second_tb,
    cin => cin_tb,
    sum => sum_tb,
    cout => cout_tb
    );

    first_tb <= count(0);
  second_tb <= count(1);
    cin_tb <= count(2);

    ---------------------------------------------------------------------------
    -- the process will apply the test vectors to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
    BEGIN  -- PROCESS stimulus

        FOR i IN 0 TO 7 LOOP
        count <= std_logic_vector(to_unsigned(i, count'length));
      WAIT FOR 20 ns;
    END LOOP;

        -----------------------------------------------------------------------
        -- stop simulation, wait here forever
        -----------------------------------------------------------------------
        wait;
    END PROCESS stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------

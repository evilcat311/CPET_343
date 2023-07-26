--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  
--
--       LAB NAME:  Homework 3 - 4-bit Full Adder
--
--      FILE NAME:  full_adder_4bit.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will implement a 4-bit full adder using
--    a structural architecture. 
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

------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- ||||                                                                   ||||
-- ||||                    COMPONENT PACKAGE                              ||||
-- ||||                                                                   ||||
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE full_adder_4bit_pkg IS
  COMPONENT full_adder_4bit IS
    PORT (
      a     : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      b     : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      cin   : IN STD_LOGIC;
      sum   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      cout  : OUT STD_LOGIC
      );
  END COMPONENT;
END PACKAGE full_adder_3bit_pkg;



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
USE work.full_adder_pkg.ALL;

ENTITY full_adder_4bit IS
    PORT (
        a     : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      b     : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      cin   : IN STD_LOGIC;
      sum   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      cout  : OUT STD_LOGIC
    );
END ENTITY full_adder_4bit;

ARCHITECTURE fa_4bit_arch OF full_adder_4bit IS

  SIGNAL carry_s1 : STD_LOGIC;
  SIGNAL carry_s2 : STD_LOGIC;
  SIGNAL carry_s3 : STD_LOGIC;
  
BEGIN

    B0 : full_adder
      PORT MAP (
        a => a(0),
        b => b(0),
        cin => cin,
        sum => sum(0),
        cout => carry_s1
    );
    
  B1 : full_adder
      PORT MAP (
        a => a(1),
        b => b(1),
        cin => carry_s1,
        sum => sum(1),
        cout => carry_s2
    );

    B2 : full_adder
      PORT MAP (
        a => a(2),
        b => b(2),
        cin => carry_s2,
        sum => sum(2),
        cout => carry_s3
    );
    
    B3 : full_adder
      PORT MAP (
        a => a(3),
        b => b(3),
        cin => carry_s3,
        sum => sum(3),
        cout => cout
    );

END ARCHITECTURE fa_4bit_arch;

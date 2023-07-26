--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  
--
--       LAB NAME:  Homework 3 -  Question 1  BCD to 7 segment display
--
--      FILE NAME:  bcd_7seg.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will bcd to signals for a 7 segment display. 
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

PACKAGE bcd_7seg_pkg IS
  COMPONENT bcd_7seg IS   
    PORT (
      input    : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	  output   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
  END COMPONENT bcd_7seg;
  
  CONSTANT ZERO_c   : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1000000";
  CONSTANT ONE_c    : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111001";
  CONSTANT TWO_c    : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100100";
  CONSTANT THREE_c  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0110000";
  CONSTANT FOUR_c   : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0011001";
  CONSTANT FIVE_c   : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0010010";
  CONSTANT SIX_c    : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000010";
  CONSTANT SEVEN_c  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000111";
  CONSTANT EIGHT_c  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
  CONSTANT NINE_c   : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0010000";
  CONSTANT A_c      : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0001000";
  CONSTANT B_c      : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000011";
  CONSTANT C_c      : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1000110";
  CONSTANT D_c      : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100001";
  CONSTANT E_c      : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000110";
  CONSTANT F_c      : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0001110";
  CONSTANT EMPTY_c  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";
END PACKAGE bcd_7seg_pkg;



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
use work.bcd_7seg_pkg.ALL;

ENTITY bcd_7seg IS
  PORT (
      input    : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	  output   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END ENTITY bcd_7seg;

ARCHITECTURE behave OF bcd_7seg IS

BEGIN

    PROCESS(input)
	BEGIN
        CASE input IS
	        WHEN x"0" => output <= ZERO_c;
		    WHEN x"1" => output <= ONE_c;
		    WHEN x"2" => output <= TWO_c;
		    WHEN x"3" => output <= THREE_c;
		    WHEN x"4" => output <= FOUR_c;
		    WHEN x"5" => output <= FIVE_c;
		    WHEN x"6" => output <= SIX_c;
		    WHEN x"7" => output <= SEVEN_c;
		    WHEN x"8" => output <= EIGHT_c;
		    WHEN x"9" => output <= NINE_c;
		    WHEN x"A" => output <= A_c;
		    WHEN x"B" => output <= B_c;
		    WHEN x"C" => output <= C_c;
		    WHEN x"D" => output <= D_c;
		    WHEN x"E" => output <= E_c;
		    WHEN x"F" => output <= F_c;
		    WHEN OTHERS => output <= EMPTY_c;
	    END CASE;
    END PROCESS;
	
END ARCHITECTURE behave;

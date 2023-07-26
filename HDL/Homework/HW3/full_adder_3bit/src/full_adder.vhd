--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  
--
--       LAB NAME:  Lab 2 - Full Adder
--
--      FILE NAME:  full_adder.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will implement a full adder using
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

PACKAGE full_adder_pkg IS
  COMPONENT full_adder IS    -- REPLACE full_adder with the name of this file
    PORT (
      a     : IN STD_LOGIC;
	  b     : IN STD_LOGIC;
	  cin   : IN STD_LOGIC;
	  sum   : OUT STD_LOGIC;
	  cout  : OUT STD_LOGIC
    );
  END COMPONENT;
END PACKAGE full_adder_pkg;



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
USE work.alu_xor_pkg.ALL;
USE work.alu_and_pkg.ALL;
USE work.alu_or_pkg.ALL;

ENTITY full_adder IS
  PORT (
      a     : IN STD_LOGIC;
	  b     : IN STD_LOGIC;
	  cin   : IN STD_LOGIC;
	  sum   : OUT STD_LOGIC;
	  cout  : OUT STD_LOGIC
    );
END ENTITY full_adder;

ARCHITECTURE behavior OF full_adder IS

SIGNAL xor_s1_out : STD_LOGIC;
SIGNAL and_s1_out : STD_LOGIC;
SIGNAL and_s2_out : STD_LOGIC;
	
BEGIN

    xor_s1 : alu_xor
	    PORT MAP (
		   inputs(0) => a,
		   inputs(1) => b,
		   output => xor_s1_out
		);
    
	xor_s2 : alu_xor
	    PORT MAP (
		   inputs(0) => xor_s1_out,
		   inputs(1) => cin,
		   output => sum
		);
		
	and_s1 : alu_and
	    PORT MAP (
		   inputs(0) => a,
		   inputs(1) => b,
		   output => and_s1_out
		);
		
    and_s2 : alu_and
	    PORT MAP (
		   inputs(0) => xor_s1_out,
		   inputs(1) => cin,
		   output => and_s2_out
		);
		
    or_gate : alu_or
	    PORT MAP (
		   inputs(0) => and_s1_out,
		   inputs(1) => and_s2_out,
		   output => cout
		);

END ARCHITECTURE behavior;

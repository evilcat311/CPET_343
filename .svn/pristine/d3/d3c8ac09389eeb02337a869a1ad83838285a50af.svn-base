--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Connor Ott
--
--       LAB NAME:  Homework 2 
--
--      FILE NAME:  top_level.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will create the structure of the circuit
--    for homework 2 question 4. 
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

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

PACKAGE top_level_pkg IS
    COMPONENT top_level IS
		PORT (
		    x   : IN std_logic;
			y   : IN std_logic;
			z   : IN std_logic;
			w   : IN std_logic;
			f1  : OUT std_logic
		);
    END COMPONENT;
END PACKAGE top_level_pkg;

------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

LIBRARY work;
USE work.and_n_pkg.ALL;
USE work.nor_n_pkg.ALL;
USE work.or_2_pkg.ALL;
USE work.xor_2_pkg.ALL;

ENTITY top_level IS
    PORT (
	    x   : IN std_logic;
		y   : IN std_logic;
		z   : IN std_logic;
		w   : IN std_logic;
		f1  : OUT std_logic
	);
END ENTITY top_level;

ARCHITECTURE structure OF top_level IS
SIGNAL and_3_out : std_logic;
SIGNAL nor_4_out : std_logic;
SIGNAL or_2_out  : std_logic;
SIGNAL z_n       : std_logic;
SIGNAL x_n       : std_logic;
BEGIN

    z_n <= NOT z;
	x_n <= NOT x;
	
	and_3_gate : and_n
	    GENERIC MAP (
		    width => 3
		)
		PORT MAP (
		    input(0) => w,
			input(1) => x,
			input(2) => y,
			output   => and_3_out
		);

	nor_4_gate : nor_n
	    GENERIC MAP (
		    width => 4
		)
		PORT MAP (
		    input(0) => w,
			input(1) => x_n,
			input(2) => y,
			input(3) => z_n,
			output   => nor_4_out
		);

	or_2_gate : or_2
        PORT MAP (
            inputs(0) => and_3_out,
			inputs(1) => nor_4_out,
			output    => or_2_out
        );		

	xor_2_gate : xor_2
	    PORT MAP (
		    inputs(0) => or_2_out,
			inputs(1) => z_n,
			output    => f1
		);

END ARCHITECTURE structure;
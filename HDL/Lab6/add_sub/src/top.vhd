--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  <enter your name here>
--
--       LAB NAME:  Labx: <name of lab>
--
--      FILE NAME:  top.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--    This file is a used for compiling file in Quartus so the ENTITY 
--    signals names match the DE1-SOC board pins file names. 
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY work;
USE work.add_sub_pkg.ALL;

ENTITY top IS
  PORT (
    CLOCK_50 : IN  std_logic;
    SW       : IN  std_logic_vector(9 DOWNTO 0);
	KEY      : IN  std_logic_vector(0 DOWNTO 0);
    --
    HEX0     : OUT std_logic_vector(6 DOWNTO 0);
	HEX1     : OUT std_logic_vector(6 DOWNTO 0);
	HEX2     : OUT std_logic_vector(6 DOWNTO 0);
	LEDR     : OUT std_logic_vector(3 downto 0)
    );
END ENTITY top;

ARCHITECTURE arch OF top IS

BEGIN

  top_inst : add_sub
    PORT MAP (
      clk_50mhz      => CLOCK_50,
      
      a_in   => SW(7 downto 0),
	  reset_n => SW(9),
	  pb_in => KEY(0),
      --
      hex2        => HEX2,
	  hex1        => HEX1,
	  hex0        => HEX0,
	  ledOut      => LEDR(3 downto 0)
      );


END ARCHITECTURE arch;

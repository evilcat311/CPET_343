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
-- | 08/01/20 | xxx  | 1.0 | Created
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
	KEY      : IN  std_logic_vector(1 DOWNTO 0);
    --
    HEX0     : OUT std_logic_vector(6 DOWNTO 0);
	HEX2     : OUT std_logic_vector(6 DOWNTO 0);
	HEX4     : OUT std_logic_vector(6 DOWNTO 0)
    );
END ENTITY top;

ARCHITECTURE arch OF top IS

BEGIN

  top_inst : add_sub
    PORT MAP (
      clk_50mhz      => CLOCK_50,
      
      a_in   => SW(9 downto 7),
	  b_in => SW(6 downto 4),
	  reset_n => SW(0),
	  add => KEY(1),
	  subtract => KEY(0),
      --
      hexA        => HEX4,
	  hexB        => HEX2,
	  hexSum      => HEX0
      );


END ARCHITECTURE arch;

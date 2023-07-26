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
USE work.processor_pkg.ALL;

ENTITY top IS
  PORT (
    CLOCK_50 : IN  std_logic;
    --SW       : IN  std_logic_vector(9 DOWNTO 0);
	KEY      : IN  std_logic_vector(3 DOWNTO 0);
    --
    HEX0     : OUT std_logic_vector(6 DOWNTO 0);
	HEX1     : OUT std_logic_vector(6 DOWNTO 0);
	HEX2     : OUT std_logic_vector(6 DOWNTO 0);
	LEDR     : OUT std_logic_vector(3 downto 0)
    );
END ENTITY top;

ARCHITECTURE arch OF top IS

BEGIN

  top_inst : processor
    PORT MAP (
      clk_50mhz      => CLOCK_50,
      --op_mode => SW(9 downto 8),
      --a_in   => SW(7 downto 0),
	  --pb_in => KEY(3 downto 0),
      reset => KEY(3),
      execute => KEY(0),
      --
      hex2        => HEX2,
	  hex1        => HEX1,
	  hex0        => HEX0,
	  ledOut      => LEDR(3 downto 0)
      );


END ARCHITECTURE arch;

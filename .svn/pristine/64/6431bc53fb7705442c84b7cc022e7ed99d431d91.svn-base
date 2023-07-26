--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Lab 6 - 8-bit Hardware Add/Subtract with State Machine
--
--      FILE NAME:  input_storage.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will store the value until it is reseted. 
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
-- | 10/07/20 | ACS  | 1.0 | Created
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

PACKAGE input_storage_pkg IS
  COMPONENT input_storage IS 
    GENERIC (
      inp_width : integer := 3
    );

    PORT (
      reset_n         : IN  std_logic;
      clk             : IN  std_logic;
      enable_write    : IN  std_logic;
      input           : IN  std_logic_vector(inp_width-1 downto 0);
      --
      output          : OUT std_logic_vector(inp_width-1 downto 0)
    );
  END COMPONENT;
END PACKAGE input_storage_pkg;



------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY input_storage  IS
  GENERIC (
    inp_width : integer := 3
  );

  PORT (
    reset_n         : IN  std_logic;
    clk             : IN  std_logic;
    enable_write    : IN  std_logic;
    input           : IN  std_logic_vector(inp_width-1 downto 0);
    --
    output          : OUT std_logic_vector(inp_width-1 downto 0)
  );
END ENTITY input_storage ;

ARCHITECTURE behave OF input_storage IS

BEGIN

  PROCESS(reset_n, clk) IS
  BEGIN
    IF(reset_n = '0') THEN
      output <= (others => '0');
    ELSIF(rising_edge(clk)) THEN
      IF(enable_write = '1') THEN
        output <= input;
      END IF;
    END IF;
  END PROCESS;

END ARCHITECTURE behave;

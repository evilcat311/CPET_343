--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME: 
--
--       LAB NAME:  Homework 4 - Question 1d
--
--      FILE NAME:  d_flip_flop.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will <insert detailed description of design>. 
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

PACKAGE d_flip_flop_pkg IS
  COMPONENT d_flip_flop IS    -- REPLACE <filename> with the name of this file
    PORT (
      clk     : IN std_logic;
      data    : IN std_logic;
      reset_n : IN std_logic;
      preset  : IN std_logic;
      que     : OUT std_logic;
      que_n   : OUT std_logic
    );
  END COMPONENT;
END PACKAGE d_flip_flop_pkg;



------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d_flip_flop IS
  PORT (
      clk     : IN std_logic;
      data    : IN std_logic;
      reset_n : IN std_logic;
      preset  : IN std_logic;
      que     : OUT std_logic;
      que_n   : OUT std_logic
    );
END ENTITY d_flip_flop;

ARCHITECTURE behave OF d_flip_flop IS

BEGIN

    dff: PROCESS(clk, reset_n)
    VARIABLE q_temp : std_logic := '0';
    BEGIN
      IF (reset_n = '0') THEN
        q_temp := '0';
      ELSIF(falling_edge(clk)) THEN
        IF(preset = '1') THEN
          q_temp := '1';
        ELSE 
          q_temp := data;
        END IF;
      END IF; 
      que <= q_temp;
      que_n <= NOT q_temp;
    END PROCESS dff;

END ARCHITECTURE behave;

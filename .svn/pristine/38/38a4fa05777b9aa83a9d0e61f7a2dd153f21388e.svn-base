--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:
--
--       LAB NAME:  Homework 4 - Question 2
--
--      FILE NAME:  jk_flip_flop.vhd
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

PACKAGE jk_flip_flop_pkg IS
  COMPONENT jk_flip_flop IS 
    PORT (
      j        : IN std_logic;
      k        : IN std_logic;
      preset_n : IN std_logic;
      clear_n  : IN std_logic;
      clk      : IN std_logic;
      que      : OUT std_logic;
      que_n    : OUT std_logic
    );
  END COMPONENT;
END PACKAGE jk_flip_flop_pkg;



------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY jk_flip_flop IS
  PORT (
    j        : IN std_logic;
    k        : IN std_logic;
    preset_n : IN std_logic;
    clear_n  : IN std_logic;
    clk      : IN std_logic;
    que      : OUT std_logic;
    que_n    : OUT std_logic
  );
END ENTITY jk_flip_flop;

ARCHITECTURE behave OF jk_flip_flop IS
  
BEGIN

    jk_ff : PROCESS(clk, preset_n, clear_n) IS
      VARIABLE pre_clr_slv : std_logic_vector(1 downto 0);
      VARIABLE j_k_slv     : std_logic_vector(1 downto 0);
      VARIABLE que_v       : std_logic := '0';
      VARIABLE que_n_v     : std_logic := '0'; 
    BEGIN
      
      pre_clr_slv := preset_n & clear_n;
      j_k_slv := j & k;
      
      --que_v := 0;
      --que_n_v := 0;
      
      IF(preset_n = '0' OR clear_n = '0') THEN
        -- Check both preset and clear to 
        -- see if both que and que_n need to be HIGH
        CASE (pre_clr_slv) IS
          WHEN "01" =>
            que_v := '1';
            que_n_v := '0';
          WHEN "10" =>
            que_v := '0';
            que_n_v := '1';
          WHEN "00" =>
            que_v := '1';
            que_n_v := '1';
          WHEN OTHERS => 
            que_v := que_v;
            que_n_v := que_n_v;
        END CASE;
      ELSIF(rising_edge(clk)) THEN
        CASE (j_k_slv) IS
          WHEN "00" =>
            que_v := '0';
            que_n_v := '1';
          WHEN "10" =>
            que_v :=  NOT que_v;
            que_n_v := NOT que_n_v;
          WHEN "01" =>
            que_v := que_v;
            que_n_v := que_n_v;
          WHEN "11" =>
            que_v := '1';
            que_n_v := '0';
          WHEN OTHERS =>
            que_v := que_v;
            que_n_v := que_n_v;
        END CASE;
      END IF;
      
      que <= que_v;
      que_n <= que_n_v;
      
    END PROCESS jk_ff;

END ARCHITECTURE behave;

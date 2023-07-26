--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Lab 8 - 8 bit Processor; test bench
--
--      FILE NAME:  top_tb.vhd
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
-- | 11/11/20 | ACS  | 1.0 | Created
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************
-------------------------------------------------------------------------------

-- include ieee packages here
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- include your packages here
LIBRARY work;
USE work.top_pkg.ALL;


ENTITY top_tb IS

END ENTITY top_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF top_tb IS

    SIGNAL clk_tb        : std_logic := '0';
    SIGNAL key_tb        : std_logic_vector(3 downto 0) := (others => '0');
    --
    SIGNAL led_tb        : std_logic_vector(8 downto 0);
    SIGNAL hex0_tb       : std_logic_vector(6 downto 0);
    SIGNAL hex1_tb       : std_logic_vector(6 downto 0);
    SIGNAL hex2_tb       : std_logic_vector(6 downto 0);
    --
    SIGNAL PERIOD_c : time    := 20 ns;
    SIGNAL sim_done : boolean := false;

    procedure pb_event(signal pb : out std_logic) is
    begin
      pb <= '0';
      WAIT FOR PERIOD_c;
      pb <= '1';
      WAIT FOR PERIOD_c * 2;
    end procedure pb_event;
    
BEGIN  -- test

    clk_tb <= (NOT clk_tb) AFTER (PERIOD_c / 2) WHEN (NOT sim_done) ELSE '0';

    ---------------------------------------------------------------------------
    -- instantiate the unit under test (UUT)
    ---------------------------------------------------------------------------
    UUT : top
    PORT MAP (
      CLOCK_50 => clk_tb,
      KEY      => key_tb,
      --
      LEDR     => led_tb,
      HEX0     => hex0_tb,
      HEX1     => hex1_tb,
      HEX2     => hex2_tb
    );


    ---------------------------------------------------------------------------
    -- the process will apply the test vectors to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
    BEGIN  -- PROCESS stimulus
      
      
      WAIT FOR PERIOD_c;
      pb_event(key_tb(0));
      
      FOR i IN 0 TO 6 LOOP
        WAIT FOR PERIOD_c*4;
        pb_event(key_tb(1));
        WAIT FOR PERIOD_c*4;
      END LOOP;

      WAIT FOR PERIOD_c*20;
      sim_done <= true;
      WAIT FOR PERIOD_c*2;
      -----------------------------------------------------------------------
      -- stop simulation, wait here forever
      -----------------------------------------------------------------------
      wait;
    END PROCESS stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------

--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Connor Ott
--
--       LAB NAME:  Lab 1 - Introduction
--
--      FILE NAME:  template_tb.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will create a circuit that has a switch  
--    and a LED. If the signal from the switch is high, the 
--    LED will output high. if the switch is low, the LED will
--    be outputting low.
--
-------------------------------------------------------------------------------
--
--  REVISION HISTORY
--
--  _______________________________________________________________________
-- |  DATE    | USER | Ver |  Description                                  |
-- |==========+======+=====+================================================
-- |          |      |     |
-- | 05/22/23 | CMO  | 1.0 | Created
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY work;
USE work.Lab1_pkg.ALL;


ENTITY Lab1_tb IS

END ENTITY Lab1_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF Lab1_tb IS

    SIGNAL switch : std_logic  := '0';
	SIGNAL led    : std_logic  := '0';
    
BEGIN  -- test

    UUT : Lab1 
    PORT MAP (
        switch => switch,
		led => led
        );

    stimulus : PROCESS
    BEGIN  -- PROCESS stimulus
		
		switch <= '0';
		WAIT FOR 40 ns;
		
		switch <= '1';
		WAIT FOR 40 ns;
		
		switch <= '0';
		WAIT FOR 40 ns;
		
		switch <= '1';
		WAIT FOR 40 ns;
        -----------------------------------------------------------------------
        -- stop simulation, wait here forever
        -----------------------------------------------------------------------
        wait;
    END PROCESS stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------

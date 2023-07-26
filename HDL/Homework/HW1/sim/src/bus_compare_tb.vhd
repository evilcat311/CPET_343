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
use ieee.numeric_std.all;

LIBRARY work;
USE work.bus_compare_pkg.ALL;


ENTITY bus_compare_tb IS

END ENTITY bus_compare_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF bus_compare_tb IS

    SIGNAL A, B    : std_logic_vector(7 downto 0) :=(others => '0');
	SIGNAL a_gr_b  : std_logic  := '0';
    
BEGIN  -- test

    UUT : bus_compare 
    PORT MAP (A,B,a_gr_b);

    tb : PROCESS
    BEGIN  -- PROCESS tb
		
		A <= "00000000";
		B <= "00000000";
		WAIT FOR 40 ns;
		for i in 0 to 255 loop
		    for j in 0 to 255 loop
			    B <= std_logic_vector( unsigned(B) + 1 );
				WAIT FOR 10 ns;
		    end loop;
			A <= std_logic_vector( unsigned(A) + 1 );
			WAIT FOR 10 ns;
		end loop;
		
		A <= "11111111";
		B <= "11111111";
		WAIT FOR 40 ns;
		for i in 0 to 255 loop
		    for j in 0 to 255 loop
			    B <= std_logic_vector( unsigned(B) - 1 );
				WAIT FOR 10 ns;
		    end loop;
			A <= std_logic_vector( unsigned(A) - 1 );
			WAIT FOR 10 ns;
		end loop;
		
			
			
        -----------------------------------------------------------------------
        -- stop simulation, wait here forever
        -----------------------------------------------------------------------
        wait;
    END PROCESS tb;

END ARCHITECTURE test;
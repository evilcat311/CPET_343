--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  
--
--       LAB NAME:  Homework 3 -  Question 1  BCD to 7 segment display; testbench
--
--      FILE NAME:  bcd_7seg_tb--------------------------------------
--
--  DESCRIPTION
--
--    This design will test the bcd to signals for a 7 segment display. 
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

-- include ieee packages here
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

-- include your packages here
LIBRARY work;
USE work.bcd_7seg_pkg.ALL;


ENTITY bcd_7seg_tb IS

END ENTITY bcd_7seg_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF bcd_7seg_tb IS

    SIGNAL count      : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL input_tb   : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL output_tb  : STD_LOGIC_VECTOR(6 DOWNTO 0);

    TYPE seven_segment_t IS ARRAY (0 to 15) OF std_logic_vector(6 downto 0);

	CONSTANT seven_seg_value : seven_segment_t :=  (
	    ZERO_c, 
		ONE_c,
		TWO_c,
		THREE_c,
		FOUR_c,
		FIVE_c,
		SIX_c,
		SEVEN_c,
		EIGHT_c,
		NINE_c,
		A_c,
		B_c,
		C_c,
		D_c,
		E_c,
		F_c
	);
    
BEGIN  -- test


    ---------------------------------------------------------------------------
    -- instantiate the unit under test (UUT)
    ---------------------------------------------------------------------------
    UUT : bcd_7seg 
    PORT MAP (
        input => input_tb,
		output => output_tb
	);
	
    input_tb <= count;

    ---------------------------------------------------------------------------
    -- the process will apply the test vectors to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
    BEGIN  -- PROCESS stimulus

        REPORT "Starting simulation...";
		
        FOR i IN 0 TO 15 LOOP
		    count <= STD_LOGIC_VECTOR(to_unsigned(i, count'length));
			WAIT FOR 20 ns;
			
			ASSERT(seven_seg_value(i) = output_tb)
			    REPORT "Failed simulation..."
				SEVERITY failure;
			
		END LOOP;
        
		REPORT "Simulation successfully comleted...";
		
        -----------------------------------------------------------------------
        -- stop simulation, wait here forever
        -----------------------------------------------------------------------
        wait;
    END PROCESS stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------

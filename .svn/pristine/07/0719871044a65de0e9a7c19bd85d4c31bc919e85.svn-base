--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Connor Ott
--
--       LAB NAME:  Homework 2 ; test bench
--
--      FILE NAME:  top_level_tb.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will test the top level design. 
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
-- | 05/31/23 | CMO  | 1.0 | Created
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
-- include your packages here
LIBRARY work;
USE work.top_level_pkg.ALL;


ENTITY top_level_tb IS

END ENTITY top_level_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF top_level_tb IS

    SIGNAL count    : std_logic_vector(3 DOWNTO 0);
    SIGNAL x_tb     : std_logic;
    SIGNAL y_tb     : std_logic;
    SIGNAL z_tb     : std_logic;
    SIGNAL w_tb     : std_logic;
    SIGNAL f1_tb    : std_logic;
	SIGNAL f1_truth : std_logic;
    
BEGIN  -- test


    ---------------------------------------------------------------------------
    -- instantiate the unit under test (UUT)
    ---------------------------------------------------------------------------
    UUT : top_level
    PORT MAP (
        x  => x_tb,
		y  => y_tb,
		z  => z_tb,
		w  => w_tb,
		f1 => f1_tb
    );

    w_tb <= count(0);
	x_tb <= count(1);
	y_tb <= count(2);
	z_tb <= count(3);

    ---------------------------------------------------------------------------
    -- the process will apply the test vectors to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
    BEGIN  -- PROCESS stimulus

        REPORT "Simulation starting...";
		
        FOR i IN 0 TO 15 LOOP
            count <= std_logic_vector(to_unsigned(i, count'length));
			WAIT FOR 20 ns;
			
			ASSERT (f1_tb = f1_truth)
			    REPORT "F1 is incorrect"
			    SEVERITY failure;
        END LOOP;

        -- Completion message
        REPORT "Simulation completed successfully...";
        -----------------------------------------------------------------------
        -- stop simulation, wait here forever
        -----------------------------------------------------------------------
        wait;
    END PROCESS stimulus;
	
	-- The real logic being tested
	f1_truth <= ((w_tb AND x_tb AND y_tb) OR
	             NOT (w_tb OR (NOT x_tb) OR y_tb OR (NOT z_tb))) XOR
				 NOT z_tb;

END ARCHITECTURE test;

-------------------------------------------------------------------------------

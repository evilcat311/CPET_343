--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  
--
--       LAB NAME:  Homework 3 - Full Adder 1 bit; test bench
--
--      FILE NAME:  full_adder_tb.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will test the design of the 1-bit full adder. 
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
-------------------------------------------------------------------------------

-- include ieee packages here
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

-- include your packages here
LIBRARY work;
USE work.full_adder_pkg.ALL;


ENTITY full_adder_tb IS

END ENTITY full_adder_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF full_adder_tb IS

    SIGNAL count   : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL a_tb    : STD_LOGIC;
	SIGNAL b_tb    : STD_LOGIC;
	SIGNAL cin_tb  : STD_LOGIC;
	SIGNAL sum_tb  : STD_LOGIC;
	SIGNAL cout_tb : STD_LOGIC;
	
	SIGNAL sum_truth  : STD_LOGIC;
	SIGNAL cout_truth : STD_LOGIC;
    
BEGIN  -- test

    UUT : full_adder
    PORT MAP (
        a => a_tb,
		b => b_tb,
		cin => cin_tb,
		sum => sum_tb,
		cout => cout_tb
    );

    a_tb <= count(0);
	b_tb <= count(1);
	cin_tb <= count(2);

    ---------------------------------------------------------------------------
    -- the process will apply the test vectors to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
    BEGIN  -- PROCESS stimulus
	
	    REPORT "Simulation starting...";

        FOR i IN 0 TO 7 LOOP
		
		    count <= STD_LOGIC_VECTOR(to_unsigned(i, count'length));
			WAIT FOR 20 ns;
		
		    ASSERT (sum_tb = sum_truth)
			    REPORT "Sum generated: " & std_logic'image(sum_tb) & " has to be " & std_logic'image(sum_truth)
				SEVERITY failure;
				
			ASSERT (cout_tb = cout_truth)
			    REPORT "Carry out generated: " & std_logic'image(cout_tb) & " has to be " & std_logic'image(cout_truth)
				SEVERITY failure;
				
		END LOOP;
       
	    REPORT "Simulation completed successfully...";
		
        -----------------------------------------------------------------------
        -- stop simulation, wait here forever
        -----------------------------------------------------------------------
        wait;
    END PROCESS stimulus;
	
	sum_truth <= (a_tb XOR b_tb) XOR cin_tb;
	cout_truth <= ((a_tb XOR b_tb) AND cin_tb) OR (a_tb AND b_tb);

END ARCHITECTURE test;

-------------------------------------------------------------------------------

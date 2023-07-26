LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

PACKAGE or_2_pkg IS
    COMPONENT or_2 IS
    	PORT (
	        inputs : IN std_logic_vector(1 DOWNTO 0);
		    output : OUT std_logic
	    );
    END COMPONENT;
END PACKAGE or_2_pkg;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY or_2 IS
    PORT (
		inputs    : IN std_logic_vector(1 DOWNTO 0);
		output    : OUT std_logic
	);
END ENTITY or_2;

ARCHITECTURE behavior OF or_2 IS

BEGIN

    output <= inputs(0) OR inputs(1);
	
	END ARCHITECTURE behavior;
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

PACKAGE nor_n_pkg IS
    COMPONENT nor_n IS
	    GENERIC (
	        -- create the signal that has varying size
		    width : positive := 2
	    );
	
	    PORT (
	        input  : IN std_logic_vector(width-1 DOWNTO 0);
		    output : OUT std_logic
	    );
	END COMPONENT;
END PACKAGE nor_n_pkg;

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

ENTITY nor_n IS
	GENERIC (
	    width : positive := 2
    );
	
	PORT (
	    input  : IN std_logic_vector(width-1 DOWNTO 0);
		output : OUT std_logic
	);
END ENTITY nor_n;

ARCHITECTURE behavior OF nor_n IS
BEGIN

    nor_gate : PROCESS (input)
	    VARIABLE temp : std_logic;
	BEGIN
	    
		temp := '0';
		
		nor_loop : FOR i IN 0 TO (width-1) LOOP
		    temp := temp OR input(i);
		END LOOP;
		
		output <= NOT temp;
	END PROCESS nor_gate;

END ARCHITECTURE behavior;
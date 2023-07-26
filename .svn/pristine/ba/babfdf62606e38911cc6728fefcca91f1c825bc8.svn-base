LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

PACKAGE nor2_pkg IS
    COMPONENT nor_2 IS
	    PORT (
      A,B      : IN std_logic;
      output   : OUT std_logic
	    );
	END COMPONENT;
END PACKAGE nor2_pkg;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nor2  IS
  PORT (
      A,B      : IN std_logic;
      output   : OUT std_logic
      );
END ENTITY nor2 ;

ARCHITECTURE behave OF nor2  IS

BEGIN

    output <= (A NOR B);

END ARCHITECTURE behave;
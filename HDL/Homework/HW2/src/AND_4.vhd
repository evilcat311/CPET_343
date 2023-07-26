LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

PACKAGE and4_pkg IS
    COMPONENT and_4 IS
	    PORT (
      A,B,C,D  : IN std_logic;
      output   : OUT std_logic
	    );
	END COMPONENT;
END PACKAGE and4_pkg;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and4  IS
  PORT (
      A,B,C,D  : IN std_logic;
      output   : OUT std_logic
      );
END ENTITY and4 ;

ARCHITECTURE behave OF and4  IS

BEGIN

    output <= (A AND B AND C AND D);

END ARCHITECTURE behave;
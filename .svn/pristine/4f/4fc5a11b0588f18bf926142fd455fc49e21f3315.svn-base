LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

PACKAGE NAND8_pkg IS
    COMPONENT NAND_8 IS
	    PORT (
        a,b,c,d,e,f,g,h:	in std_logic;
        output:      out std_logic
	    );
	END COMPONENT;
END PACKAGE NAND8_pkg;


library ieee;
use ieee.std_logic_1164.all;

entity NAND8 is port (
        a,b,c,d,e,f,g,h:	in std_logic;
        output:      out std_logic
        );
end NAND8;

architecture behavior of NAND8 is
begin
        output < = not(a and b and c and d and e and f and g and h);
end behavior;
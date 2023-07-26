LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE bus_compare_pkg IS
  COMPONENT bus_compare IS 
    PORT (
        A, B: IN std_logic_vector(7 downto 0);
        a_gr_b: OUT std_logic
      );
  END COMPONENT;
END PACKAGE bus_compare_pkg;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity bus_compare is
    port (
        A, B: IN std_logic_vector(7 downto 0);
        a_gr_b: OUT std_logic
    );
end entity bus_compare;

architecture behavioral of bus_compare is
begin
    -- Compare A and B
    process(A, B)
    begin
        if A <= B then
            a_gr_b <= '0';  -- A is less than or equal to B
        else
            a_gr_b <= '1';  -- A is greater than B
        end if;
    end process;
end architecture behavioral;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity top_tb is
end top_tb;

architecture arch of top_tb is

component top is
  port (
    sw_in           : in std_logic_vector(7 downto 0); -- a and b, state will determin which
    s_btn           : in std_logic; -- btn to switch state
    clk             : in std_logic;
    reset           : in std_logic;
    seven_seg_hun   : out std_logic_vector(6 downto 0);
    seven_seg_ten   : out std_logic_vector(6 downto 0);
    seven_seg_one   : out std_logic_vector(6 downto 0);
    s_led           : out std_logic_vector(3 downto 0) -- state indicator
  ); 
end component;

--INTERNAL SIGNALS HERE - FIX THESE
constant SEQUENTIAL_FLAG    : boolean := true;
constant NUM_BITS           : integer := 3;
signal output               : std_logic;
constant period             : time := 20ns;                                              
signal clk                  : std_logic := '0';
signal reset                : std_logic := '1';
signal sw_in                : std_logic_vector(7 downto 0):= (others => '0');
signal s_btn                : std_logic := '0';
signal seven_seg_hun        : std_logic_vector(6 downto 0);
signal seven_seg_ten        : std_logic_vector(6 downto 0);
signal seven_seg_one        : std_logic_vector(6 downto 0);
signal s_led                : std_logic_vector(3 downto 0);

begin

uut: top
  port map(        
    sw_in               => sw_in,
    s_btn               => s_btn,
    clk                 => clk,
    reset               => reset,
    seven_seg_hun       => seven_seg_hun,
    seven_seg_ten       => seven_seg_ten,
    seven_seg_one       => seven_seg_one,
    s_led               => s_led 
  );
  
-- clock process
clock: process
  begin
    clk <= not clk;
    wait for period/2;
end process; 
 
-- reset process
async_reset: process
  begin
    wait for 2 * period;
    reset <= '0';
    wait;
end process; 



sequential_stimuli: if SEQUENTIAL_FLAG generate
  sequential_tb : process 
    begin
    wait for 2 * period;
    sw_in <= "00000101";
    wait for 500 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    wait for 500 ns;
    wait for 2 * period;
    sw_in <= "00000010";
    wait for 500 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    
    wait for 2 * period;
    wait for 500 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    
    wait for 1000 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    -------------------------
    -------------------------
    -------------------------
    -------------------------
    -------------------------
    wait for 2 * period;
    sw_in <= "00000010";
    wait for 500 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    
    wait for 2 * period;
    sw_in <= "00000101";
    wait for 500 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    
    wait for 2 * period;
    wait for 500 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    
    wait for 1000 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    -------------------------
    -------------------------
    -------------------------
    -------------------------
    -------------------------    
    wait for 2 * period;
    sw_in <= "11001000";
    wait for 500 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    
    wait for 2 * period;
    sw_in <= "01100100";
    wait for 500 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    
    wait for 2 * period;
    wait for 500 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    
    wait for 1000 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    -------------------------
    -------------------------
    -------------------------
    -------------------------
    -------------------------
    
    
    
    wait for 2 * period;
    sw_in <= "01100100";
    wait for 500 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    
    wait for 2 * period;
    sw_in <= "11001000";
    wait for 500 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    
    wait for 2 * period;
    wait for 500 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    
    wait for 1000 ns;
    for k in 0 to 1 loop
        s_btn<=not(s_btn);
        wait for 50 ns;
    end loop;
    
end process;
end generate sequential_stimuli;



end arch;

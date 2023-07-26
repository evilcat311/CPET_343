--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Connor Ott
--
--       LAB NAME:  Lab4: Seven Segment Display Counter
--
--      FILE NAME:  top.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--    This file is a used for compiling file in Quartus so the ENTITY 
--    signals names match the DE1-SOC board pins file names. 
--
--  REVISION HISTORY
--
--  _______________________________________________________________________
-- |  DATE    | USER | Ver |  Description                                  |
-- |==========+======+=====+================================================
-- |          |      |     |
-- | 06/10/23 | CMO  | 1.0 | Created
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY work;
USE work.seven_seg_pkg.ALL;

ENTITY top IS
  PORT (
    CLOCK_50 : IN  std_logic;
    SW       : IN  std_logic_vector(9 downto 0);
    HEX0     : OUT std_logic_vector(6 DOWNTO 0)
  );
END ENTITY top;

ARCHITECTURE arch OF top IS

  COMPONENT generic_counter IS
    generic (
      max_count       : integer := 3
    );
    port (
      clk             : in  std_logic; 
      reset           : in  std_logic;
      output          : out std_logic
    );  
  END COMPONENT generic_counter;

  COMPONENT generic_adder_beh IS
    generic (
      bits    : integer := 4
    );
    port (
      a       : in  std_logic_vector(bits-1 downto 0);
      b       : in  std_logic_vector(bits-1 downto 0);
      cin     : in  std_logic;
      sum     : out std_logic_vector(bits-1 downto 0);
      cout    : out std_logic
    );
   END COMPONENT generic_adder_beh;
   
  SIGNAL enable_sig : std_logic;
  SIGNAL reset      : std_logic;
  SIGNAL sum_res    : std_logic_vector(3 downto 0);
  -- ssd_out is the hex0 value
  SIGNAL ssd_out    : std_logic_vector(6 downto 0) := (others => '0');
  -- signal that is outputed from the register
  SIGNAL sum_sig    : std_logic_vector(3 downto 0) := (others => '0');
 
BEGIN
  reset <= SW(9);
  
  counter : generic_counter
    GENERIC MAP (
      max_count => 5000000
    )
    PORT MAP (
      clk => CLOCK_50,
      reset => reset,
      output => enable_sig
    );

  adder : generic_adder_beh
    GENERIC MAP (
      bits => 4
    )
    PORT MAP (
      a => "0001",
      b => sum_sig,
      cin => '0',
      sum => sum_res,
      cout => open
    );
    
  disp : seven_seg
    PORT MAP (
      enable => '1',
      bcd => sum_sig,
      seven_seg_out => HEX0
    );
  
  sum_register : PROCESS(CLOCK_50, reset) IS
  BEGIN
    IF(reset = '1') THEN
      sum_sig <= "0000";
    ELSIF(rising_edge(CLOCK_50)) THEN
      IF(enable_sig = '1') THEN
        sum_sig <= sum_res;
      END IF;
    END IF;
  END PROCESS sum_register;
  
END ARCHITECTURE arch;

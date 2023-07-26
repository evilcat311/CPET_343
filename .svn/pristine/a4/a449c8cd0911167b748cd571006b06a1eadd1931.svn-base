--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Lab 5 - 3-Bit Hardware Add and Subtract
--
--      FILE NAME:  calculator.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will implement a structural architecture to create a
--    calculator module.
--
-------------------------------------------------------------------------------
--
--  REVISION HISTORY
--
--  _______________________________________________________________________
-- |  DATE    | USER | Ver |  Description                                  |
-- |==========+======+=====+================================================
-- |          |      |     |
-- | 10/02/20 | ACS  | 1.0 | Created
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************

------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- ||||                                                                   ||||
-- ||||                    COMPONENT PACKAGE                              ||||
-- ||||                                                                   ||||
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE calculator_pkg IS
  COMPONENT calculator IS
    PORT (
      CLOCK_50  : IN std_logic;
      SW        : IN  std_logic_vector(9 downto 0);
      KEY       : IN  std_logic_vector(3 downto 0);
      --
      HEX0      : OUT std_logic_vector(6 downto 0);
      HEX2      : OUT std_logic_vector(6 downto 0);
      HEX4      : OUT std_logic_vector(6 downto 0)
    );
  END COMPONENT;
END PACKAGE calculator_pkg;



------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY work;
USE work.add_sub_pkg.ALL;
USE work.seven_seg_pkg.ALL;
USE work.clock_synchronizer_pkg.ALL;

ENTITY calculator IS
  PORT (
    CLOCK_50  : IN std_logic;
    SW        : IN  std_logic_vector(9 downto 0);
    KEY       : IN  std_logic_vector(3 downto 0);
    --
    HEX0      : OUT std_logic_vector(6 downto 0);
    HEX2      : OUT std_logic_vector(6 downto 0);
    HEX4      : OUT std_logic_vector(6 downto 0)
  );
END ENTITY calculator;

ARCHITECTURE structural OF calculator IS

  SIGNAL op_code         : std_logic_vector(1 downto 0);
  SIGNAL operation       : std_logic;
  SIGNAL result          : std_logic_vector(3 downto 0);
  SIGNAL reset           : std_logic := '0';
  
  SIGNAL inp_a_bcd       : std_logic_vector(3 downto 0) := (others => '0');
  SIGNAL inp_b_bcd       : std_logic_vector(3 downto 0) := (others => '0');
  
  -- syncronous signals
  SIGNAL op_code_sync    : std_logic_vector(1 downto 0) := (others => '0');
  SIGNAL inp_a_sync      : std_logic_vector(3 downto 0) := (others => '0');
  SIGNAL inp_b_sync      : std_logic_vector(3 downto 0) := (others => '0');
  
BEGIN
  
  -- assign the keys to for the operation code
  -- KEY 0 - subtract
  -- KEY 1 - add
  op_code <= (NOT KEY(1)) & (NOT KEY(0));
  
  -- Invert the reset signal because add_sub module has
  -- active low reset
  reset <= NOT SW(9);
  
  -- Complete switch inputs to 4-bits
  inp_a_bcd <= '0' & SW(5 downto 3);
  inp_b_bcd <= '0' & SW(2 downto 0);
  
  --------------------------------------
  ---         SYNCHRONIZERS          ---
  --------------------------------------
  inp_a_syncronizer : clock_synchronizer
    GENERIC MAP(
      bit_width => 4
    )
    PORT MAP(
      clk      => CLOCK_50,
      reset    => reset,
      async_in => inp_a_bcd,
      sync_out => inp_a_sync
    );
    
  inp_b_syncronizer : clock_synchronizer
    GENERIC MAP(
      bit_width => 4
    )
    PORT MAP(
      clk      => CLOCK_50,
      reset    => reset,
      async_in => inp_b_bcd,
      sync_out => inp_b_sync
    );

  op_code_syncronizer : clock_synchronizer
    GENERIC MAP(
      bit_width => 2
    )
    PORT MAP(
      clk      => CLOCK_50,
      reset    => reset,
      async_in => op_code,
      sync_out => op_code_sync
    );
  --------------------------------------
  ---       END SYNCHRONIZERS        ---
  --------------------------------------

  PROCESS(reset, CLOCK_50) IS
  BEGIN
    IF(reset = '1') THEN
      operation <= '0'; -- Add
    ELSIF(rising_edge(CLOCK_50)) THEN
      -- The MSB of op_code is addition
      IF(op_code_sync = "10") THEN
        operation <= '0';
      -- The MSB of op_code is subtraction
      ELSIF(op_code_sync = "01") THEN
        operation <= '1'; -- Subtract
      END IF;
    END IF;
  END PROCESS;
  
  add_sub_module : add_sub
    GENERIC MAP (
      inp_width => 3
    )
    PORT MAP (
      reset_n => reset,
      clk => CLOCK_50,
      op_code => operation,
      inp_a => inp_a_sync(2 downto 0),
      inp_b => inp_b_sync(2 downto 0),
      --
      result => result
    );
  
  -- Connected to switches 3, 4, and 5
  -- displays the value of input a
  inp_a_disp : seven_seg
    PORT MAP (
      enable => '1',
      bcd => inp_a_sync,
      seven_seg_out => HEX4
    );
  
  -- Connected to switches 0, 1, and 2
  -- displays the value of input b
  inp_b_disp : seven_seg
    PORT MAP (
      enable => '1',
      bcd => inp_b_sync,
      seven_seg_out => HEX2
    );
  
  -- Display of the result
  -- changes only when one of the operation buttons are active
  result_disp : seven_seg
    PORT MAP (
      enable => '1',
      bcd => result,
      seven_seg_out => HEX0
    );
  
END ARCHITECTURE structural;

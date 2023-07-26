--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Lab8: 8-bit Processor
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
-- | 11/11/20 | ACS  | 1.0 | Created
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE top_pkg IS
  COMPONENT top IS
    PORT (
      CLOCK_50 : IN  std_logic;
      KEY      : IN  std_logic_vector(3 DOWNTO 0);
      --
      LEDR     : OUT std_logic_vector(8 DOWNTO 0);
      HEX0     : OUT std_logic_vector(6 DOWNTO 0);
      HEX1     : OUT std_logic_vector(6 DOWNTO 0);
      HEX2     : OUT std_logic_vector(6 DOWNTO 0)
      );
  END COMPONENT top;
END PACKAGE top_pkg;


------------------------------------------------------------------------------
 --                  COMPONENT 
 -----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;
USE work.lab7_pkg.ALL;
USE work.rising_edge_synchronizer_pkg.ALL;
USE work.rom;


ENTITY top IS
  PORT (
    CLOCK_50 : IN  std_logic;
    KEY      : IN  std_logic_vector(3 DOWNTO 0);
    --
    LEDR     : OUT std_logic_vector(8 DOWNTO 0);
    HEX0     : OUT std_logic_vector(6 DOWNTO 0);
    HEX1     : OUT std_logic_vector(6 DOWNTO 0);
    HEX2     : OUT std_logic_vector(6 DOWNTO 0)
    );
END ENTITY top;

ARCHITECTURE arch OF top IS

  COMPONENT rom IS
    PORT (
      address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      clock		  : IN STD_LOGIC  := '1';
      q		      : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
  END COMPONENT rom;

  SIGNAL exe_detect   : std_logic := '0';
  SIGNAL instruction  : std_logic_vector(15 downto 0) := (others => '0');
  SIGNAL instruc_reg  : std_logic_vector(15 downto 0) := (others => '0');
  SIGNAL rom_out      : std_logic_vector(15 downto 0) := (others => '0');
  SIGNAL address      : std_logic_vector(4 downto 0) := (others => '0');
  SIGNAL decode_en    : std_logic := '0';
  SIGNAL sw_sig       : std_logic_vector(9 downto 0) := (others => '0');
  SIGNAL keys_sig     : std_logic_vector(3 downto 0) := (others => '1');
  SIGNAL op_2bit      : std_logic_vector(1 downto 0) := (others => '0');
  
  ALIAS reset_n       : std_logic IS KEY(0);
  ALIAS data          : std_logic_vector(7 downto 0) IS instruction(7 downto 0);
  ALIAS ms_pb         : std_logic IS instruction(8);
  ALIAS mr_pb         : std_logic IS instruction(9);
  ALIAS operation     : std_logic_vector(3 downto 0) IS instruction(13 downto 10);

BEGIN

  op_2bit <= "00" WHEN operation = "1000" ELSE
             "01" WHEN operation = "0100" ELSE
             "11" WHEN operation = "0010" ELSE
             "10" WHEN operation = "0001" ELSE
             "00";
             
  sw_sig <= op_2bit & data;
  keys_sig(0) <= reset_n;
  keys_sig(1) <= NOT mr_pb;
  keys_sig(2) <= NOT ms_pb;
  keys_sig(3) <= NOT decode_en WHEN(mr_pb = '0' AND ms_pb = '0') ELSE '1';

  edge_detect_exe : rising_edge_synchronizer
    PORT MAP (
      clk => CLOCK_50,
      reset_n => reset_n,
      input => KEY(1),
      edge => exe_detect
    );
    
  addr_gen : PROCESS(reset_n, CLOCK_50) IS
  BEGIN
    IF(reset_n = '0') THEN
      address <= (others => '0');
    ELSIF(rising_edge(CLOCK_50)) THEN
      IF(exe_detect = '1') THEN
        address <= std_logic_vector(unsigned(address) + 1);
      END IF;
    END IF;
  END PROCESS addr_gen;
  
  LEDR(4 downto 0) <= address;
    
  rom_inst : rom 
    PORT MAP (
      address     => address,
      clock       => CLOCK_50,
      q           => rom_out
    );
  
  en_reg : PROCESS(reset_n, CLOCK_50) IS
  BEGIN
    IF(reset_n = '0') THEN
      instruc_reg <= (others => '0');
    ELSIF(rising_edge(CLOCK_50)) THEN
      instruction <= rom_out;
    END IF;
  END PROCESS en_reg;
  
  delay_reg : PROCESS(reset_n, CLOCK_50) IS
  BEGIN
    IF(reset_n = '0') THEN
      decode_en <= '0';
    ELSIF(rising_edge(CLOCK_50)) THEN
      decode_en <= exe_detect;
    END IF;
  END PROCESS delay_reg;
  
  -- PROCESS(CLOCK_50) IS
  -- BEGIN
    -- IF(reset_n = '0') THEN
      -- instruction <= (others => '0');
    -- ELSIF(rising_edge(CLOCK_50)) THEN
      -- IF(decode_en = '1') THEN
        -- instruction <= instruc_reg;
      -- END IF;
    -- END IF;
  -- END PROCESS;
  
  calculator : lab7
    PORT MAP (
      CLOCK_50 => CLOCK_50,
      SW => sw_sig,
      KEY => keys_sig,
      LEDR => open,
      HEX0 => HEX0,
      HEX2 => HEX1,
      HEX4 => HEX2
    );
  
END ARCHITECTURE arch;

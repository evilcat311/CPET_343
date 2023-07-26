--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Lab6: 8-bit Hardware Add/Subtract with State Machine
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
-- | 10/07/20 | ACS  | 1.0 | Created
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************

--*****************************************************************************
--***************************      Package       ******************************
--*****************************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE top_pkg IS
  COMPONENT top IS
    PORT (
      CLOCK_50 : IN  std_logic;
      SW       : IN  std_logic_vector(9 DOWNTO 0);
      KEY      : IN  std_logic_vector(3 DOWNTO 0);
      --
      LEDR     : OUT std_logic_vector(8 DOWNTO 0);
      HEX0     : OUT std_logic_vector(6 DOWNTO 0);
      HEX2     : OUT std_logic_vector(6 DOWNTO 0);
      HEX4     : OUT std_logic_vector(6 DOWNTO 0)
    );
  END COMPONENT;
END PACKAGE top_pkg;

--*****************************************************************************
--***************************    END Package     ******************************
--*****************************************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY work;
USE work.calculator_fsm_pkg.ALL;
USE work.clock_synchronizer_pkg.ALL;
USE work.add_sub_pkg.ALL;
USE work.input_storage_pkg.ALL;
USE work.three_digit_display_pkg.ALL;
USE work.rising_edge_synchronizer_pkg.ALL;

ENTITY top IS
  PORT (
    CLOCK_50 : IN  std_logic;
    SW       : IN  std_logic_vector(9 DOWNTO 0);
    KEY      : IN  std_logic_vector(3 DOWNTO 0);
    --
    LEDR     : OUT std_logic_vector(8 DOWNTO 0);
    HEX0     : OUT std_logic_vector(6 DOWNTO 0);
    HEX2     : OUT std_logic_vector(6 DOWNTO 0);
    HEX4     : OUT std_logic_vector(6 DOWNTO 0)
  );
END ENTITY top;

ARCHITECTURE arch OF top IS

  SIGNAL reset_n           : std_logic;
  SIGNAL key_pb            : std_logic;
  SIGNAL inv_key_sync        : std_logic;
  
  SIGNAL sw_sync           : std_logic_vector(9 downto 0) := (others => '0');
  SIGNAL key_sync          : std_logic;
  
  SIGNAL inp_a_write_en    : std_logic;
  SIGNAL inp_b_write_en    : std_logic;  
  SIGNAL inp_a             : std_logic_vector(7 downto 0);
  SIGNAL inp_b             : std_logic_vector(7 downto 0);
  
  SIGNAL op_code           : std_logic_vector(1 downto 0) := (others => '0');
  SIGNAL calc_result       : std_logic_vector(8 downto 0) := (others => '0');
  SIGNAL padded_result     : std_logic_vector(11 downto 0);
  
BEGIN
  
  -- Create padding to the result
  -- OR with 12 bit 0s to expand the result from 9 bits
  padded_result <=  "000" & calc_result;
  
  -- Assign reset to specific signal
  reset_n <= KEY(3);
  
  -- pb trigger
  key_pb <= KEY(0);
  inv_key_sync <= NOT key_sync;

  calc_block : add_sub
    GENERIC MAP (
      inp_width => inp_a'length
    )
    PORT MAP (
      reset_n => reset_n,
      clk => CLOCK_50,
      op_code => op_code,
      inp_a => inp_a,
      inp_b => inp_b,
      --
      op_enabled => open,
      result => calc_result
    );

  displays : three_digit_display
    PORT MAP (
      reset_n => reset_n,
      clk => CLOCK_50,
      input => padded_result,
      --
      ones     => HEX0,
      tens     => HEX2,
      hundreds => HEX4
    );
  ----------------------------------------
  --           Input Storage            --
  ----------------------------------------
  inp_a_store : input_storage
    GENERIC MAP (
      inp_width => 8
    )
    PORT MAP (
      clk => CLOCK_50,
      reset_n => reset_n,
      enable_write => inp_a_write_en,
      input => sw_sync(7 downto 0),
      --
      output => inp_a
    );
    
  inp_b_store : input_storage
    GENERIC MAP (
      inp_width => 8
    )
    PORT MAP (
      clk => CLOCK_50,
      reset_n => reset_n,
      enable_write => inp_b_write_en,
      input => sw_sync(7 downto 0),
      --
      output => inp_b
    );
  ----------------------------------------
  --         END Input Storage          --
  ----------------------------------------
  
  ----------------------------------------
  --        Clock Synchronization       --
  ----------------------------------------
  sw_clk_sync : clock_synchronizer
    GENERIC MAP (
      bit_width => 10
    )
    PORT MAP (
      clk => CLOCK_50,
      reset_n => reset_n,
      async_in => SW,
      sync_out => sw_sync
    );
    
  key_clk_sync : rising_edge_synchronizer
    PORT MAP (
      clk => CLOCK_50,
      reset_n => reset_n,
      input => key_pb,
      edge => key_sync
    );
  ----------------------------------------
  --     END Clock Synchronization      --
  ----------------------------------------
  
  
  -- Controls the LEDs that show current state
  top_inst : calculator_fsm
    PORT MAP (
      clock      => CLOCK_50,
      reset_n    => reset_n,      -- not synchronized because reset happens instantly
      exe_n      => inv_key_sync,     -- synchronized because it works with state change
      --
      led        => LEDR,
      op_code    => op_code,
      inp_a_en   => inp_a_write_en,
      inp_b_en   => inp_b_write_en
    );
    

END ARCHITECTURE arch;

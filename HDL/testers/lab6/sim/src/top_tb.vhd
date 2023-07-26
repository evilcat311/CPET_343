--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Andrew Serra
--
--       LAB NAME:  Lab6: 8-bit Hardware Add/Subtract with State Machine; testbench
--
--      FILE NAME:  top_tb.vhd
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
-------------------------------------------------------------------------------

-- include ieee packages here
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

-- include your packages here
LIBRARY work;
USE work.top_pkg.ALL;


ENTITY top_tb IS

END ENTITY top_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF top_tb IS

  SIGNAL clk_tb         : std_logic := '0';
  SIGNAL sw_tb          : std_logic_vector(9 downto 0) := (others => '0');
  SIGNAL key_tb         : std_logic_vector(3 downto 0) := (others => '0'); 
  --                    
  SIGNAL LEDR_tb        : std_logic_vector(8 downto 0);
  SIGNAL HEX0_tb        : std_logic_vector(6 downto 0);
  SIGNAL HEX2_tb        : std_logic_vector(6 downto 0);
  SIGNAL HEX4_tb        : std_logic_vector(6 downto 0);
  --                    
  SIGNAL sim_done       : boolean :=  false;
  
  CONSTANT PERIOD_c     : time := 20 ns;  -- 50 MHz
  
  PROCEDURE pb_event (signal pb : out std_logic) IS
  BEGIN
    pb <= '0';         -- State Change
    WAIT FOR PERIOD_c;
    pb <= '1';
    WAIT FOR PERIOD_c*2;
  END PROCEDURE pb_event;
    
BEGIN  -- test

    clk_tb <= NOT clk_tb AFTER (PERIOD_c / 2) WHEN (NOT sim_done) ELSE '0';
    
    ---------------------------------------------------------------------------
    -- instantiate the unit under test (UUT)
    ---------------------------------------------------------------------------
    UUT : top
    PORT MAP (
      CLOCK_50 => clk_tb,
      SW => sw_tb,
      KEY => key_tb,
      --
      LEDR => LEDR_tb,
      HEX0 => HEX0_tb,
      HEX2 => HEX2_tb,
      HEX4 => HEX4_tb
    );


    ---------------------------------------------------------------------------
    -- the process will apply the test vectors to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
    BEGIN  -- PROCESS stimulus
    
      sw_tb <= (others => '0');
      key_tb <= "1001";
      
      -- Allow the system to reset to initial state
      key_tb(3) <= '0';
      WAIT FOR PERIOD_c * 2;
      
      WAIT UNTIL clk_tb = '1';
      
      key_tb(3) <= '1';
      WAIT FOR PERIOD_c*2;
      
      FOR inp_a IN 0 TO ((2**8)-1) LOOP
        sw_tb <= std_logic_vector(to_unsigned(inp_a, sw_tb'length));
        pb_event(key_tb(0)); -- GO TO INPUT_B
        
        FOR inp_b IN 0 TO ((2**8)-1) LOOP
          sw_tb <= std_logic_vector(to_unsigned(inp_b, sw_tb'length));
          pb_event(key_tb(0)); -- INPUT_B -> GO TO DISP_SUM
          
          pb_event(key_tb(0)); -- DISP_SUM -> GO TO DISP_DIFF
          pb_event(key_tb(0)); -- DISP_DIFF -> GO TO INPUT_A
  
          IF(inp_b /= ((2**8)-1)) THEN
            sw_tb <= std_logic_vector(to_unsigned(inp_a, sw_tb'length));
            pb_event(key_tb(0)); -- INPUT_A -> GO TO INPUT_B
          END IF;
        END LOOP;
      END LOOP;
      
      sim_done <= true;
      WAIT FOR PERIOD_c;
      
      -- End simulation
      wait;
    END PROCESS stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------

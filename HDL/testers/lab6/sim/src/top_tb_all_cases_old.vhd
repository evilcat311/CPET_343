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
      WAIT FOR PERIOD_c * 2;
      
      -- Allow the system to reset to initial state
      key_tb(3) <= '0';
      WAIT FOR PERIOD_c * 2;
      key_tb(3) <= '1';
      WAIT FOR PERIOD_c;
      
      FOR idx IN 0 TO ((2**sw_tb'length)-1) LOOP
        sw_tb <= std_logic_vector(to_unsigned(idx, sw_tb'length));
        
        WAIT FOR PERIOD_c;
        
        IF(idx mod 5 = 0) THEN
          key_tb(0) <= '0'; -- State change
        ELSE 
          key_tb(0) <= '1';
        END IF;
        
        WAIT FOR PERIOD_c;
        
        IF(sw_tb(8) = '1') THEN
          EXIT;
        END IF;
      END LOOP;
      
      sim_done <= true;
      WAIT FOR PERIOD_c;
      
      -- End simulation
      wait;
    END PROCESS stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------

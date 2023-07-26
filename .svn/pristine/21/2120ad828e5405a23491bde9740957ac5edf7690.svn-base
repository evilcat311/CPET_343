--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--  DESIGNER NAME:  <enter your name here>
--
--       LAB NAME:  Labx: <name of lab>
--
--      FILE NAME:  processor.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--    This file uses two buttons and a switch to execute functions on
--    a simulated microprocessor.  Switch 9 changes the mode from reading
--    the state to reading the memory access value, and the buttons will
--    either execute the current instruction or reset the processor.
--  REVISION HISTORY
--
--  _______________________________________________________________________
-- |  DATE    | USER | Ver |  Description                                  |
-- |==========+======+=====+================================================
-- |          |      |     |
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE processor_pkg IS
  COMPONENT processor IS    -- REPLACE adderSingleBitStructural with the name of this file

    Port ( 	clk_50mhz 	    : in  STD_LOGIC; --Input clock
            reset           : in  STD_LOGIC; --resets processor
			execute         : in  STD_LOGIC; --executes instruction
            --modeSel         : in  STD_LOGIC; --switch LED modes
			--
			hex2	    : out STD_LOGIC_VECTOR(6 downto 0);  --7-seg display outputs (g to a)
			hex1	    : out STD_LOGIC_VECTOR(6 downto 0);  --for 7seg display
			hex0	    : out STD_LOGIC_VECTOR(6 downto 0);
			ledOut      : out STD_LOGIC_VECTOR(3 downto 0) := "0000"
			);
  END COMPONENT;
END PACKAGE processor_pkg;


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
--USE ieee.numeric_std_unsigned.ALL;
--Import Packages from working directory
library work;
USE work.common_pkg.ALL;
USE work.bcd2seven_seg_pkg.ALL;
USE work.edge_detect_pkg.ALL;
USE work.clock_synchronizer_pkg.ALL;
USE work.double_dabble_pkg.ALL;
USE work.alu_pkg.ALL;
USE work.raminfr_pkg.ALL;
USE work.add_sub_pkg.ALL;


entity processor is
	Port ( 	clk_50mhz 	    : in  STD_LOGIC; --Input clock
            reset           : in  STD_LOGIC; --resets processor
			execute         : in  STD_LOGIC; --executes instruction
			--modeSel         : in  STD_LOGIC; --switch LED modes
			--
			hex2	    : out STD_LOGIC_VECTOR(6 downto 0);  --7-seg display outputs (g to a)
			hex1	    : out STD_LOGIC_VECTOR(6 downto 0);  --for 7seg display
			hex0	    : out STD_LOGIC_VECTOR(6 downto 0);
			ledOut      : out STD_LOGIC_VECTOR(3 downto 0) := "0000"	
			); 
end processor;

architecture proc of processor is --created implementation
--state definitions

--signal declarations 
signal count_sig    : integer range 0 to 31 := 0;
--synchronized/edge detecting signals (inputs, then internal)
--signal opcode       : std_logic_vector(3 downto 0) := "0000";
signal rom_out      : std_logic_vector(11 downto 0) := "000000000000";
signal exeSync      : std_logic;
signal zExeSync     : std_logic;
signal memAddr      : std_logic_vector(4 downto 0) := "00000";
--signal modeSync     : std_logic;
signal hex1s        : std_logic_vector(6 downto 0) := "0000000";
signal hex10s       : std_logic_vector(6 downto 0) := "0000000";
signal hex100s      : std_logic_vector(6 downto 0) := "0000000";
signal l7led        : std_logic_vector(3 downto 0) := "0000";

--component declaration (ROM)
component lab8rom
    port(   address :   in  STD_LOGIC_VECTOR(4 downto 0);
            clock   :   in  STD_LOGIC;
            q       :   out STD_LOGIC_VECTOR(11 downto 0)
        );
end component;

--begin architecture
begin
--syncing inputs
resetEdge: edge_detect --detects execute rising edge
port map(
  clock => clk_50mhz,
  reset_n => reset,
  DataIn  => execute,
  --
  RisingEdge => open,
  FallingEdge => exeSync
);
exeDelay: edge_detect --delays execute signal
port map(
  clock => clk_50mhz,
  reset_n => reset,
  DataIn  => exeSync,
  --
  RisingEdge => open,
  FallingEdge => zExeSync
);

-- modeSynced: clock_synchronizer -- sync push buttons
  -- generic map (
    -- bit_width => 1
  -- )
  -- port map (
    -- clock => clk_50mhz,
    -- reset_n  => reset,
    -- async_in(0) => modeSel,
    
    -- sync_out(0) => modeSync
-- );
--instantiate ROM
rom1: lab8rom port map(
    memAddr, 
    clk_50mhz, 
    rom_out
);

--lab 7 map
L7: add_sub
Port map( 	
    clk_50mhz   => clk_50mhz,
    op_mode     => rom_out(11 downto 10),
	a_in        => rom_out(7 downto 0),
	--reset_n   
	pb_in       => exeSync & rom_out(9 downto 8) & reset,
	--          
	hex2        => hex100s,
	hex1        => hex10s,
	hex0        => hex1s,
	ledOut      => l7led
); 
--processes
--counter when execute goes up, address increases
process(clk_50mhz,reset, execute, exeSync)
  begin
    if (reset = '0') then 
      count_sig <= 0;
    elsif (clk_50mhz'event and clk_50mhz = '1') then
        if(zExeSync = '1') then
          if (count_sig = 32) then
            count_sig <= 0;
          else
            count_sig <= count_sig + 1;
          end if;
        end if;
    end if;
end process;

--if modeSel is 0, make leds display state output, if 1 display ROM address
-- process(modeSync, count_sig, l7led, reset, clk_50mhz)
    -- begin
        -- if(reset = '1') then
            -- ledOut <= "0000";
        -- else
            -- if(modeSync = '0') then
                -- ledOut <= l7led;
            -- else
                -- ledOut <= std_logic_vector(count_sig, 4);
            -- end if;
        -- end if;
-- end process;

--set outputs
memAddr <= std_logic_vector(to_unsigned(count_sig, memAddr'length));
hex2    <= hex100s;
hex1    <= hex10s;
hex0    <= hex1s;
ledOut  <= std_logic_vector(to_unsigned(count_sig,4));
end proc;
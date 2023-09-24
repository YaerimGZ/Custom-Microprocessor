-------------------------------------------------------------------------------
--
-- Company : CETYS Universidad
-- Engineer: Karla Yaerim Gómez Zambrano
-- 
-- Create Date:    22/05/2021 20:48:20
-- Project Name:   CPU
-- Module Name:    CPU_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity CPU_tb is
end    CPU_tb;

architecture Testbench of CPU_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component CPU
   port( RESET, CLK: IN STD_LOGIC;
		PUERTOA, PUERTOC, PUERTOE: IN STD_LOGIC_VECTOR(7 downto 0);
		PUERTOB, PUERTOD, PUERTOF: OUT STD_LOGIC_VECTOR(7 downto 0));
   end component;

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: CPU use entity WORK.CPU(arq1);

   -- Inputs/Outputs
    signal RESET: STD_LOGIC;
	signal PUERTOA, PUERTOC, PUERTOE, PUERTOB, PUERTOD, PUERTOF: STD_LOGIC_VECTOR(7 downto 0);

   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
   signal   clk : std_logic := '0';
   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: CPU port map (RESET, CLK, PUERTOA, PUERTOC, PUERTOE, PUERTOB, PUERTOD, PUERTOF);

-- Clock process (uncomment if needed)
-- Descomentar en caso de requerir senial de reloj
-- Sustituir <clock> por el nombre de puerto apropiado
clock_process : process
begin
   while (clock_on) loop
      CLK <= '0';
      wait for clock_period/2;
      CLK <= '1';
      wait for clock_period/2;
   end loop;
   --assert (false) report ("Finished") severity error;
   -- Wait forever
   wait;
 end process;

-- Stimulus process
stim_proc: process
begin
   -- hold reset state for 100 ns
   	RESET <= '1';
	PUERTOA <= x"10";
   wait for 4000 ns;
	
	

   wait for 100 ns;
	
   -- assert (<condition>) report "Error case 2" severity error;

   -- Stop clock
   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;

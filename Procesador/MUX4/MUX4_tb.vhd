-------------------------------------------------------------------------------
--
-- Company : CETYS Universidad
-- Engineer: Karla Yaerim G�mez Zambrano
-- 
-- Create Date:    23/05/2021 00:51:16
-- Project Name:   MUX4
-- Module Name:    MUX4_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity MUX4_tb is
end    MUX4_tb;

architecture Testbench of MUX4_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component MUX4
--   port();
   end component;

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: MUX4 use entity WORK.MUX4(arq1);

   -- Inputs/Outputs
   -- signal ...

   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
--   signal   <clock> : std_logic := '0';
--   constant clock_period : time := 50 ns;
--   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: MUX4 port map ( );

-- Clock process (uncomment if needed)
-- Descomentar en caso de requerir senial de reloj
-- Sustituir <clock> por el nombre de puerto apropiado
--clock_process : process
--begin
--   while (clock_on) loop
--      <clock> <= '0';
--      wait for clock_period/2;
--      <clock> <= '1';
--      wait for clock_period/2;
--   end loop;
--   --assert (false) report ("Finished") severity error;
--   -- Wait forever
--   wait;
-- end process;

-- Stimulus process
stim_proc: process
begin
   -- hold reset state for 100 ns
   wait for 100 ns;

   ---------------------------------------------------------
   -- insert stimulus here
   ---------------------------------------------------------

   -- Test case 1
   -- ... Asignaciones a seniales de entrada ...
   wait for 100 ns;
   -- assert (<condition>) report "Error case 1" severity error;

   -- Test case 2
   -- ... Asignaciones a seniales de entrada ...
   wait for 100 ns;
   -- assert (<condition>) report "Error case 2" severity error;

   -- Stop clock
--   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;

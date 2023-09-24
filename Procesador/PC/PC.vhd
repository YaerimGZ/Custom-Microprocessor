-------------------------------------------------------------------------------
--
-- Company : CETYS UNIVERSIDAD
-- Engineer: Michelle Campbell
-- 
-- Create Date:    01/06/2021 00:01:11
-- Project Name:   PC
-- Module Name:    PC.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity PC is
   port(add, load, reset, clk : in STD_LOGIC;
		PC_in : in STD_LOGIC_VECTOR(8 downto 0);
		PC_out: out STD_LOGIC_VECTOR(8 downto 0));
end PC;

architecture arq1 of PC is
begin

process(add, load, clk, PC_in)
	variable count : STD_LOGIC_VECTOR(8 downto 0) := "000000000";

	begin
		if reset = '0' then
			count := "000000000";
		
		elsif clk'event and clk = '1' then
			if load = '1' then
				count := PC_in;

			elsif add = '1' then
				count := STD_LOGIC_VECTOR(UNSIGNED(count)+1);

			end if;
		end if;

		PC_out <= count;
		
	end process;
end arq1;

-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: miche
-- 
-- Create Date:    02/06/2021 00:32:07
-- Project Name:   FR
-- Module Name:    FR.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity FR is
   port(ZF, NF, clk, ALUOE : in STD_LOGIC;
		zeros, neg: out STD_LOGIC);
end FR;

architecture arq1 of FR is
begin

	process(ZF, NF, clk, ALUOE)
		begin
			if clk'event and clk = '1'and ALUOE ='1' then
				zeros <= ZF;
				neg <= NF;

		end if;
	end process;
end arq1;

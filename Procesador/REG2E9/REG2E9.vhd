-------------------------------------------------------------------------------
--
-- Company : CETYS Universidad
-- Engineer: Dilan Macaco Hernandez
-- 
-- Create Date:    23/05/2021 01:11:10
-- Project Name:   REG2E9
-- Module Name:    REG2E9.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity REG2E9 is
   port(LOAD, SEL, CLK: IN STD_LOGIC;
		ENTRADA: IN STD_LOGIC_VECTOR(8 downto 0);
		DIRE: IN STD_LOGIC_VECTOR(8 downto 0);
		SALIDA: OUT STD_LOGIC_VECTOR(8 downto 0));
end REG2E9;

architecture arq1 of REG2E9 is

begin
	process(ENTRADA, DIRE, CLK, SEL, LOAD)
		variable ACC : STD_LOGIC_VECTOR (8 DOWNTO 0) := "000000000";
			begin
				if CLK'event and CLK = '1' and LOAD = '1' then
					if SEL = '0' then
						ACC := ENTRADA;
					else
						ACC := DIRE;
					end if;
				end if;
		SALIDA <= ACC;
	end process;
end arq1;

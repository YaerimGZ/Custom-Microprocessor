-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: dentk
-- 
-- Create Date:    26/05/2021 11:00:55
-- Project Name:   REG3E8
-- Module Name:    REG3E8.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity REG3E8 is
   port(LOAD, OE, CLK: IN STD_LOGIC;
		ENTRADA: IN STD_LOGIC_VECTOR(7 downto 0);
		SALIDA: OUT STD_LOGIC_VECTOR(7 downto 0));
end REG3E8;

architecture arq1 of REG3E8 is
	signal VALOR : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
begin

process(CLK, OE, LOAD)
begin
	if CLK'event and CLK ='1' and LOAD = '1' then
		VALOR <= ENTRADA;
	end if;
	if OE = '0' then
		SALIDA <= VALOR;
	else
		SALIDA <= "ZZZZZZZZ";
	end if;
end process;

end arq1;
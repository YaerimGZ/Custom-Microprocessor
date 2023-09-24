-------------------------------------------------------------------------------
--
-- Company : CETYS Universidad
-- Engineer: Karla Yaerim Gómez Zambrano
-- 
-- Create Date:    22/05/2021 23:46:08
-- Project Name:   RG8
-- Module Name:    RG8.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity RG8 is
   port(ENTRADA: IN STD_LOGIC_VECTOR(7 downto 0);	
		LOAD, CLK, RESET: IN STD_LOGIC;
		SALIDA: OUT STD_LOGIC_VECTOR(7 downto 0));
end RG8;

architecture arq1 of RG8 is
begin
	process(ENTRADA, LOAD, CLK)
	begin
		if RESET = '1' then
			if CLK'event and CLK = '1' then
				if LOAD = '1' then
					SALIDA <= ENTRADA;
				end if;
			end if;
		else
			SALIDA <= "00000000";
	end if;
	end process;
end arq1;

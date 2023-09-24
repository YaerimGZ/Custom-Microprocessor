-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: miche
-- 
-- Create Date:    02/06/2021 00:38:51
-- Project Name:   DECODIFICADOR
-- Module Name:    DECODIFICADOR.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity DECODIFICADOR is
   port( WR, MEMOE, clk: IN STD_LOGIC;
		ENTRADA: IN STD_LOGIC_VECTOR(8 downto 0);
		CS: OUT STD_LOGIC;
		PA, PC, PE : OUT STD_LOGIC;
		PB, PD, PF : OUT STD_LOGIC );

end DECODIFICADOR;

architecture arq1 of DECODIFICADOR is
signal SPA, SPB, SPC, SPD, SPE, SPF : STD_Logic := '0';
begin

	process(WR, MEMOE, clk)
		begin
			if clk'event and clk = '0' then
				if ENTRADA = "111111010" and MEMOE = '0' then
					SPA <= '1';
				else
					SPA <= '0';
				end if;

				if ENTRADA = "111111011" and WR = '0' then
					SPB <= '1';
				else
					SPB <= '0';
				end if;

				if ENTRADA = "111111100" and MEMOE = '0' then
					SPC <= '1';
				else
					SPC <= '0';
				end if;

				if ENTRADA = "111111101" and WR = '0' then
					SPD <= '1';
				else
					SPD <= '0';
				end if;

				if ENTRADA = "111111110" and MEMOE = '0' then
					SPE <= '1';
				else
					SPE <= '0';
				end if;

				if ENTRADA = "111111111" and WR = '0' then
					SPF <= '1';
				else
					SPF <= '0';
				end if;
			end if;
	end process;

			PA <= SPA;
			PB <= SPB;
			PC <= SPC;
			PD <= SPD;
			PE <= SPE;
			PF <= SPF;
			CS <= (SPA or SPB or SPC or SPD or SPE or SPF);
	
end arq1;

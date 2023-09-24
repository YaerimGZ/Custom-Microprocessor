-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Karla
-- 
-- Create Date:    01/06/2021 19:36:11
-- Project Name:   ALU
-- Module Name:    ALU.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity ALU is
   port(OPA, OPB : in STD_LOGIC_VECTOR(7 downto 0);
		OPER : in STD_LOGIC_VECTOR(5 downto 0);
		OE, clk	: in STD_LOGIC;
		ZF, NF	: out STD_LOGIC;
		R : out STD_LOGIC_VECTOR(7 downto 0));
end ALU;

architecture arq1 of ALU is

signal Rtemp: STD_LOGIC_VECTOR (15 DOWNTO 0);

begin

	with OE select R <= 
	RTEMP(7 downto 0) when '0', "ZZZZZZZZ" when others;

	process (OPA, OPB, OPER, OE) --clk OE 
		begin

		if OE'event and OE='0' THEN

			if (OPER(5 downto 2) = "0000") THEN
				Rtemp <= std_logic_vector(unsigned(x"00"&OPA) + unsigned(x"00"&OPB));

			elsif (OPER(5 downto 2) = "0001") THEN
				Rtemp <= std_logic_vector(unsigned(x"00"&OPA) - unsigned(x"00"&OPB));
					
			elsif (OPER(5 downto 2) = "0010") THEN
				Rtemp <= std_logic_vector(unsigned(OPA) * unsigned(OPB));

			elsif (OPER(5 downto 2) = "0011") THEN
				Rtemp <= std_logic_vector(unsigned(OPA) / unsigned(OPB));

			elsif (OPER(5 downto 2) = "0100") THEN
				Rtemp <= (x"00" & OPA) AND (x"00" & OPB);
			
			elsif (OPER(5 downto 2) = "0101") THEN
				RTEMP <= (x"00" & OPA) OR (x"00" & OPB);

			elsif (OPER = "011000") THEN
				RTEMP <= NOT (x"00" & OPA);

			elsif (OPER = "011001") THEN
				RTEMP <= ("0000000" & OPA  & '0');

			elsif (OPER = "011010") THEN
				RTEMP <= ("000000000" & OPA(7 downto 1));  
			
			elsif (OPER(5 downto 2) = "0111") THEN
				RTEMP <= (x"00" & OPA) XOR (x"00" & OPB);

			elsif (OPER(5 downto 2) = "1000") THEN
				RTEMP <= (x"00" & OPB);	
			
			elsif (OPER(5 downto 2) = "1101") THEN
				RTEMP <= (x"00" & OPA);		

			else
				RTEMP <= x"0000";
			end if;

		ZF <= not (RTEMP(7) or RTEMP(6) or RTEMP(5) or RTEMP(4) or RTEMP(3) or RTEMP(2) or RTEMP(1) or RTEMP(0));
		NF <= RTEMP(15);

		end if;

	end process;

	

end arq1;
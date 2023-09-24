-------------------------------------------------------------------------------
--
-- Company : CETYS Universidad
-- Engineer: Karla Yaerim Gómez Zambrano
-- 
-- Create Date:    23/05/2021 00:51:16
-- Project Name:   MUX4
-- Module Name:    MUX4.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity MUX4 is
   port(A, B, C, D: IN STD_LOGIC_VECTOR (7 downto 0);
		SEL: IN STD_LOGIC_VECTOR(1 downto 0);
		OP: OUT STD_LOGIC_VECTOR(7 downto 0));
end MUX4;

architecture arq1 of MUX4 is
begin

	process(A, B, C, D, SEL)
	begin
		case(SEL) is
			when "00" =>
				OP <= A;
			when "01" =>
				OP <= B;
			when "10" =>
				OP <= C;
			when "11" =>
				OP <= D;
			when others =>
				OP <= (others => '0');
		end case;
	end process;

end arq1;

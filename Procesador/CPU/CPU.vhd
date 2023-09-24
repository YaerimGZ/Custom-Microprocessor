-------------------------------------------------------------------------------
--
-- Company : CETYS Universidad
-- Engineer: Karla Yaerim Gómez Zambrano
-- 
-- Create Date:    22/05/2021 20:48:20
-- Project Name:   CPU
-- Module Name:    CPU.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity CPU is
   port( RESET, CLK: IN STD_LOGIC;
		PUERTOA, PUERTOC, PUERTOE: IN STD_LOGIC_VECTOR(7 downto 0);
		PUERTOB, PUERTOD, PUERTOF: OUT STD_LOGIC_VECTOR(7 downto 0));
end CPU;

architecture arq1 of CPU is
	component PC is
		port(add, load, reset, clk : in STD_LOGIC;
		PC_in : in STD_LOGIC_VECTOR(8 downto 0);
		PC_out: out STD_LOGIC_VECTOR(8 downto 0));
	end component;

	component REG2E9 is
   		port(LOAD, SEL, CLK: IN STD_LOGIC;
			ENTRADA: IN STD_LOGIC_VECTOR(8 downto 0);
			DIRE: IN STD_LOGIC_VECTOR(8 downto 0);
			SALIDA: OUT STD_LOGIC_VECTOR(8 downto 0));
	end component;

	component MEMORIA is
   		port(A: IN STD_LOGIC_VECTOR(8 downto 0);
			 D: INOUT STD_LOGIC_VECTOR(7 downto 0);
			 WR, OE, CS: IN STD_LOGIC);
	end component;

	component REG3E8 is
		port(LOAD, OE, CLK: STD_LOGIC;
			ENTRADA: IN STD_LOGIC_VECTOR(7 downto 0);
			SALIDA: OUT STD_LOGIC_VECTOR(7 downto 0));
	end component;

	component RG8 is
		port(ENTRADA: IN STD_LOGIC_VECTOR(7 downto 0);
			LOAD, CLK, RESET: IN STD_LOGIC;
			SALIDA: OUT STD_LOGIC_VECTOR(7 downto 0));
	end component;

	component MUX4 is
		port(A, B, C, D: IN STD_LOGIC_VECTOR(7 downto 0);
			SEL: IN STD_LOGIC_VECTOR(1 downto 0);
			OP: OUT STD_LOGIC_VECTOR(7 downto 0));
	end component;

	component FR is
		   port( ZF, NF, clk, ALUOE : in STD_LOGIC;
			zeros, neg: out STD_LOGIC );
	end component;

	component ALU is
		port(OPA, OPB: IN STD_LOGIC_VECTOR(7 downto 0);
			OPER: IN STD_LOGIC_VECTOR(5 downto 0);
			OE, CLK: IN STD_LOGIC;
			ZF, NF: OUT STD_LOGIC;
			R: OUT STD_LOGIC_VECTOR(7 downto 0));
	end component;

	component CONTROL is
		port(COOP: IN STD_LOGIC_VECTOR(7 downto 0);
			RESET, CLK: IN STD_LOGIC;
			SCONTROL: OUT STD_LOGIC_VECTOR(15 downto 0));
	end component;

	component DECODIFICADOR is
	   port( WR, MEMOE, clk: IN STD_LOGIC;
		ENTRADA: IN STD_LOGIC_VECTOR(8 downto 0);
		CS: OUT STD_LOGIC;
		PA, PB, PC, PD, PE, PF: INOUT STD_LOGIC );
	end component;

	signal DIRE, SALPC, BUS_DIR: STD_LOGIC_VECTOR(8 downto 0) := "000000000";
	signal COOP, SR1, SR2, SR3, OPA, OPB, BUS_DATA: STD_LOGIC_VECTOR(7 downto 0) := "00000000";
	signal OPER: STD_LOGIC_VECTOR(5 downto 0) := "000000";
	signal SENALESC: STD_LOGIC_VECTOR(15 downto 0) := x"0000";
	signal SELA, SELB: STD_LOGIC_VECTOR(1 downto 0) := "00";
	signal SZF, SNF, ADDPC, LDPC, LDMAR, LDMBR, LDIR, SEL, SER1, SER2, SER3: STD_LOGIC := '0';
	signal ZF, NF, MEMOE, WR, ALUOE, SEMBR, SPA, SPB, SPC, SPD, SPE, SPF, CS: STD_LOGIC := '0';

begin

	COUNTER: PC port map(ADDPC, LDPC, RESET, CLK, DIRE, SALPC);
	MAR: REG2E9 port map(LDMAR, SEL, CLK, SALPC, DIRE, BUS_DIR);
	MEM: Memoria port map(BUS_DIR, BUS_DATA, WR, MEMOE, CS);
	MBR: REG3E8 port map(LDMBR, SEMBR, CLK, BUS_DATA, BUS_DATA);
	IR: RG8 port map(BUS_DATA, LDIR, CLK, RESET, COOP);
	R1: RG8 port map(BUS_DATA, SER1, CLK, RESET, SR1);
	R2: RG8 port map(BUS_DATA, SER2, CLK, RESET, SR2);
	R3:	RG8 port map(BUS_DATA, SER3, CLK, RESET, SR3);
	MUXA: MUX4 port map(BUS_DATA, SR1, SR2, SR3, SELA, OPA);
	MUXB: MUX4 port map(BUS_DATA, SR1, SR2, SR3, SELB, OPB);
	UAL: ALU port map(OPA, OPB, OPER, ALUOE, CLK, SZF, SNF, BUS_DATA);
	UCTL: CONTROL port map(COOP, RESET, CLK, SENALESC);
	DEC: DECODIFICADOR port map(WR, MEMOE, CLK, BUS_DIR, CS, SPA, SPB, SPC, SPD, SPE, SPF);
	PTOB: RG8 port map(BUS_DATA, SPB, CLK, RESET, PUERTOB);
	PTOD: RG8 port map(BUS_DATA, SPD, CLK, RESET, PUERTOD);
	PTOF: RG8 port map(BUS_DATA, SPF, CLK, RESET, PUERTOF);
	FLAGS: FR port map(SZF, SNF, CLK, ALUOE, ZF, NF);

	DIRE <= COOP(0) & BUS_DATA;
	OPER <= COOP(7 downto 2);
	ADDPC <= SENALESC(12);
	LDPC <= SENALESC(11);
	LDMAR <= SENALESC(10);
	SEL <= SENALESC(9);
	LDMBR <= SENALESC(8);
	SEMBR <= SENALESC(7);
	LDIR <= SENALESC(6);
	MEMOE <= SENALESC(5);
	WR <= SENALESC(4);
	ALUOE <= SENALESC(3);
	SER1 <= SENALESC(2);
	SER2 <= SENALESC(1);
	SER3 <= SENALESC(0);
	SELA <= COOP(3 downto 2);
	SELB <= COOP(1 downto 0);
	
	
	process(CLK, WR, MEMOE)
		begin
			if CLK'event and CLK = '1' then
				if SPB = '1' and WR = '0' then
					PUERTOB <= BUS_DATA;
				end if;
				if SPD = '1' and WR = '0' then
					PUERTOD <= BUS_DATA;
				end if;
				if SPF = '1' and WR = '0' then
					PUERTOF <= BUS_DATA;
				end if;

				if SPA = '1' and MEMOE = '0' then
					BUS_DATA <= PUERTOA;
				elsif SPC = '1' and MEMOE = '0' then
					BUS_DATA <= PUERTOC;
				elsif SPE = '1' and MEMOE = '0' then
					BUS_DATA <= PUERTOE;
				else
					BUS_DATA <= "ZZZZZZZZ";
				end if;
			end if;
		end process;

end arq1;

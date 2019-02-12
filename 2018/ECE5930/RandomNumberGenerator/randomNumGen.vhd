--------------------------------------------------------------------------
-- LSFR based pseudo random number generator with seven Segment display
-- generates random hex value 0 - 255 and dispays on seven segment display
-- 
--	Nathan Tipton Copyright 2018
--
--
-- inputs:
-- clock - system clock
-- reset - revert back to seed value, also change seed
-- go - generate new random number
-- SW - seed for generator based on switches (10 bits)
--
-- outputs:
-- random - pseudo random 8 bit number
-- LEDR - outputs seed on LEDS
--
--
--
--
--
---------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RandomNumberGenerator is
	port(
		MAX10_CLK1_50		:in std_logic;
		key				:in unsigned(1 downto 0);
		go					:in std_logic;
		SW					:in unsigned(9 downto 0);
		LEDR				:out unsigned(9 downto 0);
		HEX0				:out unsigned(7 downto 0);
		HEX1				:out unsigned(7 downto 0);
		HEX2				:out unsigned(7 downto 0);
		HEX3				:out unsigned(7 downto 0);
		HEX4				:out unsigned(7 downto 0);
		HEX5				:out unsigned(7 downto 0)
	
	
	
		
	);
end RandomNumberGenerator;

architecture RTL of RandomNumberGenerator is

signal digit1 :unsigned(3 downto 0);
signal digit2 :unsigned(3 downto 0);
component lfsr is
	port(	
			clk						:in std_logic;
			reset_btn 				:in std_logic;
			go_btn					:in std_logic;
			seedSW					:in unsigned(9 downto 0);
			random					:out unsigned (7 downto 0)
		
		);
end component lfsr;


component sevenSeg is
	port(
		clk :in std_logic;
		num_in	:in	unsigned(3 downto 0);
		seg_out	:out	unsigned(7 downto 0);
		dec :in std_logic
	);
end component sevenSeg;
begin

reg: lfsr
port map(
		clk => MAX10_CLK1_50,
		reset_btn => key(1),
		go_btn => key(0),
		seedSW (9 downto 0) =>SW (9 downto 0),
		random (3 downto 0) =>digit1(3 downto 0),
		random(7 downto 4) =>digit2(3 downto 0)


);

dig1: sevenSeg
	port map(
		clk => MAX10_CLK1_50,
		num_in (3 downto 0) => digit1(3 downto 0),
		seg_out(7 downto 0) =>HEX0(7 downto 0),
		dec => '0'
);

dig2: sevenSeg
	port map(
		clk => MAX10_CLK1_50,
		num_in (3 downto 0) => digit2(3 downto 0),
		seg_out(7 downto 0) =>HEX1(7 downto 0),
		dec => '0'
);
HEX2<=X"FF";
HEX3<=X"FF";
HEX4<=X"FF";
HEX5<=X"FF";
LEDR(9 downto 0) <= SW(9 downto 0);


end architecture RTL;
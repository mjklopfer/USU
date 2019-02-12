--------------------------------------------------------------------------
-- LSFR pseudo random number generator for De-lite 10
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
--
--
--
--
--
---------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lfsr is
	port(	
		clk		:in std_logic;
		reset_btn 				:in std_logic;
		go_btn						:in std_logic;
		seedSW						:in unsigned(9 downto 0);
		random				:out unsigned (7 downto 0)
	
	);
	end lfsr;
	
architecture RTL of lfsr is

	signal seed2 :unsigned (9 downto 0) := "0100100101";
	signal temp :unsigned (19 downto 0) := "00010000010000010001";
	signal seed :unsigned (19 downto 0);

	begin
	
	seed <= seedSW & (seed2 or seedSW);
	
	
	generator : process(clk, reset_btn)
	variable feedback : std_logic := '0';
	begin
		
		if reset_btn='0' then
			temp<=seed;
		elsif rising_edge(clk) then
			if go_btn='0'then
				feedback := not(temp(19) xor temp(2));
				temp <= feedback & temp(19 downto 1);
			end if;
	
		end if;
	
	end process generator;
	random (7) <= temp (7);
	random (6) <= temp (12);
	random (5) <= temp (5);
	random (4) <= temp (9);
	random (3) <= temp (4);
	random (2) <= temp (18);
	random (1) <= temp (11);
	random (0) <= temp (3);
	end architecture RTL;



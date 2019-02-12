library ieee;
use ieee.std_logic_1164.all;
entity color is
	port(
		clk	:in std_logic;
		btn	:in std_logic;
		R		:out std_logic_vector(3 downto 0);
		G		:out std_logic_vector(3 downto 0);
		B		:out std_logic_vector(3 downto 0);
		hPos	:in	integer;
		Data_en	:in	std_logic;
	
	
	);
	
architecture RTL of color is


begin











end architecture RTL;
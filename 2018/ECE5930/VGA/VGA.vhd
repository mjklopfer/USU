library ieee;
use ieee.std_logic_1164.all;

entity VGA is
	port(
	ADC_CLK_10	:in	std_logic;
	MAX10_CLK1_50	:in	std_logic;
	MAX10_CLK2_50	:in	std_logic;
	KEY	:in	std_logic_vector(1 downto 0);
	VGA_B	:out	std_logic_vector(3 downto 0);
	VGA_G :out	std_logic_vector(3 downto 0);
	VGA_HS :out	std_logic;
	VGA_R :out	std_logic_vector(3 downto 0);
	VGA_VS :out std_logic;
	ClockOut :out std_logic;
	MClockOut :out std_logic
	
	
	);
	end VGA;

	architecture RTL of VGA is
	signal VGA_CLK :std_logic;
	
	signal Ro :std_logic_vector (3 downto 0);
	signal Go :std_logic_vector (3 downto 0);
	signal Bo :std_logic_vector (3 downto 0);
	
	component PLL_VGA IS
	PORT
	(
		
		inclk0		: IN STD_LOGIC;
		c0		: OUT STD_LOGIC 
	);
	end component PLL_VGA;
	
	component sync is
	port(
clk :in std_logic;
	hs	 :out std_logic;
	vs  :out std_logic;
	reset :in std_logic;
	R :out std_logic_vector(3 downto 0);
	G :out std_logic_vector(3 downto 0);
	B :out std_logic_vector(3 downto 0);
	btn :in std_logic
	
	);
	end component sync;
	
	
	begin
	
	VGAPLL :PLL_VGA
		port map(

		inclk0=>MAX10_CLK1_50,
		c0=> VGA_CLK
		
		
		);
	sync1 :sync
		port map(
		clk=>VGA_CLK,
		hs=>VGA_HS,
		vs=>VGA_VS,
		reset=>KEY(0),
		R=>Ro,
		G=>Go,
		B=>Bo,
		btn=>KEY(1)
		
		);
	

	
	VGA_B<=Bo;
	VGA_G<=Go;
	VGA_R<=Ro;
MClockOut<=MAX10_CLK1_50;
ClockOut<=VGA_CLK;
	end architecture RTL;
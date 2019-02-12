library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ADC_Pot is
	port(
	ADC_CLK_10 :in std_logic;
	MAX10_CLK1_50  :in std_logic;
	HEX0 :out std_logic_vector(7 downto 0);
	HEX1 :out std_logic_vector(7 downto 0);
	HEX2 :out std_logic_vector(7 downto 0);
	HEX3 :out std_logic_vector(7 downto 0);
	HEX4 :out std_logic_vector(7 downto 0);
	HEX5 :out std_logic_vector(7 downto 0);
	KEY :in std_logic_vector(1 downto 0)	
	);
end ADC_Pot;

architecture RTL of ADC_Pot is
signal ADC_DATA :std_logic_vector (11 downto 0);
signal DATA_OUT :std_logic_vector (11 downto 0);
signal digit1 :std_logic_vector(3 downto 0);
signal digit2 :std_logic_vector(3 downto 0);
signal digit3 :std_logic_vector(3 downto 0);
signal ADC_reset :std_logic;
component sevenSeg is
	port(
		clk :in std_logic;
		num_in	:in	std_logic_vector(3 downto 0);
		seg_out	:out	std_logic_vector(7 downto 0);
		dec :in std_logic
	);
end component sevenSeg;

component ADC_Driver is
	port (
		CLOCK : in  std_logic                     := 'X'; -- clk
		RESET : in  std_logic                     := 'X'; -- reset
		CH0   : out std_logic_vector(11 downto 0);        -- CH0
		CH1   : out std_logic_vector(11 downto 0);        -- CH1
		CH2   : out std_logic_vector(11 downto 0);        -- CH2
		CH3   : out std_logic_vector(11 downto 0);        -- CH3
		CH4   : out std_logic_vector(11 downto 0);        -- CH4
		CH5   : out std_logic_vector(11 downto 0);        -- CH5
		CH6   : out std_logic_vector(11 downto 0);        -- CH6
		CH7   : out std_logic_vector(11 downto 0)         -- CH7
	);
end component ADC_Driver;

component counter is
	port(
		clk :in std_logic;
		data_out :out std_logic_vector(11 downto 0);
		data_in	:in std_logic_vector (11 downto 0);
		reset :in std_logic
	
	);
end component counter;

begin

u0 : component ADC_Driver
		port map (
			CLOCK => MAX10_CLK1_50, --      clk.clk
			RESET => ADC_reset, --    reset.reset
			CH0   => ADC_DATA,   -- readings.CH0
			CH1   => open,   --         .CH1
			CH2   => open,   --         .CH2
			CH3   => open,   --         .CH3
			CH4   => open,   --         .CH4
			CH5   => open,   --         .CH5
			CH6   => open,   --         .CH6
			CH7   => open    --         .CH7
		);
u1 : counter
	port map(
	
		clk=>MAX10_CLK1_50,
		data_out=>DATA_OUT,
		data_in=>ADC_DATA,
		reset=>KEY(0)
	
	
	
	
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
dig3: sevenSeg
	port map(
		clk => MAX10_CLK1_50,
		num_in (3 downto 0) => digit3(3 downto 0),
		seg_out(7 downto 0) =>HEX2(7 downto 0),
		dec => '0'
);
digit1(3 downto 0)<=DATA_OUT(3 downto 0);

digit2(3 downto 0)<=DATA_OUT(7 downto 4);

digit3(3 downto 0)<=DATA_OUT(11 downto 8);
HEX3(7 downto 0)<=x"FF";
HEX4(7 downto 0)<=x"FF";
HEX5(7 downto 0)<=x"FF";
ADC_reset<=not KEY(0);








end architecture RTL;
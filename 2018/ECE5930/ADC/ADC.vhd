library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ADC is
port(
	ADC_CLK_10 :in std_logic;
	MAX10_CLK1_50 :in std_logic;
	MAX10_CLK2_50 :in std_logic;


	HEX0 :out std_logic_vector(7 downto 0);
	HEX1 :out std_logic_vector(7 downto 0);
	HEX2 :out std_logic_vector(7 downto 0);
	HEX3 :out std_logic_vector(7 downto 0);
	HEX4 :out std_logic_vector(7 downto 0);
	HEX5 :out std_logic_vector(7 downto 0);

	
	KEY :in std_logic_vector(1 downto 0)





);
end ADC;
architecture RTL of ADC is
	signal ADC_DATA :std_logic_vector(11 downto 0);
	signal SPI_CLK :std_logic;
	signal SPI_MOSI :std_logic;
	signal SPI_MISO :std_logic;
	signal SPI_CS :std_logic;
	signal DATA_OUT :std_logic_vector(11 downto 0);
	signal digit1 :std_logic_vector(3 downto 0);
	signal digit2 :std_logic_vector(3 downto 0);
	signal digit3 :std_logic_vector(3 downto 0);
	signal ADC_CLK :std_logic;
	signal ADC_CLK_LOCK :std_logic;
	signal CONNECTED_TO_command_channel :std_logic_vector (4 downto 0);
	signal CONNECTED_TO_response_valid :std_logic;
	signal CONNECTED_TO_response_channel :std_logic_vector (4 downto 0);
	signal CONNECTED_TO_response_startofpacket : std_logic;
	signal CONNECTED_TO_modular_adc_0_response_endofpacket : std_logic;
	signal commandReady : std_logic;
	
	
	
		component adc_qsys is
		port (
			clk_clk                              : in  std_logic                     := 'X';             -- clk
			clock_bridge_sys_out_clk_clk         : out std_logic;                                        -- clk
			modular_adc_0_command_valid          : in  std_logic                     := 'X';             -- valid
			modular_adc_0_command_channel        : in  std_logic_vector(4 downto 0)  := (others => 'X'); -- channel
			modular_adc_0_command_startofpacket  : in  std_logic                     := 'X';             -- startofpacket
			modular_adc_0_command_endofpacket    : in  std_logic                     := 'X';             -- endofpacket
			modular_adc_0_command_ready          : out std_logic;                                        -- ready
			modular_adc_0_response_valid         : out std_logic;                                        -- valid
			modular_adc_0_response_channel       : out std_logic_vector(4 downto 0);                     -- channel
			modular_adc_0_response_data          : out std_logic_vector(11 downto 0);                    -- data
			modular_adc_0_response_startofpacket : out std_logic;                                        -- startofpacket
			modular_adc_0_response_endofpacket   : out std_logic;                                        -- endofpacket
			reset_reset_n                        : in  std_logic                     := 'X'              -- reset_n
		);
	end component adc_qsys;
	
	
	component ADC_PLL IS
	PORT
	(
		areset		: IN STD_LOGIC;
		inclk0		: IN STD_LOGIC;
		c0		: OUT STD_LOGIC ;
		locked		: OUT STD_LOGIC 
	);
END component ADC_PLL;
	component sevenSeg is
	port(
		clk :in std_logic;
		num_in	:in	std_logic_vector(3 downto 0);
		seg_out	:out	std_logic_vector(7 downto 0);
		dec :in std_logic
	);
	end component sevenSeg;

--	component counter is
--	port(
--	
--		clk :in std_logic;
--		data_out :out std_logic_vector(11 downto 0);
--		data_in	:in std_logic_vector (11 downto 0);
--		reset :in std_logic;
--		response_valid :in std_logic
--	
--	
--	);
--	end component counter;
begin

u0 : component adc_qsys
		port map (
			clk_clk                              => MAX10_CLK1_50,                              --                      clk.clk
			clock_bridge_sys_out_clk_clk         => ADC_CLK,         -- clock_bridge_sys_out_clk.clk
			modular_adc_0_command_valid          => '1',          --    modular_adc_0_command.valid
			modular_adc_0_command_channel        => CONNECTED_TO_command_channel,        --                         .channel
			modular_adc_0_command_startofpacket  => '1',  --                         .startofpacket
			modular_adc_0_command_endofpacket    => '1',    --                         .endofpacket
			modular_adc_0_command_ready          => commandReady,          --                         .ready
			modular_adc_0_response_valid         => CONNECTED_TO_response_valid,         --   modular_adc_0_response.valid
			modular_adc_0_response_channel       => CONNECTED_TO_response_channel,       --                         .channel
			modular_adc_0_response_data          => ADC_DATA,          --                         .data
			modular_adc_0_response_startofpacket => CONNECTED_TO_response_startofpacket, --                         .startofpacket
			modular_adc_0_response_endofpacket   => CONNECTED_TO_modular_adc_0_response_endofpacket,   --                         .endofpacket
			reset_reset_n                        => '1'                        --                    reset.reset_n
		);



--u1 : component counter
--	port map(
--	
--		clk =>MAX10_CLK1_50,
--		data_out=>DATA_OUT,
--		data_in=>ADC_DATA,
--		reset=>KEY(0),
--		response_valid=>CONNECTED_TO_response_valid
--	
--	
--	);
u2 : ADC_PLL
	port map(
	
	areset=>KEY(0),
		inclk0=>MAX10_CLK1_50,
		c0=>ADC_CLK,
		locked=>ADC_CLK_LOCK
	
	
	
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


validD :process(MAX10_CLK1_50,CONNECTED_TO_response_valid)
begin
	if rising_edge(MAX10_CLK1_50) and CONNECTED_TO_response_valid='1' then
		DATA_OUT(11 downto 0)<=ADC_DATA(11 downto 0);
	end if;
end process validD;
digit1(3 downto 0)<=DATA_OUT(3 downto 0);

digit2(3 downto 0)<=DATA_OUT(7 downto 4);

digit3(3 downto 0)<=DATA_OUT(11 downto 8);
HEX3(7 downto 0)<=x"FF";
HEX4(7 downto 0)<=x"FF";
HEX5(7 downto 0)<=x"FF";
CONNECTED_TO_command_channel<=b"00000";

end architecture RTL;
library ieee;
use ieee.std_logic_1164.all;

entity sync_test is

end sync_test;


architecture test of sync_test is

component sync is
port(
	clk :in std_logic;
	hs	 :out std_logic;
	vs  :out std_logic;
	reset :in std_logic;
	R :out std_logic_vector(3 downto 0);
	G :out std_logic_vector(3 downto 0);
	B :out std_logic_vector(3 downto 0)
	
	);
end component;

signal Tclk :std_logic;
signal Ths	:std_logic;
signal Tvs  :std_logic;
signal TR	:std_logic_vector(3 downto 0);
signal TG	:std_logic_vector(3 downto 0);	
signal TB	:std_logic_vector(3 downto 0);		
signal Treset :std_logic;
constant Period :time :=39.72972 ns;

begin


sync_DUT : sync
port map(
	clk => Tclk,
	hs => Ths,
	vs => Tvs,
	reset=>Treset,
	R=>TR,
	G=>TG,
	B=>TB


);

clk_process: process
	begin
		Tclk <='1';
		wait for Period/2;
		Tclk <= '0';
		wait for Period/2;
	end process;
	
	
run_proc : process
begin
	---Treset<='0';
	--wait for Period*2;
	--Treset<='1';
	--wait for Period*2;
	wait for Period*10000;
	
end process run_proc;

end test;

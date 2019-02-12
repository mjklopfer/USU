library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
port(

		clk :in std_logic;
		data_out :out std_logic_vector(11 downto 0);
		data_in	:in std_logic_vector (11 downto 0);
		reset :in std_logic;
		response_valid :in std_logic




);
end counter;
architecture RTL of counter is
signal timer_val :integer :=50000000;
signal stored_val :std_logic_vector(11 downto 0);
signal trigger :std_logic :='0';


begin

timer :process(clk,reset)
begin
	if reset='0' then
		timer_val<=50000000;
		trigger<='0';
		
  elsif rising_edge(clk) then
		if timer_val <=1 then
			trigger<='1';
			timer_val<=50000000;
		else
			timer_val<=timer_val-1;
			trigger<='0';
		end if;
		
	end if;


end process timer;

trig :process(trigger, response_valid)
begin
	if trigger='1' and response_valid='1' then
		stored_val<=data_in;
	else
		stored_val<=stored_val;
	end if;
end process trig;
	



data_out<=stored_val;

end architecture RTL;
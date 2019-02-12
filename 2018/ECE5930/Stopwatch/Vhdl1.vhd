library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity stopWatch is
	port(
			MAX10_CLK1_50	:in	std_logic;
			Hex0	:out	unsigned(7 downto 0);
			Hex1	:out	unsigned(7 downto 0);
			Hex2	:out	unsigned(7 downto 0);
			Hex3	:out	unsigned(7 downto 0);
			Hex4	:out	unsigned(7 downto 0);
			Hex5	:out	unsigned(7 downto 0);
			
			areset :in	std_logic;
			go_button :in std_logic
	
	
	);
	end stopWatch;
	
	
architecture RTL of stopWatch is
	type sevenSeg is array (0 to 9) of unsigned(7 downto 0);
	type sevenSeg2 is array (0 to 10) of unsigned(7 downto 0);
	constant sevSeg: sevenSeg := (X"C0", X"F9", X"A4",X"B0",X"99",X"92",X"82",X"F8",X"80",X"98");
	constant sevSegDec: sevenSeg2 := (X"40",X"79",X"24",X"30",X"19",X"12",X"02",X"78",X"00",X"18",X"40");
	signal count :integer:=1;
	signal divClk	:std_logic:='0';
	signal binary :unsigned( 9 downto 0);
	
	signal seg0 : integer range 0 to 10:=0;
	signal seg1 : integer:=0;
	signal seg2 : integer:=0;
	signal seg3 : integer:=0;
	signal seg4 : integer:=0;
	signal seg5 : integer:=0;
	
	begin
	
	stopWatch : process(MAX10_CLK1_50,areset)
		begin
		if (areset='0')then
			seg0<=0;
			seg1<=0;
			seg2<=0;
			seg3<=0;
			seg4<=0;
			seg5<=0;
			count<=0;
		
		elsif (rising_edge(MAX10_CLK1_50) and go_button='0') then
		
				count <= count + 1;
				
				if count=500000 then
					seg0 <= seg0 + 1;
					count<=0;
				end if;
				
				if seg0 = 10 then
					seg0 <= 0;
					seg1 <= seg1 + 1;
				end if;
				
				if seg1 = 10 then
					seg1 <= 0;
					seg2 <= seg2 + 1;
					
				end if;
				
				if seg2 = 10 then
					seg2 <= 0;
					seg3 <= seg3 +1;
				end if;
				
				if seg3 = 6 then
					seg3<=0;
					seg4 <=seg4+1;
				end if;
				if seg4 = 10 then
					seg4<=0;
					seg5<=seg5+1;
				end if;
				if seg5 = 6 then
					seg5 <=0;
				end if;
			
		end if;	
		end process stopWatch;
		Hex0 <= sevSeg(seg0);
		Hex1 <= sevSeg(seg1);
		Hex2 <= sevSegDec(seg2);
		Hex3 <= sevSeg(seg3);
		Hex4 <= sevSegDec(seg4);
		Hex5 <= sevSeg(seg5);
		
		
	end architecture RTL;
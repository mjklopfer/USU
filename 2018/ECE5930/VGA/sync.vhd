library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity sync is
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
end sync;
	
	
	architecture RTL of sync is
	type hstate is(horizFP, hSync, horizBP, hData);
	type vstate is(vertFP, vSync, vertBP, vData);
	type state is (IDLE,COUNT,COUNT2,TRIG,ACC);
	type country is(france,italy,ireland,belgium,mali,chad,nigeria, ivoryCoast);
	constant RED :std_logic_vector(11 downto 0) := X"F00";
	constant WHITE :std_logic_vector(11 downto 0):=X"FFF";
	constant BLUE :std_logic_vector(11 downto 0):=X"00F";
	constant GREEN :std_logic_vector(11 downto 0):=X"0F0";
	constant BLACK :std_logic_vector(11 downto 0):=X"000";
	constant ORANGE :std_logic_vector(11 downto 0):=X"FA0";
	constant YELLOW :std_logic_vector(11 downto 0):=X"FF0";
	
	signal pixelCount :integer := 0;
	signal npixelCount :integer := 0;
	signal pixelCount2 :integer :=0;
	signal npixelCount2 :integer :=0;
	signal lineCount :integer :=0;
	signal nlineCount :integer:=0;
	signal phs: hstate;
	signal nhs: hstate;
	signal pvs: vstate;
	signal nvs: vstate;
	signal flag : country :=france;
	signal nflag : country :=france;
	
	signal PS :state;
	signal NS :state;
	signal done :std_logic;
	signal timer :unsigned(31 downto 0):=(others=>'0');
	
	begin
	
	accState :process(clk,reset)
	begin
	if reset='0' then
		PS<=IDLE;
		
	
	elsif rising_edge(clk) then
		PS <= NS;
		
	end if;
end process accState;
		
debounce: process(btn,PS,timer)

	begin
		
			case PS is
				when IDLE =>
					if(reset='0')then
						nflag<=france;
					end if;
					flag<=nflag;
					if(btn='0') then
						NS<=COUNT;
					else
						NS<=IDLE;
						
					end if;
				when COUNT=>
				
					if timer=X"0000FFFF" then
						NS<=TRIG;
						
					else
						NS<=COUNT;
					
					end if;
				when TRIG=>
				
					if(btn='1') then
						NS<=COUNT2;
					else
						NS<=TRIG;
					end if;

				when COUNT2=>
				
					if timer=X"0000FFFF" then
						NS<=ACC;
						
					else
						NS<=COUNT2;
						
					end if;
				when ACC =>
						
						
				case flag is
					when france=>
						nflag<=italy;
					when italy=>
						nflag<=ireland;
					when ireland=>
						nflag<=belgium;
					when belgium=>
						nflag<=mali;
					when mali=>
						nflag<=chad;
					when chad=>
						nflag<=nigeria;					
					when nigeria=>
						nflag<=ivoryCoast;
					when ivoryCoast=>
						nflag<=france;
				end case;
				NS<=IDLE;
						end case;		
			
		end process debounce;
		
counter:process(clk,PS)
begin
if PS=COUNT or PS=COUNT2 then
	if rising_edge(clk) then
		if timer/=X"FFFF" then
			timer<=timer+1;
	
	end if;
	end if;
	
else 
	
	timer<=X"00000000";
end if;
	

end process counter;
	
	update :process(clk,reset)
	begin
		if reset='0' then
			phs<=horizFP;
			pvs<=vertFP;
			pixelCount<=0;
			lineCount<=0;
		
			
			
		elsif rising_edge(clk) then
			phs<=nhs;
			pvs<=nvs;
			pixelCount<=npixelCount;
			--lineCount<=nlineCount;
			pixelCount2<=npixelCount2;
			
			if phs =hData and pvs = vData then
				case flag is
					when france=>
						if pixelCount<213 then
							R(3 downto 0)<=BLUE(11 downto 8);
							G(3 downto 0)<=BLUE(7 downto 4);
							B(3 downto 0)<=BLUE(3 downto 0);
						elsif pixelCount<426 then
							R(3 downto 0)<=WHITE(11 downto 8);
							G(3 downto 0)<=WHITE(7 downto 4);
							B(3 downto 0)<=WHITE(3 downto 0);
						
						else
							R(3 downto 0)<=RED(11 downto 8);
							G(3 downto 0)<=RED(7 downto 4);
							B(3 downto 0)<=RED(3 downto 0);
						
						end if;
					when italy=>
						if pixelCount<213 then
							R(3 downto 0)<=GREEN(11 downto 8);
							G(3 downto 0)<=GREEN(7 downto 4);
							B(3 downto 0)<=GREEN(3 downto 0);
						elsif pixelCount<426 then
							R(3 downto 0)<=WHITE(11 downto 8);
							G(3 downto 0)<=WHITE(7 downto 4);
							B(3 downto 0)<=WHITE(3 downto 0);
						
						else
							R(3 downto 0)<=RED(11 downto 8);
							G(3 downto 0)<=RED(7 downto 4);
							B(3 downto 0)<=RED(3 downto 0);
						
						end if;
					when ireland=>
						if pixelCount<213 then
							R(3 downto 0)<=GREEN(11 downto 8);
							G(3 downto 0)<=GREEN(7 downto 4);
							B(3 downto 0)<=GREEN(3 downto 0);
						elsif pixelCount<426 then
							R(3 downto 0)<=WHITE(11 downto 8);
							G(3 downto 0)<=WHITE(7 downto 4);
							B(3 downto 0)<=WHITE(3 downto 0);
						
						else
							R(3 downto 0)<=ORANGE(11 downto 8);
							G(3 downto 0)<=ORANGE(7 downto 4);
							B(3 downto 0)<=ORANGE(3 downto 0);
						
						end if;
					when belgium=>
						if pixelCount<213 then
							R(3 downto 0)<=BLACK(11 downto 8);
							G(3 downto 0)<=BLACK(7 downto 4);
							B(3 downto 0)<=BLACK(3 downto 0);
						elsif pixelCount<426 then
							R(3 downto 0)<=YELLOW(11 downto 8);
							G(3 downto 0)<=YELLOW(7 downto 4);
							B(3 downto 0)<=YELLOW(3 downto 0);
						
						else
							R(3 downto 0)<=RED(11 downto 8);
							G(3 downto 0)<=RED(7 downto 4);
							B(3 downto 0)<=RED(3 downto 0);
						
						end if;
					when mali=>
							if pixelCount<213 then
							R(3 downto 0)<=GREEN(11 downto 8);
							G(3 downto 0)<=GREEN(7 downto 4);
							B(3 downto 0)<=GREEN(3 downto 0);
						elsif pixelCount<426 then
							R(3 downto 0)<=YELLOW(11 downto 8);
							G(3 downto 0)<=YELLOW(7 downto 4);
							B(3 downto 0)<=YELLOW(3 downto 0);
						
						else
							R(3 downto 0)<=RED(11 downto 8);
							G(3 downto 0)<=RED(7 downto 4);
							B(3 downto 0)<=RED(3 downto 0);
						
						end if;
					when chad=>
							if pixelCount<213 then
							R(3 downto 0)<=BLUE(11 downto 8);
							G(3 downto 0)<=BLUE(7 downto 4);
							B(3 downto 0)<=BLUE(3 downto 0);
						elsif pixelCount<426 then
							R(3 downto 0)<=YELLOW(11 downto 8);
							G(3 downto 0)<=YELLOW(7 downto 4);
							B(3 downto 0)<=YELLOW(3 downto 0);
						
						else
							R(3 downto 0)<=RED(11 downto 8);
							G(3 downto 0)<=RED(7 downto 4);
							B(3 downto 0)<=RED(3 downto 0);
						
						end if;
					when nigeria=>
							if pixelCount<213 then
							R(3 downto 0)<=GREEN(11 downto 8);
							G(3 downto 0)<=GREEN(7 downto 4);
							B(3 downto 0)<=GREEN(3 downto 0);
						elsif pixelCount<426 then
							R(3 downto 0)<=WHITE(11 downto 8);
							G(3 downto 0)<=WHITE(7 downto 4);
							B(3 downto 0)<=WHITE(3 downto 0);
						
						else
							R(3 downto 0)<=GREEN(11 downto 8);
							G(3 downto 0)<=GREEN(7 downto 4);
							B(3 downto 0)<=GREEN(3 downto 0);
						
						end if;
					when ivoryCoast=>
							if pixelCount<213 then
							R(3 downto 0)<=ORANGE(11 downto 8);
							G(3 downto 0)<=ORANGE(7 downto 4);
							B(3 downto 0)<=ORANGE(3 downto 0);
						elsif pixelCount<426 then
							R(3 downto 0)<=WHITE(11 downto 8);
							G(3 downto 0)<=WHITE(7 downto 4);
							B(3 downto 0)<=WHITE(3 downto 0);
						
						else
							R(3 downto 0)<=GREEN(11 downto 8);
							G(3 downto 0)<=GREEN(7 downto 4);
							B(3 downto 0)<=GREEN(3 downto 0);
						
						end if;
				end case;
					
			else
				R<=(others=>'0');
				G<=(others=>'0');
				B<=(others=>'0');
			end if;
			if phs=hSync then
				hs<='0';
			else
				hs<='1';
			end if;
			if pvs=vSync then
				vs<='0';
			else
				vs<='1';
			end if;
			if phs=hData and nhs=horizFP then
				if pvs = vData then
					if lineCount<480 then
						lineCount<=lineCount+1;
					else
						lineCount<=0;
					end if;
				else
					lineCount<=0;
				end if;
			end if;
		end if;
	end process update;
	
	
	
	position:process(phs,pvs, pixelCount,lineCount, pixelCount2)
	begin
		case phs is
			when horizFP=>
					if pixelCount<16 then
						nhs<=horizFP;
						npixelCount<=pixelCount+1;
					else
						nhs<=hSync;
						npixelCount<=0;
					end if;
			when hSync=>
					if pixelCount<96 then
						nhs<=hSync;
						npixelCount<=pixelCount+1;
					else
						nhs<=horizBP;
						npixelCount<=0;
					end if;
			
			when horizBP=>
					if pixelCount<48 then
						nhs<=horizBP;
						npixelCount<=pixelCount+1;
					else
						nhs<= hData;
						npixelCount<=0;
					end if;
			
			when hData=>
					if pixelCount<640 then
						nhs<=hData;
						npixelCount<=pixelCount+1;
					else
						nhs<=horizFP;
						npixelCount<=0;
					--	nlineCount<=lineCount+1;
					end if;
			
		end case;
		
		case pvs is
			when vertFP=>
					if pixelCount2<8000 then
						nvs<=vertFP;
						npixelCount2<=pixelCount2+1;
					else
						nvs<=vSync;
						npixelCount2<=0;
					end if;
			
			when vSync=>
					if pixelCount2<1600 then
						nvs<=vSync;
						npixelCount2<=pixelCount2+1;
					else
						nvs<=vertBP;
						npixelCount2<=0;
					end if;
			
			when vertBP=>
					if pixelCount2<26400 then
						nvs<=vertBP;
						npixelCount2<=pixelCount2+1;
					else
						nvs<=vData;
						npixelCount2<=0;
					end if;
			
			when vData=>
					if lineCount<480 then
						nvs<=vData;
					else
						nvs<=vertFP;
					--	nlineCount<=0;
					end if;
			
		end case;
	
	
	
	
	
	end process position;
	

	
	end architecture RTL;
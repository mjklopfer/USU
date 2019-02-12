-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
-- Date        : Mon Mar 12 12:45:36 2018
-- Host        : DESKTOP-PM6UVGK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/xilinxworking/lab3v2/lab3-20180226t173356z-001/lab3/ip_repo/axi_sevensegmentdriver_1.0/src/SevenSegmentDriver_0/SevenSegmentDriver_0_stub.vhdl
-- Design      : SevenSegmentDriver_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SevenSegmentDriver_0 is
  Port ( 
    clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 15 downto 0 );
    bcd : in STD_LOGIC;
    dec : in STD_LOGIC_VECTOR ( 1 downto 0 );
    an : out STD_LOGIC_VECTOR ( 3 downto 0 );
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    dp : out STD_LOGIC
  );

end SevenSegmentDriver_0;

architecture stub of SevenSegmentDriver_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,din[15:0],bcd,dec[1:0],an[3:0],seg[6:0],dp";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "FullDisplay,Vivado 2015.4";
begin
end;

-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
-- Date        : Thu Mar 15 12:18:05 2018
-- Host        : DESKTOP-PM6UVGK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/XilinxWorking/Lab5/2_1_PWM_test/2_1_PWM_test.srcs/sources_1/ip/pwm_1/pwm_1_stub.vhdl
-- Design      : pwm_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pwm_1 is
  Port ( 
    clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sout : out STD_LOGIC
  );

end pwm_1;

architecture stub of pwm_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,din[7:0],sout";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "pwm,Vivado 2015.4";
begin
end;

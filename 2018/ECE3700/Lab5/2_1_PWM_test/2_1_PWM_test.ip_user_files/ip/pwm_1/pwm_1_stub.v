// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Thu Mar 15 12:18:05 2018
// Host        : DESKTOP-PM6UVGK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/XilinxWorking/Lab5/2_1_PWM_test/2_1_PWM_test.srcs/sources_1/ip/pwm_1/pwm_1_stub.v
// Design      : pwm_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "pwm,Vivado 2015.4" *)
module pwm_1(clk, din, sout)
/* synthesis syn_black_box black_box_pad_pin="clk,din[7:0],sout" */;
  input clk;
  input [7:0]din;
  output sout;
endmodule

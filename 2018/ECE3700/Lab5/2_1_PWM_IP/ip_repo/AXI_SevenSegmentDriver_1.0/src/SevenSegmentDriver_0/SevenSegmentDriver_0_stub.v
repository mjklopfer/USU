// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Mon Mar 12 12:45:36 2018
// Host        : DESKTOP-PM6UVGK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/xilinxworking/lab3v2/lab3-20180226t173356z-001/lab3/ip_repo/axi_sevensegmentdriver_1.0/src/SevenSegmentDriver_0/SevenSegmentDriver_0_stub.v
// Design      : SevenSegmentDriver_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "FullDisplay,Vivado 2015.4" *)
module SevenSegmentDriver_0(clk, din, bcd, dec, an, seg, dp)
/* synthesis syn_black_box black_box_pad_pin="clk,din[15:0],bcd,dec[1:0],an[3:0],seg[6:0],dp" */;
  input clk;
  input [15:0]din;
  input bcd;
  input [1:0]dec;
  output [3:0]an;
  output [6:0]seg;
  output dp;
endmodule

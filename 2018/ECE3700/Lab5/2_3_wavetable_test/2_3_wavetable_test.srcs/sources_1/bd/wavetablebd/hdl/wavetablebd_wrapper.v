//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
//Date        : Fri Mar 23 15:43:27 2018
//Host        : DESKTOP-PM6UVGK running 64-bit major release  (build 9200)
//Command     : generate_target wavetablebd_wrapper.bd
//Design      : wavetablebd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module wavetablebd_wrapper
   (btnU,
    gain,
    shutdown_l,
    sout,
    sw,
    sys_clock);
  input btnU;
  output [0:0]gain;
  output [0:0]shutdown_l;
  output sout;
  input [15:0]sw;
  input sys_clock;

  wire btnU;
  wire [0:0]gain;
  wire [0:0]shutdown_l;
  wire sout;
  wire [15:0]sw;
  wire sys_clock;

  wavetablebd wavetablebd_i
       (.btnU(btnU),
        .gain(gain),
        .shutdown_l(shutdown_l),
        .sout(sout),
        .sw(sw),
        .sys_clock(sys_clock));
endmodule

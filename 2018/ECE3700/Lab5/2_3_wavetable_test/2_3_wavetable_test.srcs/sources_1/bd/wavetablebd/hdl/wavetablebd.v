//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
//Date        : Fri Mar 23 15:43:27 2018
//Host        : DESKTOP-PM6UVGK running 64-bit major release  (build 9200)
//Command     : generate_target wavetablebd.bd
//Design      : wavetablebd
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "wavetablebd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=wavetablebd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=13,numReposBlks=13,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,da_board_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "wavetablebd.hwdef" *) 
module wavetablebd
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

  wire btnU_1;
  wire c_counter_binary_0_THRESH0;
  wire [0:0]c_shift_ram_0_Q;
  wire [14:0]c_shift_ram_1_Q;
  wire [14:0]c_shift_ram_2_Q;
  wire [0:0]c_shift_ram_3_Q;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_clk_out2;
  wire pwm_0_sout;
  wire [15:0]sw_1;
  wire sys_clock_1;
  wire [0:0]util_vector_logic_0_Res;
  wire [31:0]wavetable_0_dout;
  wire [0:0]xlconstant_0_dout;
  wire [0:0]xlslice_0_Dout;
  wire [14:0]xlslice_1_Dout;
  wire [7:0]xlslice_2_Dout;

  assign btnU_1 = btnU;
  assign gain[0] = xlconstant_0_dout;
  assign shutdown_l[0] = xlconstant_0_dout;
  assign sout = pwm_0_sout;
  assign sw_1 = sw[15:0];
  assign sys_clock_1 = sys_clock;
  wavetablebd_c_counter_binary_0_0 c_counter_binary_0
       (.CLK(clk_wiz_0_clk_out2),
        .THRESH0(c_counter_binary_0_THRESH0));
  wavetablebd_c_shift_ram_0_0 c_shift_ram_0
       (.CLK(clk_wiz_0_clk_out2),
        .D(xlslice_0_Dout),
        .Q(c_shift_ram_0_Q));
  wavetablebd_c_shift_ram_1_0 c_shift_ram_1
       (.CE(util_vector_logic_0_Res),
        .CLK(clk_wiz_0_clk_out2),
        .D(xlslice_1_Dout),
        .Q(c_shift_ram_1_Q));
  wavetablebd_c_shift_ram_2_0 c_shift_ram_2
       (.CE(c_shift_ram_0_Q),
        .CLK(clk_wiz_0_clk_out2),
        .D(xlslice_1_Dout),
        .Q(c_shift_ram_2_Q));
  wavetablebd_c_shift_ram_3_0 c_shift_ram_3
       (.CLK(clk_wiz_0_clk_out2),
        .D(btnU_1),
        .Q(c_shift_ram_3_Q));
  wavetablebd_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sys_clock_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .clk_out2(clk_wiz_0_clk_out2));
  wavetablebd_pwm_0_0 pwm_0
       (.clk(clk_wiz_0_clk_out1),
        .din(xlslice_2_Dout),
        .sout(pwm_0_sout));
  wavetablebd_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(c_shift_ram_0_Q),
        .Res(util_vector_logic_0_Res));
  wavetablebd_wavetable_0_1 wavetable_0
       (.clk(c_counter_binary_0_THRESH0),
        .clr(c_shift_ram_3_Q),
        .den(c_shift_ram_1_Q),
        .dout(wavetable_0_dout),
        .en(xlconstant_0_dout),
        .num(c_shift_ram_2_Q));
  wavetablebd_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  wavetablebd_xlslice_0_0 xlslice_0
       (.Din(sw_1),
        .Dout(xlslice_0_Dout));
  wavetablebd_xlslice_1_0 xlslice_1
       (.Din(sw_1),
        .Dout(xlslice_1_Dout));
  wavetablebd_xlslice_2_0 xlslice_2
       (.Din(wavetable_0_dout),
        .Dout(xlslice_2_Dout));
endmodule

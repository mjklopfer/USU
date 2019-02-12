// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Thu Mar 15 12:18:05 2018
// Host        : DESKTOP-PM6UVGK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/XilinxWorking/Lab5/2_1_PWM_test/2_1_PWM_test.srcs/sources_1/ip/pwm_1/pwm_1_sim_netlist.v
// Design      : pwm_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pwm_1,pwm,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "pwm,Vivado 2015.4" *) 
(* NotValidForBitStream *)
module pwm_1
   (clk,
    din,
    sout);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) input clk;
  input [7:0]din;
  output sout;

  wire clk;
  wire [7:0]din;
  wire sout;

  pwm_1_pwm inst
       (.clk(clk),
        .din(din),
        .sout(sout));
endmodule

(* ORIG_REF_NAME = "pwm" *) 
module pwm_1_pwm
   (clk,
    din,
    sout);
  input clk;
  input [7:0]din;
  output sout;

  wire clk;
  wire \count[7]_i_2_n_0 ;
  wire [7:0]count_reg__0;
  wire [7:0]din;
  wire p_0_in;
  wire [7:0]p_0_in__0;
  wire sout;
  wire sout_i_10_n_0;
  wire sout_i_1_n_0;
  wire sout_i_3_n_0;
  wire sout_i_4_n_0;
  wire sout_i_5_n_0;
  wire sout_i_6_n_0;
  wire sout_i_7_n_0;
  wire sout_i_8_n_0;
  wire sout_i_9_n_0;
  wire sout_reg_i_2_n_1;
  wire sout_reg_i_2_n_2;
  wire sout_reg_i_2_n_3;
  wire [3:0]NLW_sout_reg_i_2_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(count_reg__0[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count[1]_i_1 
       (.I0(count_reg__0[0]),
        .I1(count_reg__0[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count[2]_i_1 
       (.I0(count_reg__0[0]),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[2]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \count[3]_i_1 
       (.I0(count_reg__0[3]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[2]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \count[4]_i_1 
       (.I0(count_reg__0[4]),
        .I1(count_reg__0[2]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[3]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \count[5]_i_1 
       (.I0(count_reg__0[5]),
        .I1(count_reg__0[3]),
        .I2(count_reg__0[0]),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[2]),
        .I5(count_reg__0[4]),
        .O(p_0_in__0[5]));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \count[6]_i_1 
       (.I0(count_reg__0[6]),
        .I1(count_reg__0[4]),
        .I2(\count[7]_i_2_n_0 ),
        .I3(count_reg__0[3]),
        .I4(count_reg__0[5]),
        .O(p_0_in__0[6]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \count[7]_i_1 
       (.I0(count_reg__0[7]),
        .I1(count_reg__0[5]),
        .I2(count_reg__0[3]),
        .I3(\count[7]_i_2_n_0 ),
        .I4(count_reg__0[4]),
        .I5(count_reg__0[6]),
        .O(p_0_in__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \count[7]_i_2 
       (.I0(count_reg__0[2]),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[0]),
        .O(\count[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[0]),
        .Q(count_reg__0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[1]),
        .Q(count_reg__0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[2]),
        .Q(count_reg__0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[3]),
        .Q(count_reg__0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[4]),
        .Q(count_reg__0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[5]),
        .Q(count_reg__0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[6]),
        .Q(count_reg__0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[7]),
        .Q(count_reg__0[7]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    sout_i_1
       (.I0(p_0_in),
        .O(sout_i_1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sout_i_10
       (.I0(din[1]),
        .I1(count_reg__0[1]),
        .I2(din[0]),
        .I3(count_reg__0[0]),
        .O(sout_i_10_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sout_i_3
       (.I0(count_reg__0[7]),
        .I1(din[7]),
        .I2(count_reg__0[6]),
        .I3(din[6]),
        .O(sout_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sout_i_4
       (.I0(count_reg__0[5]),
        .I1(din[5]),
        .I2(count_reg__0[4]),
        .I3(din[4]),
        .O(sout_i_4_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sout_i_5
       (.I0(count_reg__0[3]),
        .I1(din[3]),
        .I2(count_reg__0[2]),
        .I3(din[2]),
        .O(sout_i_5_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sout_i_6
       (.I0(count_reg__0[1]),
        .I1(din[1]),
        .I2(count_reg__0[0]),
        .I3(din[0]),
        .O(sout_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sout_i_7
       (.I0(din[7]),
        .I1(count_reg__0[7]),
        .I2(din[6]),
        .I3(count_reg__0[6]),
        .O(sout_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sout_i_8
       (.I0(din[5]),
        .I1(count_reg__0[5]),
        .I2(din[4]),
        .I3(count_reg__0[4]),
        .O(sout_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sout_i_9
       (.I0(din[3]),
        .I1(count_reg__0[3]),
        .I2(din[2]),
        .I3(count_reg__0[2]),
        .O(sout_i_9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sout_reg
       (.C(clk),
        .CE(1'b1),
        .D(sout_i_1_n_0),
        .Q(sout),
        .R(1'b0));
  CARRY4 sout_reg_i_2
       (.CI(1'b0),
        .CO({p_0_in,sout_reg_i_2_n_1,sout_reg_i_2_n_2,sout_reg_i_2_n_3}),
        .CYINIT(1'b0),
        .DI({sout_i_3_n_0,sout_i_4_n_0,sout_i_5_n_0,sout_i_6_n_0}),
        .O(NLW_sout_reg_i_2_O_UNCONNECTED[3:0]),
        .S({sout_i_7_n_0,sout_i_8_n_0,sout_i_9_n_0,sout_i_10_n_0}));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Mon Mar 12 12:45:36 2018
// Host        : DESKTOP-PM6UVGK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/xilinxworking/lab3v2/lab3-20180226t173356z-001/lab3/ip_repo/axi_sevensegmentdriver_1.0/src/SevenSegmentDriver_0/SevenSegmentDriver_0_sim_netlist.v
// Design      : SevenSegmentDriver_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "SevenSegmentDriver_0,FullDisplay,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "FullDisplay,Vivado 2015.4" *) 
(* NotValidForBitStream *)
module SevenSegmentDriver_0
   (clk,
    din,
    bcd,
    dec,
    an,
    seg,
    dp);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) input clk;
  input [15:0]din;
  input bcd;
  input [1:0]dec;
  output [3:0]an;
  output [6:0]seg;
  output dp;

  wire [3:0]an;
  wire bcd;
  wire clk;
  wire [1:0]dec;
  wire [15:0]din;
  wire dp;
  wire [4:0]hundreds_place;
  wire [3:0]hundreds_sel;
  wire [4:0]ones_place;
  wire [3:2]ones_sel;
  wire [6:0]seg;
  wire \seg[0]_INST_0_i_1_n_0 ;
  wire \seg[0]_INST_0_i_4_n_0 ;
  wire \seg[0]_INST_0_i_5_n_0 ;
  wire \seg[1]_INST_0_i_1_n_0 ;
  wire \seg[1]_INST_0_i_2_n_0 ;
  wire \seg[1]_INST_0_i_4_n_0 ;
  wire \seg[1]_INST_0_i_5_n_0 ;
  wire \seg[2]_INST_0_i_1_n_0 ;
  wire \seg[3]_INST_0_i_1_n_0 ;
  wire \seg[3]_INST_0_i_2_n_0 ;
  wire \seg[3]_INST_0_i_4_n_0 ;
  wire \seg[3]_INST_0_i_5_n_0 ;
  wire \seg[4]_INST_0_i_1_n_0 ;
  wire \seg[5]_INST_0_i_1_n_0 ;
  wire \seg[6]_INST_0_i_10_n_0 ;
  wire \seg[6]_INST_0_i_11_n_0 ;
  wire \seg[6]_INST_0_i_12_n_0 ;
  wire \seg[6]_INST_0_i_13_n_0 ;
  wire \seg[6]_INST_0_i_1_n_0 ;
  wire \seg[6]_INST_0_i_20_n_0 ;
  wire \seg[6]_INST_0_i_21_n_0 ;
  wire \seg[6]_INST_0_i_22_n_0 ;
  wire \seg[6]_INST_0_i_23_n_0 ;
  wire \seg[6]_INST_0_i_24_n_0 ;
  wire \seg[6]_INST_0_i_25_n_0 ;
  wire \seg[6]_INST_0_i_26_n_0 ;
  wire \seg[6]_INST_0_i_27_n_0 ;
  wire \seg[6]_INST_0_i_28_n_0 ;
  wire \seg[6]_INST_0_i_29_n_0 ;
  wire \seg[6]_INST_0_i_2_n_0 ;
  wire \seg[6]_INST_0_i_30_n_0 ;
  wire \seg[6]_INST_0_i_31_n_0 ;
  wire \seg[6]_INST_0_i_32_n_0 ;
  wire \seg[6]_INST_0_i_33_n_0 ;
  wire \seg[6]_INST_0_i_34_n_0 ;
  wire \seg[6]_INST_0_i_35_n_0 ;
  wire \seg[6]_INST_0_i_36_n_0 ;
  wire \seg[6]_INST_0_i_37_n_0 ;
  wire \seg[6]_INST_0_i_44_n_0 ;
  wire \seg[6]_INST_0_i_45_n_0 ;
  wire \seg[6]_INST_0_i_46_n_0 ;
  wire \seg[6]_INST_0_i_47_n_0 ;
  wire \seg[6]_INST_0_i_48_n_0 ;
  wire \seg[6]_INST_0_i_49_n_0 ;
  wire \seg[6]_INST_0_i_50_n_0 ;
  wire \seg[6]_INST_0_i_51_n_0 ;
  wire \seg[6]_INST_0_i_52_n_0 ;
  wire \seg[6]_INST_0_i_53_n_0 ;
  wire \seg[6]_INST_0_i_54_n_0 ;
  wire \seg[6]_INST_0_i_55_n_0 ;
  wire \seg[6]_INST_0_i_56_n_0 ;
  wire \seg[6]_INST_0_i_57_n_0 ;
  wire \seg[6]_INST_0_i_58_n_0 ;
  wire \seg[6]_INST_0_i_59_n_0 ;
  wire \seg[6]_INST_0_i_60_n_0 ;
  wire \seg[6]_INST_0_i_61_n_0 ;
  wire \seg[6]_INST_0_i_62_n_0 ;
  wire \seg[6]_INST_0_i_63_n_0 ;
  wire \seg[6]_INST_0_i_64_n_0 ;
  wire \seg[6]_INST_0_i_65_n_0 ;
  wire \seg[6]_INST_0_i_66_n_0 ;
  wire \seg[6]_INST_0_i_67_n_0 ;
  wire \seg[6]_INST_0_i_68_n_0 ;
  wire \seg[6]_INST_0_i_69_n_0 ;
  wire \seg[6]_INST_0_i_70_n_0 ;
  wire \seg[6]_INST_0_i_71_n_0 ;
  wire \seg[6]_INST_0_i_72_n_0 ;
  wire \seg[6]_INST_0_i_73_n_0 ;
  wire \seg[6]_INST_0_i_74_n_0 ;
  wire \seg[6]_INST_0_i_75_n_0 ;
  wire \seg[6]_INST_0_i_76_n_0 ;
  wire \seg[6]_INST_0_i_77_n_0 ;
  wire \seg[6]_INST_0_i_78_n_0 ;
  wire \seg[6]_INST_0_i_79_n_0 ;
  wire \seg[6]_INST_0_i_80_n_0 ;
  wire \seg[6]_INST_0_i_81_n_0 ;
  wire \seg[6]_INST_0_i_82_n_0 ;
  wire \seg[6]_INST_0_i_83_n_0 ;
  wire \seg[6]_INST_0_i_84_n_0 ;
  wire \seg[6]_INST_0_i_85_n_0 ;
  wire \seg[6]_INST_0_i_86_n_0 ;
  wire \seg[6]_INST_0_i_87_n_0 ;
  wire \seg[6]_INST_0_i_88_n_0 ;
  wire \seg[6]_INST_0_i_9_n_0 ;
  wire [6:0]tens_place;
  wire [3:0]tens_sel;
  wire [3:0]thousands_sel;

  SevenSegmentDriver_0_FullDisplay inst
       (.an(an),
        .clk(clk),
        .dec(dec),
        .\din[14] (\seg[6]_INST_0_i_1_n_0 ),
        .\din[14]_0 (\seg[6]_INST_0_i_10_n_0 ),
        .\din[14]_1 (\seg[6]_INST_0_i_11_n_0 ),
        .\din[14]_10 (\seg[1]_INST_0_i_4_n_0 ),
        .\din[14]_11 (\seg[1]_INST_0_i_5_n_0 ),
        .\din[14]_12 (\seg[0]_INST_0_i_1_n_0 ),
        .\din[14]_13 (\seg[0]_INST_0_i_4_n_0 ),
        .\din[14]_14 (\seg[0]_INST_0_i_5_n_0 ),
        .\din[14]_2 (\seg[6]_INST_0_i_12_n_0 ),
        .\din[14]_3 (\seg[5]_INST_0_i_1_n_0 ),
        .\din[14]_4 (\seg[4]_INST_0_i_1_n_0 ),
        .\din[14]_5 (\seg[3]_INST_0_i_1_n_0 ),
        .\din[14]_6 (\seg[3]_INST_0_i_4_n_0 ),
        .\din[14]_7 (\seg[3]_INST_0_i_5_n_0 ),
        .\din[14]_8 (\seg[2]_INST_0_i_1_n_0 ),
        .\din[14]_9 (\seg[1]_INST_0_i_1_n_0 ),
        .\din[9] (\seg[6]_INST_0_i_2_n_0 ),
        .\din[9]_0 (\seg[3]_INST_0_i_2_n_0 ),
        .\din[9]_1 (\seg[1]_INST_0_i_2_n_0 ),
        .dp(dp),
        .hundreds_place({hundreds_place[4],hundreds_place[2:0]}),
        .ones_place({ones_place[4],ones_place[2:0]}),
        .seg(seg),
        .tens_place({tens_place[6],tens_place[4],tens_place[2:0]}));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hB6AE)) 
    \seg[0]_INST_0_i_1 
       (.I0(thousands_sel[1]),
        .I1(thousands_sel[3]),
        .I2(thousands_sel[2]),
        .I3(thousands_sel[0]),
        .O(\seg[0]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hF74B)) 
    \seg[0]_INST_0_i_2 
       (.I0(tens_sel[3]),
        .I1(tens_sel[0]),
        .I2(tens_sel[2]),
        .I3(tens_sel[1]),
        .O(tens_place[6]));
  LUT6 #(
    .INIT(64'h78FF78788778FFFF)) 
    \seg[0]_INST_0_i_4 
       (.I0(\seg[6]_INST_0_i_37_n_0 ),
        .I1(bcd),
        .I2(din[1]),
        .I3(ones_sel[3]),
        .I4(din[0]),
        .I5(ones_sel[2]),
        .O(\seg[0]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hF47B)) 
    \seg[0]_INST_0_i_5 
       (.I0(hundreds_sel[3]),
        .I1(hundreds_sel[0]),
        .I2(hundreds_sel[1]),
        .I3(hundreds_sel[2]),
        .O(\seg[0]_INST_0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h479E)) 
    \seg[1]_INST_0_i_1 
       (.I0(thousands_sel[3]),
        .I1(thousands_sel[0]),
        .I2(thousands_sel[2]),
        .I3(thousands_sel[1]),
        .O(\seg[1]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h479F)) 
    \seg[1]_INST_0_i_2 
       (.I0(tens_sel[3]),
        .I1(tens_sel[0]),
        .I2(tens_sel[2]),
        .I3(tens_sel[1]),
        .O(\seg[1]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8778008787FFFFFF)) 
    \seg[1]_INST_0_i_4 
       (.I0(\seg[6]_INST_0_i_37_n_0 ),
        .I1(bcd),
        .I2(din[1]),
        .I3(ones_sel[3]),
        .I4(din[0]),
        .I5(ones_sel[2]),
        .O(\seg[1]_INST_0_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h479F)) 
    \seg[1]_INST_0_i_5 
       (.I0(hundreds_sel[3]),
        .I1(hundreds_sel[0]),
        .I2(hundreds_sel[2]),
        .I3(hundreds_sel[1]),
        .O(\seg[1]_INST_0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h5EDE)) 
    \seg[2]_INST_0_i_1 
       (.I0(thousands_sel[3]),
        .I1(thousands_sel[0]),
        .I2(thousands_sel[2]),
        .I3(thousands_sel[1]),
        .O(\seg[2]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h7F67)) 
    \seg[2]_INST_0_i_2 
       (.I0(tens_sel[3]),
        .I1(tens_sel[2]),
        .I2(tens_sel[1]),
        .I3(tens_sel[0]),
        .O(tens_place[4]));
  LUT6 #(
    .INIT(64'h87FFFFFF00FFFF87)) 
    \seg[2]_INST_0_i_4 
       (.I0(\seg[6]_INST_0_i_37_n_0 ),
        .I1(bcd),
        .I2(din[1]),
        .I3(ones_sel[3]),
        .I4(ones_sel[2]),
        .I5(din[0]),
        .O(ones_place[4]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h7F67)) 
    \seg[2]_INST_0_i_5 
       (.I0(hundreds_sel[3]),
        .I1(hundreds_sel[2]),
        .I2(hundreds_sel[1]),
        .I3(hundreds_sel[0]),
        .O(hundreds_place[4]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h3DEA)) 
    \seg[3]_INST_0_i_1 
       (.I0(thousands_sel[3]),
        .I1(thousands_sel[0]),
        .I2(thousands_sel[2]),
        .I3(thousands_sel[1]),
        .O(\seg[3]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h3EE7)) 
    \seg[3]_INST_0_i_2 
       (.I0(tens_sel[3]),
        .I1(tens_sel[1]),
        .I2(tens_sel[2]),
        .I3(tens_sel[0]),
        .O(\seg[3]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8787FF78FF7887FF)) 
    \seg[3]_INST_0_i_4 
       (.I0(\seg[6]_INST_0_i_37_n_0 ),
        .I1(bcd),
        .I2(din[1]),
        .I3(ones_sel[3]),
        .I4(ones_sel[2]),
        .I5(din[0]),
        .O(\seg[3]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h3EE7)) 
    \seg[3]_INST_0_i_5 
       (.I0(hundreds_sel[3]),
        .I1(hundreds_sel[1]),
        .I2(hundreds_sel[2]),
        .I3(hundreds_sel[0]),
        .O(\seg[3]_INST_0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hBBA2)) 
    \seg[4]_INST_0_i_1 
       (.I0(thousands_sel[3]),
        .I1(thousands_sel[0]),
        .I2(thousands_sel[2]),
        .I3(thousands_sel[1]),
        .O(\seg[4]_INST_0_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFD45)) 
    \seg[4]_INST_0_i_2 
       (.I0(tens_sel[0]),
        .I1(tens_sel[1]),
        .I2(tens_sel[2]),
        .I3(tens_sel[3]),
        .O(tens_place[2]));
  LUT6 #(
    .INIT(64'hFFFF78FF007800FF)) 
    \seg[4]_INST_0_i_4 
       (.I0(\seg[6]_INST_0_i_37_n_0 ),
        .I1(bcd),
        .I2(din[1]),
        .I3(din[0]),
        .I4(ones_sel[2]),
        .I5(ones_sel[3]),
        .O(ones_place[2]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hFD45)) 
    \seg[4]_INST_0_i_5 
       (.I0(hundreds_sel[0]),
        .I1(hundreds_sel[1]),
        .I2(hundreds_sel[2]),
        .I3(hundreds_sel[3]),
        .O(hundreds_place[2]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hBA5A)) 
    \seg[5]_INST_0_i_1 
       (.I0(thousands_sel[3]),
        .I1(thousands_sel[0]),
        .I2(thousands_sel[2]),
        .I3(thousands_sel[1]),
        .O(\seg[5]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hB4BD)) 
    \seg[5]_INST_0_i_2 
       (.I0(tens_sel[1]),
        .I1(tens_sel[2]),
        .I2(tens_sel[3]),
        .I3(tens_sel[0]),
        .O(tens_place[1]));
  LUT6 #(
    .INIT(64'h78FF870078FFFF87)) 
    \seg[5]_INST_0_i_4 
       (.I0(\seg[6]_INST_0_i_37_n_0 ),
        .I1(bcd),
        .I2(din[1]),
        .I3(ones_sel[2]),
        .I4(ones_sel[3]),
        .I5(din[0]),
        .O(ones_place[1]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hB4BD)) 
    \seg[5]_INST_0_i_5 
       (.I0(hundreds_sel[1]),
        .I1(hundreds_sel[2]),
        .I2(hundreds_sel[3]),
        .I3(hundreds_sel[0]),
        .O(hundreds_place[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hBFFA)) 
    \seg[6]_INST_0_i_1 
       (.I0(thousands_sel[3]),
        .I1(thousands_sel[0]),
        .I2(thousands_sel[2]),
        .I3(thousands_sel[1]),
        .O(\seg[6]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFD555F55D)) 
    \seg[6]_INST_0_i_10 
       (.I0(\seg[0]_INST_0_i_5_n_0 ),
        .I1(thousands_sel[1]),
        .I2(thousands_sel[3]),
        .I3(thousands_sel[2]),
        .I4(thousands_sel[0]),
        .I5(\seg[6]_INST_0_i_28_n_0 ),
        .O(\seg[6]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAAEAEFBAFFFFFFFF)) 
    \seg[6]_INST_0_i_11 
       (.I0(\seg[6]_INST_0_i_29_n_0 ),
        .I1(thousands_sel[3]),
        .I2(thousands_sel[0]),
        .I3(thousands_sel[2]),
        .I4(thousands_sel[1]),
        .I5(hundreds_place[1]),
        .O(\seg[6]_INST_0_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \seg[6]_INST_0_i_12 
       (.I0(hundreds_place[0]),
        .I1(thousands_sel[0]),
        .I2(thousands_sel[3]),
        .I3(thousands_sel[2]),
        .I4(thousands_sel[1]),
        .O(\seg[6]_INST_0_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h23FA)) 
    \seg[6]_INST_0_i_13 
       (.I0(tens_sel[0]),
        .I1(tens_sel[3]),
        .I2(tens_sel[2]),
        .I3(tens_sel[1]),
        .O(\seg[6]_INST_0_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h1FE0FFFF1FE00000)) 
    \seg[6]_INST_0_i_14 
       (.I0(\seg[6]_INST_0_i_30_n_0 ),
        .I1(\seg[6]_INST_0_i_31_n_0 ),
        .I2(\seg[6]_INST_0_i_32_n_0 ),
        .I3(\seg[6]_INST_0_i_33_n_0 ),
        .I4(bcd),
        .I5(din[7]),
        .O(tens_sel[3]));
  LUT4 #(
    .INIT(16'h6F60)) 
    \seg[6]_INST_0_i_15 
       (.I0(\seg[6]_INST_0_i_32_n_0 ),
        .I1(\seg[6]_INST_0_i_30_n_0 ),
        .I2(bcd),
        .I3(din[5]),
        .O(tens_sel[1]));
  LUT5 #(
    .INIT(32'hB4FFB400)) 
    \seg[6]_INST_0_i_16 
       (.I0(\seg[6]_INST_0_i_30_n_0 ),
        .I1(\seg[6]_INST_0_i_32_n_0 ),
        .I2(\seg[6]_INST_0_i_31_n_0 ),
        .I3(bcd),
        .I4(din[6]),
        .O(tens_sel[2]));
  LUT6 #(
    .INIT(64'h1FE0FFFF1FE00000)) 
    \seg[6]_INST_0_i_17 
       (.I0(din[1]),
        .I1(\seg[6]_INST_0_i_34_n_0 ),
        .I2(\seg[6]_INST_0_i_35_n_0 ),
        .I3(\seg[6]_INST_0_i_36_n_0 ),
        .I4(bcd),
        .I5(din[4]),
        .O(tens_sel[0]));
  LUT6 #(
    .INIT(64'hFF87FF78FFFFFF78)) 
    \seg[6]_INST_0_i_18 
       (.I0(\seg[6]_INST_0_i_37_n_0 ),
        .I1(bcd),
        .I2(din[1]),
        .I3(ones_sel[3]),
        .I4(ones_sel[2]),
        .I5(din[0]),
        .O(ones_place[0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hBEFE)) 
    \seg[6]_INST_0_i_19 
       (.I0(hundreds_sel[3]),
        .I1(hundreds_sel[1]),
        .I2(hundreds_sel[2]),
        .I3(hundreds_sel[0]),
        .O(hundreds_place[0]));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \seg[6]_INST_0_i_2 
       (.I0(\seg[6]_INST_0_i_9_n_0 ),
        .I1(tens_place[6]),
        .I2(\seg[6]_INST_0_i_10_n_0 ),
        .I3(\seg[6]_INST_0_i_11_n_0 ),
        .I4(\seg[6]_INST_0_i_12_n_0 ),
        .I5(\seg[6]_INST_0_i_13_n_0 ),
        .O(\seg[6]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0821420810428410)) 
    \seg[6]_INST_0_i_20 
       (.I0(\seg[6]_INST_0_i_25_n_0 ),
        .I1(\seg[6]_INST_0_i_44_n_0 ),
        .I2(\seg[6]_INST_0_i_45_n_0 ),
        .I3(\seg[6]_INST_0_i_46_n_0 ),
        .I4(\seg[6]_INST_0_i_47_n_0 ),
        .I5(\seg[6]_INST_0_i_48_n_0 ),
        .O(\seg[6]_INST_0_i_20_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h1FE0)) 
    \seg[6]_INST_0_i_21 
       (.I0(\seg[6]_INST_0_i_49_n_0 ),
        .I1(\seg[6]_INST_0_i_50_n_0 ),
        .I2(\seg[6]_INST_0_i_51_n_0 ),
        .I3(\seg[6]_INST_0_i_52_n_0 ),
        .O(\seg[6]_INST_0_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hEC111C0B03E4E234)) 
    \seg[6]_INST_0_i_22 
       (.I0(\seg[6]_INST_0_i_53_n_0 ),
        .I1(\seg[6]_INST_0_i_54_n_0 ),
        .I2(\seg[6]_INST_0_i_55_n_0 ),
        .I3(\seg[6]_INST_0_i_56_n_0 ),
        .I4(\seg[6]_INST_0_i_57_n_0 ),
        .I5(\seg[6]_INST_0_i_58_n_0 ),
        .O(\seg[6]_INST_0_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h18C3266318C6318C)) 
    \seg[6]_INST_0_i_23 
       (.I0(\seg[6]_INST_0_i_58_n_0 ),
        .I1(\seg[6]_INST_0_i_57_n_0 ),
        .I2(\seg[6]_INST_0_i_56_n_0 ),
        .I3(\seg[6]_INST_0_i_55_n_0 ),
        .I4(\seg[6]_INST_0_i_54_n_0 ),
        .I5(\seg[6]_INST_0_i_53_n_0 ),
        .O(\seg[6]_INST_0_i_23_n_0 ));
  LUT6 #(
    .INIT(64'h2104078421084210)) 
    \seg[6]_INST_0_i_24 
       (.I0(\seg[6]_INST_0_i_58_n_0 ),
        .I1(\seg[6]_INST_0_i_57_n_0 ),
        .I2(\seg[6]_INST_0_i_56_n_0 ),
        .I3(\seg[6]_INST_0_i_55_n_0 ),
        .I4(\seg[6]_INST_0_i_54_n_0 ),
        .I5(\seg[6]_INST_0_i_53_n_0 ),
        .O(\seg[6]_INST_0_i_24_n_0 ));
  LUT6 #(
    .INIT(64'h3E0807F83E0F83E0)) 
    \seg[6]_INST_0_i_25 
       (.I0(\seg[6]_INST_0_i_58_n_0 ),
        .I1(\seg[6]_INST_0_i_57_n_0 ),
        .I2(\seg[6]_INST_0_i_56_n_0 ),
        .I3(\seg[6]_INST_0_i_55_n_0 ),
        .I4(\seg[6]_INST_0_i_54_n_0 ),
        .I5(\seg[6]_INST_0_i_53_n_0 ),
        .O(\seg[6]_INST_0_i_25_n_0 ));
  LUT6 #(
    .INIT(64'h0F3E830FE083F8E0)) 
    \seg[6]_INST_0_i_26 
       (.I0(\seg[6]_INST_0_i_25_n_0 ),
        .I1(\seg[6]_INST_0_i_44_n_0 ),
        .I2(\seg[6]_INST_0_i_45_n_0 ),
        .I3(\seg[6]_INST_0_i_46_n_0 ),
        .I4(\seg[6]_INST_0_i_47_n_0 ),
        .I5(\seg[6]_INST_0_i_48_n_0 ),
        .O(\seg[6]_INST_0_i_26_n_0 ));
  LUT5 #(
    .INIT(32'hC3493492)) 
    \seg[6]_INST_0_i_27 
       (.I0(\seg[6]_INST_0_i_48_n_0 ),
        .I1(\seg[6]_INST_0_i_47_n_0 ),
        .I2(\seg[6]_INST_0_i_46_n_0 ),
        .I3(\seg[6]_INST_0_i_45_n_0 ),
        .I4(\seg[6]_INST_0_i_44_n_0 ),
        .O(\seg[6]_INST_0_i_27_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hD864)) 
    \seg[6]_INST_0_i_28 
       (.I0(hundreds_sel[0]),
        .I1(hundreds_sel[1]),
        .I2(hundreds_sel[2]),
        .I3(hundreds_sel[3]),
        .O(\seg[6]_INST_0_i_28_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hD724)) 
    \seg[6]_INST_0_i_29 
       (.I0(hundreds_sel[3]),
        .I1(hundreds_sel[2]),
        .I2(hundreds_sel[1]),
        .I3(hundreds_sel[0]),
        .O(\seg[6]_INST_0_i_29_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hBEFE)) 
    \seg[6]_INST_0_i_3 
       (.I0(tens_sel[3]),
        .I1(tens_sel[1]),
        .I2(tens_sel[2]),
        .I3(tens_sel[0]),
        .O(tens_place[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h807F83E0)) 
    \seg[6]_INST_0_i_30 
       (.I0(din[2]),
        .I1(din[3]),
        .I2(\seg[6]_INST_0_i_59_n_0 ),
        .I3(\seg[6]_INST_0_i_60_n_0 ),
        .I4(\seg[6]_INST_0_i_61_n_0 ),
        .O(\seg[6]_INST_0_i_30_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h11EA)) 
    \seg[6]_INST_0_i_31 
       (.I0(\seg[6]_INST_0_i_52_n_0 ),
        .I1(\seg[6]_INST_0_i_51_n_0 ),
        .I2(\seg[6]_INST_0_i_50_n_0 ),
        .I3(\seg[6]_INST_0_i_49_n_0 ),
        .O(\seg[6]_INST_0_i_31_n_0 ));
  LUT4 #(
    .INIT(16'hFFE0)) 
    \seg[6]_INST_0_i_32 
       (.I0(\seg[6]_INST_0_i_30_n_0 ),
        .I1(\seg[6]_INST_0_i_31_n_0 ),
        .I2(\seg[6]_INST_0_i_33_n_0 ),
        .I3(\seg[6]_INST_0_i_62_n_0 ),
        .O(\seg[6]_INST_0_i_32_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h998C)) 
    \seg[6]_INST_0_i_33 
       (.I0(\seg[6]_INST_0_i_49_n_0 ),
        .I1(\seg[6]_INST_0_i_50_n_0 ),
        .I2(\seg[6]_INST_0_i_51_n_0 ),
        .I3(\seg[6]_INST_0_i_52_n_0 ),
        .O(\seg[6]_INST_0_i_33_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \seg[6]_INST_0_i_34 
       (.I0(\seg[6]_INST_0_i_63_n_0 ),
        .I1(din[2]),
        .O(\seg[6]_INST_0_i_34_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h6966)) 
    \seg[6]_INST_0_i_35 
       (.I0(\seg[6]_INST_0_i_64_n_0 ),
        .I1(din[3]),
        .I2(din[2]),
        .I3(\seg[6]_INST_0_i_63_n_0 ),
        .O(\seg[6]_INST_0_i_35_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h09FFF600)) 
    \seg[6]_INST_0_i_36 
       (.I0(\seg[6]_INST_0_i_64_n_0 ),
        .I1(din[3]),
        .I2(din[2]),
        .I3(\seg[6]_INST_0_i_63_n_0 ),
        .I4(\seg[6]_INST_0_i_65_n_0 ),
        .O(\seg[6]_INST_0_i_36_n_0 ));
  LUT6 #(
    .INIT(64'h6099FFFFFFFF6660)) 
    \seg[6]_INST_0_i_37 
       (.I0(\seg[6]_INST_0_i_64_n_0 ),
        .I1(din[3]),
        .I2(din[1]),
        .I3(din[2]),
        .I4(\seg[6]_INST_0_i_63_n_0 ),
        .I5(\seg[6]_INST_0_i_65_n_0 ),
        .O(\seg[6]_INST_0_i_37_n_0 ));
  LUT6 #(
    .INIT(64'h1FE0FFFF1FE00000)) 
    \seg[6]_INST_0_i_38 
       (.I0(\seg[6]_INST_0_i_34_n_0 ),
        .I1(din[1]),
        .I2(\seg[6]_INST_0_i_37_n_0 ),
        .I3(\seg[6]_INST_0_i_35_n_0 ),
        .I4(bcd),
        .I5(din[3]),
        .O(ones_sel[3]));
  LUT5 #(
    .INIT(32'hB4FFB400)) 
    \seg[6]_INST_0_i_39 
       (.I0(din[1]),
        .I1(\seg[6]_INST_0_i_37_n_0 ),
        .I2(\seg[6]_INST_0_i_34_n_0 ),
        .I3(bcd),
        .I4(din[2]),
        .O(ones_sel[2]));
  LUT6 #(
    .INIT(64'h1E10FFFF1E100000)) 
    \seg[6]_INST_0_i_40 
       (.I0(\seg[6]_INST_0_i_21_n_0 ),
        .I1(\seg[6]_INST_0_i_22_n_0 ),
        .I2(\seg[6]_INST_0_i_23_n_0 ),
        .I3(\seg[6]_INST_0_i_24_n_0 ),
        .I4(bcd),
        .I5(din[11]),
        .O(hundreds_sel[3]));
  LUT6 #(
    .INIT(64'h11EAFFFF11EA0000)) 
    \seg[6]_INST_0_i_41 
       (.I0(\seg[6]_INST_0_i_24_n_0 ),
        .I1(\seg[6]_INST_0_i_23_n_0 ),
        .I2(\seg[6]_INST_0_i_22_n_0 ),
        .I3(\seg[6]_INST_0_i_21_n_0 ),
        .I4(bcd),
        .I5(din[9]),
        .O(hundreds_sel[1]));
  LUT6 #(
    .INIT(64'h998CFFFF998C0000)) 
    \seg[6]_INST_0_i_42 
       (.I0(\seg[6]_INST_0_i_21_n_0 ),
        .I1(\seg[6]_INST_0_i_22_n_0 ),
        .I2(\seg[6]_INST_0_i_23_n_0 ),
        .I3(\seg[6]_INST_0_i_24_n_0 ),
        .I4(bcd),
        .I5(din[10]),
        .O(hundreds_sel[2]));
  LUT6 #(
    .INIT(64'h1FE0FFFF1FE00000)) 
    \seg[6]_INST_0_i_43 
       (.I0(\seg[6]_INST_0_i_30_n_0 ),
        .I1(\seg[6]_INST_0_i_31_n_0 ),
        .I2(\seg[6]_INST_0_i_33_n_0 ),
        .I3(\seg[6]_INST_0_i_62_n_0 ),
        .I4(bcd),
        .I5(din[8]),
        .O(hundreds_sel[0]));
  LUT5 #(
    .INIT(32'h807F83E0)) 
    \seg[6]_INST_0_i_44 
       (.I0(\seg[6]_INST_0_i_57_n_0 ),
        .I1(\seg[6]_INST_0_i_56_n_0 ),
        .I2(\seg[6]_INST_0_i_55_n_0 ),
        .I3(\seg[6]_INST_0_i_54_n_0 ),
        .I4(\seg[6]_INST_0_i_53_n_0 ),
        .O(\seg[6]_INST_0_i_44_n_0 ));
  LUT6 #(
    .INIT(64'h0F3E830FE083F8E0)) 
    \seg[6]_INST_0_i_45 
       (.I0(\seg[6]_INST_0_i_56_n_0 ),
        .I1(\seg[6]_INST_0_i_66_n_0 ),
        .I2(\seg[6]_INST_0_i_67_n_0 ),
        .I3(\seg[6]_INST_0_i_68_n_0 ),
        .I4(\seg[6]_INST_0_i_69_n_0 ),
        .I5(\seg[6]_INST_0_i_70_n_0 ),
        .O(\seg[6]_INST_0_i_45_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \seg[6]_INST_0_i_46 
       (.I0(\seg[6]_INST_0_i_68_n_0 ),
        .I1(\seg[6]_INST_0_i_69_n_0 ),
        .I2(\seg[6]_INST_0_i_70_n_0 ),
        .O(\seg[6]_INST_0_i_46_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h38E30EF0)) 
    \seg[6]_INST_0_i_47 
       (.I0(\seg[6]_INST_0_i_66_n_0 ),
        .I1(\seg[6]_INST_0_i_67_n_0 ),
        .I2(\seg[6]_INST_0_i_68_n_0 ),
        .I3(\seg[6]_INST_0_i_69_n_0 ),
        .I4(\seg[6]_INST_0_i_70_n_0 ),
        .O(\seg[6]_INST_0_i_47_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hB20C)) 
    \seg[6]_INST_0_i_48 
       (.I0(\seg[6]_INST_0_i_67_n_0 ),
        .I1(\seg[6]_INST_0_i_68_n_0 ),
        .I2(\seg[6]_INST_0_i_69_n_0 ),
        .I3(\seg[6]_INST_0_i_70_n_0 ),
        .O(\seg[6]_INST_0_i_48_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h1FE0)) 
    \seg[6]_INST_0_i_49 
       (.I0(din[3]),
        .I1(\seg[6]_INST_0_i_59_n_0 ),
        .I2(\seg[6]_INST_0_i_60_n_0 ),
        .I3(\seg[6]_INST_0_i_61_n_0 ),
        .O(\seg[6]_INST_0_i_49_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \seg[6]_INST_0_i_5 
       (.I0(\seg[6]_INST_0_i_20_n_0 ),
        .I1(bcd),
        .I2(din[15]),
        .O(thousands_sel[3]));
  LUT6 #(
    .INIT(64'hEC111C0B03E4E234)) 
    \seg[6]_INST_0_i_50 
       (.I0(\seg[6]_INST_0_i_71_n_0 ),
        .I1(\seg[6]_INST_0_i_72_n_0 ),
        .I2(\seg[6]_INST_0_i_73_n_0 ),
        .I3(\seg[6]_INST_0_i_74_n_0 ),
        .I4(\seg[6]_INST_0_i_75_n_0 ),
        .I5(\seg[6]_INST_0_i_76_n_0 ),
        .O(\seg[6]_INST_0_i_50_n_0 ));
  LUT6 #(
    .INIT(64'h18C3266318C6318C)) 
    \seg[6]_INST_0_i_51 
       (.I0(\seg[6]_INST_0_i_76_n_0 ),
        .I1(\seg[6]_INST_0_i_75_n_0 ),
        .I2(\seg[6]_INST_0_i_74_n_0 ),
        .I3(\seg[6]_INST_0_i_73_n_0 ),
        .I4(\seg[6]_INST_0_i_72_n_0 ),
        .I5(\seg[6]_INST_0_i_71_n_0 ),
        .O(\seg[6]_INST_0_i_51_n_0 ));
  LUT6 #(
    .INIT(64'h2104078421084210)) 
    \seg[6]_INST_0_i_52 
       (.I0(\seg[6]_INST_0_i_76_n_0 ),
        .I1(\seg[6]_INST_0_i_75_n_0 ),
        .I2(\seg[6]_INST_0_i_74_n_0 ),
        .I3(\seg[6]_INST_0_i_73_n_0 ),
        .I4(\seg[6]_INST_0_i_72_n_0 ),
        .I5(\seg[6]_INST_0_i_71_n_0 ),
        .O(\seg[6]_INST_0_i_52_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h24120180)) 
    \seg[6]_INST_0_i_53 
       (.I0(\seg[6]_INST_0_i_66_n_0 ),
        .I1(\seg[6]_INST_0_i_67_n_0 ),
        .I2(\seg[6]_INST_0_i_68_n_0 ),
        .I3(\seg[6]_INST_0_i_69_n_0 ),
        .I4(\seg[6]_INST_0_i_70_n_0 ),
        .O(\seg[6]_INST_0_i_53_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h1381C86C)) 
    \seg[6]_INST_0_i_54 
       (.I0(\seg[6]_INST_0_i_66_n_0 ),
        .I1(\seg[6]_INST_0_i_67_n_0 ),
        .I2(\seg[6]_INST_0_i_68_n_0 ),
        .I3(\seg[6]_INST_0_i_69_n_0 ),
        .I4(\seg[6]_INST_0_i_70_n_0 ),
        .O(\seg[6]_INST_0_i_54_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hC3493492)) 
    \seg[6]_INST_0_i_55 
       (.I0(\seg[6]_INST_0_i_70_n_0 ),
        .I1(\seg[6]_INST_0_i_69_n_0 ),
        .I2(\seg[6]_INST_0_i_68_n_0 ),
        .I3(\seg[6]_INST_0_i_67_n_0 ),
        .I4(\seg[6]_INST_0_i_66_n_0 ),
        .O(\seg[6]_INST_0_i_55_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h1FE0)) 
    \seg[6]_INST_0_i_56 
       (.I0(\seg[6]_INST_0_i_74_n_0 ),
        .I1(\seg[6]_INST_0_i_73_n_0 ),
        .I2(\seg[6]_INST_0_i_72_n_0 ),
        .I3(\seg[6]_INST_0_i_71_n_0 ),
        .O(\seg[6]_INST_0_i_56_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h807F83E0)) 
    \seg[6]_INST_0_i_57 
       (.I0(\seg[6]_INST_0_i_75_n_0 ),
        .I1(\seg[6]_INST_0_i_74_n_0 ),
        .I2(\seg[6]_INST_0_i_73_n_0 ),
        .I3(\seg[6]_INST_0_i_72_n_0 ),
        .I4(\seg[6]_INST_0_i_71_n_0 ),
        .O(\seg[6]_INST_0_i_57_n_0 ));
  LUT6 #(
    .INIT(64'h3E0807F83E0F83E0)) 
    \seg[6]_INST_0_i_58 
       (.I0(\seg[6]_INST_0_i_76_n_0 ),
        .I1(\seg[6]_INST_0_i_75_n_0 ),
        .I2(\seg[6]_INST_0_i_74_n_0 ),
        .I3(\seg[6]_INST_0_i_73_n_0 ),
        .I4(\seg[6]_INST_0_i_72_n_0 ),
        .I5(\seg[6]_INST_0_i_71_n_0 ),
        .O(\seg[6]_INST_0_i_58_n_0 ));
  LUT6 #(
    .INIT(64'hEC111C0B03E4E234)) 
    \seg[6]_INST_0_i_59 
       (.I0(\seg[6]_INST_0_i_77_n_0 ),
        .I1(\seg[6]_INST_0_i_78_n_0 ),
        .I2(\seg[6]_INST_0_i_79_n_0 ),
        .I3(din[6]),
        .I4(din[5]),
        .I5(din[4]),
        .O(\seg[6]_INST_0_i_59_n_0 ));
  LUT6 #(
    .INIT(64'h1FE0FFFF1FE00000)) 
    \seg[6]_INST_0_i_6 
       (.I0(\seg[6]_INST_0_i_21_n_0 ),
        .I1(\seg[6]_INST_0_i_22_n_0 ),
        .I2(\seg[6]_INST_0_i_23_n_0 ),
        .I3(\seg[6]_INST_0_i_24_n_0 ),
        .I4(bcd),
        .I5(din[12]),
        .O(thousands_sel[0]));
  LUT6 #(
    .INIT(64'h18C3266318C6318C)) 
    \seg[6]_INST_0_i_60 
       (.I0(din[4]),
        .I1(din[5]),
        .I2(din[6]),
        .I3(\seg[6]_INST_0_i_79_n_0 ),
        .I4(\seg[6]_INST_0_i_78_n_0 ),
        .I5(\seg[6]_INST_0_i_77_n_0 ),
        .O(\seg[6]_INST_0_i_60_n_0 ));
  LUT6 #(
    .INIT(64'h2104078421084210)) 
    \seg[6]_INST_0_i_61 
       (.I0(din[4]),
        .I1(din[5]),
        .I2(din[6]),
        .I3(\seg[6]_INST_0_i_79_n_0 ),
        .I4(\seg[6]_INST_0_i_78_n_0 ),
        .I5(\seg[6]_INST_0_i_77_n_0 ),
        .O(\seg[6]_INST_0_i_61_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h1E10)) 
    \seg[6]_INST_0_i_62 
       (.I0(\seg[6]_INST_0_i_49_n_0 ),
        .I1(\seg[6]_INST_0_i_50_n_0 ),
        .I2(\seg[6]_INST_0_i_51_n_0 ),
        .I3(\seg[6]_INST_0_i_52_n_0 ),
        .O(\seg[6]_INST_0_i_62_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h83FF83E0)) 
    \seg[6]_INST_0_i_63 
       (.I0(din[2]),
        .I1(din[3]),
        .I2(\seg[6]_INST_0_i_59_n_0 ),
        .I3(\seg[6]_INST_0_i_60_n_0 ),
        .I4(\seg[6]_INST_0_i_61_n_0 ),
        .O(\seg[6]_INST_0_i_63_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hFFE0)) 
    \seg[6]_INST_0_i_64 
       (.I0(din[3]),
        .I1(\seg[6]_INST_0_i_59_n_0 ),
        .I2(\seg[6]_INST_0_i_60_n_0 ),
        .I3(\seg[6]_INST_0_i_61_n_0 ),
        .O(\seg[6]_INST_0_i_64_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \seg[6]_INST_0_i_65 
       (.I0(din[3]),
        .I1(\seg[6]_INST_0_i_64_n_0 ),
        .I2(\seg[6]_INST_0_i_59_n_0 ),
        .O(\seg[6]_INST_0_i_65_n_0 ));
  LUT6 #(
    .INIT(64'h3E0807F83E0F83E0)) 
    \seg[6]_INST_0_i_66 
       (.I0(\seg[6]_INST_0_i_80_n_0 ),
        .I1(\seg[6]_INST_0_i_81_n_0 ),
        .I2(\seg[6]_INST_0_i_82_n_0 ),
        .I3(\seg[6]_INST_0_i_83_n_0 ),
        .I4(\seg[6]_INST_0_i_84_n_0 ),
        .I5(\seg[6]_INST_0_i_85_n_0 ),
        .O(\seg[6]_INST_0_i_66_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h807F83E0)) 
    \seg[6]_INST_0_i_67 
       (.I0(\seg[6]_INST_0_i_81_n_0 ),
        .I1(\seg[6]_INST_0_i_82_n_0 ),
        .I2(\seg[6]_INST_0_i_83_n_0 ),
        .I3(\seg[6]_INST_0_i_84_n_0 ),
        .I4(\seg[6]_INST_0_i_85_n_0 ),
        .O(\seg[6]_INST_0_i_67_n_0 ));
  LUT5 #(
    .INIT(32'hF0E00000)) 
    \seg[6]_INST_0_i_68 
       (.I0(din[11]),
        .I1(din[12]),
        .I2(din[15]),
        .I3(din[13]),
        .I4(din[14]),
        .O(\seg[6]_INST_0_i_68_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h1FE0)) 
    \seg[6]_INST_0_i_69 
       (.I0(\seg[6]_INST_0_i_82_n_0 ),
        .I1(\seg[6]_INST_0_i_83_n_0 ),
        .I2(\seg[6]_INST_0_i_84_n_0 ),
        .I3(\seg[6]_INST_0_i_85_n_0 ),
        .O(\seg[6]_INST_0_i_69_n_0 ));
  LUT5 #(
    .INIT(32'hB4FFB400)) 
    \seg[6]_INST_0_i_7 
       (.I0(\seg[6]_INST_0_i_25_n_0 ),
        .I1(\seg[6]_INST_0_i_26_n_0 ),
        .I2(\seg[6]_INST_0_i_27_n_0 ),
        .I3(bcd),
        .I4(din[14]),
        .O(thousands_sel[2]));
  LUT6 #(
    .INIT(64'h00FE0300FF00FF00)) 
    \seg[6]_INST_0_i_70 
       (.I0(din[10]),
        .I1(din[11]),
        .I2(din[12]),
        .I3(din[15]),
        .I4(din[13]),
        .I5(din[14]),
        .O(\seg[6]_INST_0_i_70_n_0 ));
  LUT6 #(
    .INIT(64'h2104078421084210)) 
    \seg[6]_INST_0_i_71 
       (.I0(\seg[6]_INST_0_i_80_n_0 ),
        .I1(\seg[6]_INST_0_i_81_n_0 ),
        .I2(\seg[6]_INST_0_i_82_n_0 ),
        .I3(\seg[6]_INST_0_i_83_n_0 ),
        .I4(\seg[6]_INST_0_i_84_n_0 ),
        .I5(\seg[6]_INST_0_i_85_n_0 ),
        .O(\seg[6]_INST_0_i_71_n_0 ));
  LUT6 #(
    .INIT(64'h18C3266318C6318C)) 
    \seg[6]_INST_0_i_72 
       (.I0(\seg[6]_INST_0_i_80_n_0 ),
        .I1(\seg[6]_INST_0_i_81_n_0 ),
        .I2(\seg[6]_INST_0_i_82_n_0 ),
        .I3(\seg[6]_INST_0_i_83_n_0 ),
        .I4(\seg[6]_INST_0_i_84_n_0 ),
        .I5(\seg[6]_INST_0_i_85_n_0 ),
        .O(\seg[6]_INST_0_i_72_n_0 ));
  LUT6 #(
    .INIT(64'hEC111C0B03E4E234)) 
    \seg[6]_INST_0_i_73 
       (.I0(\seg[6]_INST_0_i_85_n_0 ),
        .I1(\seg[6]_INST_0_i_84_n_0 ),
        .I2(\seg[6]_INST_0_i_83_n_0 ),
        .I3(\seg[6]_INST_0_i_82_n_0 ),
        .I4(\seg[6]_INST_0_i_81_n_0 ),
        .I5(\seg[6]_INST_0_i_80_n_0 ),
        .O(\seg[6]_INST_0_i_73_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h1FE0)) 
    \seg[6]_INST_0_i_74 
       (.I0(din[6]),
        .I1(\seg[6]_INST_0_i_79_n_0 ),
        .I2(\seg[6]_INST_0_i_78_n_0 ),
        .I3(\seg[6]_INST_0_i_77_n_0 ),
        .O(\seg[6]_INST_0_i_74_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h807F83E0)) 
    \seg[6]_INST_0_i_75 
       (.I0(din[5]),
        .I1(din[6]),
        .I2(\seg[6]_INST_0_i_79_n_0 ),
        .I3(\seg[6]_INST_0_i_78_n_0 ),
        .I4(\seg[6]_INST_0_i_77_n_0 ),
        .O(\seg[6]_INST_0_i_75_n_0 ));
  LUT6 #(
    .INIT(64'h3E0807F83E0F83E0)) 
    \seg[6]_INST_0_i_76 
       (.I0(din[4]),
        .I1(din[5]),
        .I2(din[6]),
        .I3(\seg[6]_INST_0_i_79_n_0 ),
        .I4(\seg[6]_INST_0_i_78_n_0 ),
        .I5(\seg[6]_INST_0_i_77_n_0 ),
        .O(\seg[6]_INST_0_i_76_n_0 ));
  LUT6 #(
    .INIT(64'h2104078421084210)) 
    \seg[6]_INST_0_i_77 
       (.I0(din[7]),
        .I1(din[8]),
        .I2(din[9]),
        .I3(\seg[6]_INST_0_i_86_n_0 ),
        .I4(\seg[6]_INST_0_i_87_n_0 ),
        .I5(\seg[6]_INST_0_i_88_n_0 ),
        .O(\seg[6]_INST_0_i_77_n_0 ));
  LUT6 #(
    .INIT(64'h18C3266318C6318C)) 
    \seg[6]_INST_0_i_78 
       (.I0(din[7]),
        .I1(din[8]),
        .I2(din[9]),
        .I3(\seg[6]_INST_0_i_86_n_0 ),
        .I4(\seg[6]_INST_0_i_87_n_0 ),
        .I5(\seg[6]_INST_0_i_88_n_0 ),
        .O(\seg[6]_INST_0_i_78_n_0 ));
  LUT6 #(
    .INIT(64'hEC111C0B03E4E234)) 
    \seg[6]_INST_0_i_79 
       (.I0(\seg[6]_INST_0_i_88_n_0 ),
        .I1(\seg[6]_INST_0_i_87_n_0 ),
        .I2(\seg[6]_INST_0_i_86_n_0 ),
        .I3(din[9]),
        .I4(din[8]),
        .I5(din[7]),
        .O(\seg[6]_INST_0_i_79_n_0 ));
  LUT4 #(
    .INIT(16'h6F60)) 
    \seg[6]_INST_0_i_8 
       (.I0(\seg[6]_INST_0_i_26_n_0 ),
        .I1(\seg[6]_INST_0_i_25_n_0 ),
        .I2(bcd),
        .I3(din[13]),
        .O(thousands_sel[1]));
  LUT6 #(
    .INIT(64'h3E0807F83E0F83E0)) 
    \seg[6]_INST_0_i_80 
       (.I0(din[7]),
        .I1(din[8]),
        .I2(din[9]),
        .I3(\seg[6]_INST_0_i_86_n_0 ),
        .I4(\seg[6]_INST_0_i_87_n_0 ),
        .I5(\seg[6]_INST_0_i_88_n_0 ),
        .O(\seg[6]_INST_0_i_80_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h807F83E0)) 
    \seg[6]_INST_0_i_81 
       (.I0(din[8]),
        .I1(din[9]),
        .I2(\seg[6]_INST_0_i_86_n_0 ),
        .I3(\seg[6]_INST_0_i_87_n_0 ),
        .I4(\seg[6]_INST_0_i_88_n_0 ),
        .O(\seg[6]_INST_0_i_81_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h1FE0)) 
    \seg[6]_INST_0_i_82 
       (.I0(din[9]),
        .I1(\seg[6]_INST_0_i_86_n_0 ),
        .I2(\seg[6]_INST_0_i_87_n_0 ),
        .I3(\seg[6]_INST_0_i_88_n_0 ),
        .O(\seg[6]_INST_0_i_82_n_0 ));
  LUT6 #(
    .INIT(64'h2DC201D609D240D6)) 
    \seg[6]_INST_0_i_83 
       (.I0(din[14]),
        .I1(din[13]),
        .I2(din[15]),
        .I3(din[12]),
        .I4(din[11]),
        .I5(din[10]),
        .O(\seg[6]_INST_0_i_83_n_0 ));
  LUT6 #(
    .INIT(64'hF000000F1FFCF800)) 
    \seg[6]_INST_0_i_84 
       (.I0(din[10]),
        .I1(din[11]),
        .I2(din[12]),
        .I3(din[15]),
        .I4(din[13]),
        .I5(din[14]),
        .O(\seg[6]_INST_0_i_84_n_0 ));
  LUT6 #(
    .INIT(64'h000103F0E0000000)) 
    \seg[6]_INST_0_i_85 
       (.I0(din[10]),
        .I1(din[11]),
        .I2(din[12]),
        .I3(din[15]),
        .I4(din[13]),
        .I5(din[14]),
        .O(\seg[6]_INST_0_i_85_n_0 ));
  LUT6 #(
    .INIT(64'h8A65A651518A18A6)) 
    \seg[6]_INST_0_i_86 
       (.I0(din[14]),
        .I1(din[13]),
        .I2(din[15]),
        .I3(din[12]),
        .I4(din[11]),
        .I5(din[10]),
        .O(\seg[6]_INST_0_i_86_n_0 ));
  LUT6 #(
    .INIT(64'hC61831C68C31638C)) 
    \seg[6]_INST_0_i_87 
       (.I0(din[10]),
        .I1(din[11]),
        .I2(din[12]),
        .I3(din[15]),
        .I4(din[13]),
        .I5(din[14]),
        .O(\seg[6]_INST_0_i_87_n_0 ));
  LUT6 #(
    .INIT(64'h0821420810428410)) 
    \seg[6]_INST_0_i_88 
       (.I0(din[10]),
        .I1(din[11]),
        .I2(din[12]),
        .I3(din[15]),
        .I4(din[13]),
        .I5(din[14]),
        .O(\seg[6]_INST_0_i_88_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \seg[6]_INST_0_i_9 
       (.I0(tens_sel[3]),
        .I1(tens_sel[1]),
        .I2(tens_sel[2]),
        .I3(tens_sel[0]),
        .O(\seg[6]_INST_0_i_9_n_0 ));
endmodule

(* ORIG_REF_NAME = "FullDisplay" *) 
module SevenSegmentDriver_0_FullDisplay
   (dp,
    an,
    seg,
    clk,
    \din[14] ,
    \din[9] ,
    tens_place,
    ones_place,
    hundreds_place,
    \din[14]_0 ,
    \din[14]_1 ,
    \din[14]_2 ,
    \din[14]_3 ,
    \din[14]_4 ,
    \din[14]_5 ,
    \din[9]_0 ,
    \din[14]_6 ,
    \din[14]_7 ,
    \din[14]_8 ,
    \din[14]_9 ,
    \din[9]_1 ,
    \din[14]_10 ,
    \din[14]_11 ,
    \din[14]_12 ,
    \din[14]_13 ,
    \din[14]_14 ,
    dec);
  output dp;
  output [3:0]an;
  output [6:0]seg;
  input clk;
  input \din[14] ;
  input \din[9] ;
  input [4:0]tens_place;
  input [3:0]ones_place;
  input [3:0]hundreds_place;
  input \din[14]_0 ;
  input \din[14]_1 ;
  input \din[14]_2 ;
  input \din[14]_3 ;
  input \din[14]_4 ;
  input \din[14]_5 ;
  input \din[9]_0 ;
  input \din[14]_6 ;
  input \din[14]_7 ;
  input \din[14]_8 ;
  input \din[14]_9 ;
  input \din[9]_1 ;
  input \din[14]_10 ;
  input \din[14]_11 ;
  input \din[14]_12 ;
  input \din[14]_13 ;
  input \din[14]_14 ;
  input [1:0]dec;

  wire [3:0]an;
  wire clk;
  wire [1:0]dec;
  wire \din[14] ;
  wire \din[14]_0 ;
  wire \din[14]_1 ;
  wire \din[14]_10 ;
  wire \din[14]_11 ;
  wire \din[14]_12 ;
  wire \din[14]_13 ;
  wire \din[14]_14 ;
  wire \din[14]_2 ;
  wire \din[14]_3 ;
  wire \din[14]_4 ;
  wire \din[14]_5 ;
  wire \din[14]_6 ;
  wire \din[14]_7 ;
  wire \din[14]_8 ;
  wire \din[14]_9 ;
  wire \din[9] ;
  wire \din[9]_0 ;
  wire \din[9]_1 ;
  wire dp;
  wire [3:0]hundreds_place;
  wire [3:0]ones_place;
  wire refClk;
  wire [6:0]seg;
  wire [4:0]tens_place;

  SevenSegmentDriver_0_ThePlexer Mux
       (.CLK(refClk),
        .an(an),
        .dec(dec),
        .\din[14] (\din[14] ),
        .\din[14]_0 (\din[14]_0 ),
        .\din[14]_1 (\din[14]_1 ),
        .\din[14]_10 (\din[14]_10 ),
        .\din[14]_11 (\din[14]_11 ),
        .\din[14]_12 (\din[14]_12 ),
        .\din[14]_13 (\din[14]_13 ),
        .\din[14]_14 (\din[14]_14 ),
        .\din[14]_2 (\din[14]_2 ),
        .\din[14]_3 (\din[14]_3 ),
        .\din[14]_4 (\din[14]_4 ),
        .\din[14]_5 (\din[14]_5 ),
        .\din[14]_6 (\din[14]_6 ),
        .\din[14]_7 (\din[14]_7 ),
        .\din[14]_8 (\din[14]_8 ),
        .\din[14]_9 (\din[14]_9 ),
        .\din[9] (\din[9] ),
        .\din[9]_0 (\din[9]_0 ),
        .\din[9]_1 (\din[9]_1 ),
        .dp(dp),
        .hundreds_place(hundreds_place),
        .ones_place(ones_place),
        .seg(seg),
        .tens_place(tens_place));
  SevenSegmentDriver_0_clkB clkInst
       (.clk(clk),
        .refClk(refClk));
endmodule

(* ORIG_REF_NAME = "ThePlexer" *) 
module SevenSegmentDriver_0_ThePlexer
   (dp,
    an,
    seg,
    \din[14] ,
    \din[9] ,
    tens_place,
    ones_place,
    hundreds_place,
    \din[14]_0 ,
    \din[14]_1 ,
    \din[14]_2 ,
    \din[14]_3 ,
    \din[14]_4 ,
    \din[14]_5 ,
    \din[9]_0 ,
    \din[14]_6 ,
    \din[14]_7 ,
    \din[14]_8 ,
    \din[14]_9 ,
    \din[9]_1 ,
    \din[14]_10 ,
    \din[14]_11 ,
    \din[14]_12 ,
    \din[14]_13 ,
    \din[14]_14 ,
    dec,
    CLK);
  output dp;
  output [3:0]an;
  output [6:0]seg;
  input \din[14] ;
  input \din[9] ;
  input [4:0]tens_place;
  input [3:0]ones_place;
  input [3:0]hundreds_place;
  input \din[14]_0 ;
  input \din[14]_1 ;
  input \din[14]_2 ;
  input \din[14]_3 ;
  input \din[14]_4 ;
  input \din[14]_5 ;
  input \din[9]_0 ;
  input \din[14]_6 ;
  input \din[14]_7 ;
  input \din[14]_8 ;
  input \din[14]_9 ;
  input \din[9]_1 ;
  input \din[14]_10 ;
  input \din[14]_11 ;
  input \din[14]_12 ;
  input \din[14]_13 ;
  input \din[14]_14 ;
  input [1:0]dec;
  input CLK;

  wire CLK;
  wire [3:0]an;
  wire [1:0]dec;
  wire \din[14] ;
  wire \din[14]_0 ;
  wire \din[14]_1 ;
  wire \din[14]_10 ;
  wire \din[14]_11 ;
  wire \din[14]_12 ;
  wire \din[14]_13 ;
  wire \din[14]_14 ;
  wire \din[14]_2 ;
  wire \din[14]_3 ;
  wire \din[14]_4 ;
  wire \din[14]_5 ;
  wire \din[14]_6 ;
  wire \din[14]_7 ;
  wire \din[14]_8 ;
  wire \din[14]_9 ;
  wire \din[9] ;
  wire \din[9]_0 ;
  wire \din[9]_1 ;
  wire dp;
  wire dp_reg_i_1_n_0;
  wire [3:0]hundreds_place;
  wire [3:0]ones_place;
  wire [6:0]seg;
  wire \seg[0]_INST_0_i_3_n_0 ;
  wire \seg[1]_INST_0_i_3_n_0 ;
  wire \seg[2]_INST_0_i_3_n_0 ;
  wire \seg[3]_INST_0_i_3_n_0 ;
  wire \seg[4]_INST_0_i_3_n_0 ;
  wire \seg[5]_INST_0_i_3_n_0 ;
  wire \seg[6]_INST_0_i_4_n_0 ;
  wire [1:0]sel;
  wire \sel[0]_i_1_n_0 ;
  wire \sel[1]_i_1_n_0 ;
  wire [4:0]tens_place;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \an[0]_INST_0 
       (.I0(sel[0]),
        .I1(sel[1]),
        .O(an[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \an[1]_INST_0 
       (.I0(sel[0]),
        .I1(sel[1]),
        .O(an[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \an[2]_INST_0 
       (.I0(sel[1]),
        .I1(sel[0]),
        .O(an[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \an[3]_INST_0 
       (.I0(sel[0]),
        .I1(sel[1]),
        .O(an[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    dp_reg
       (.CLR(1'b0),
        .D(dp_reg_i_1_n_0),
        .G(an[0]),
        .GE(1'b1),
        .Q(dp));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hF99F)) 
    dp_reg_i_1
       (.I0(sel[1]),
        .I1(dec[1]),
        .I2(sel[0]),
        .I3(dec[0]),
        .O(dp_reg_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000D1DDFFFFD1DD)) 
    \seg[0]_INST_0 
       (.I0(\din[14]_12 ),
        .I1(sel[1]),
        .I2(\din[9] ),
        .I3(tens_place[4]),
        .I4(sel[0]),
        .I5(\seg[0]_INST_0_i_3_n_0 ),
        .O(seg[0]));
  LUT6 #(
    .INIT(64'hB8B8B8B8B8B8B888)) 
    \seg[0]_INST_0_i_3 
       (.I0(\din[14]_13 ),
        .I1(sel[1]),
        .I2(\din[14]_14 ),
        .I3(\din[14]_0 ),
        .I4(\din[14]_1 ),
        .I5(\din[14]_2 ),
        .O(\seg[0]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000D1DDFFFFD1DD)) 
    \seg[1]_INST_0 
       (.I0(\din[14]_9 ),
        .I1(sel[1]),
        .I2(\din[9] ),
        .I3(\din[9]_1 ),
        .I4(sel[0]),
        .I5(\seg[1]_INST_0_i_3_n_0 ),
        .O(seg[1]));
  LUT6 #(
    .INIT(64'hB8B8B8B8B8B8B888)) 
    \seg[1]_INST_0_i_3 
       (.I0(\din[14]_10 ),
        .I1(sel[1]),
        .I2(\din[14]_11 ),
        .I3(\din[14]_0 ),
        .I4(\din[14]_1 ),
        .I5(\din[14]_2 ),
        .O(\seg[1]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000D1DDFFFFD1DD)) 
    \seg[2]_INST_0 
       (.I0(\din[14]_8 ),
        .I1(sel[1]),
        .I2(\din[9] ),
        .I3(tens_place[3]),
        .I4(sel[0]),
        .I5(\seg[2]_INST_0_i_3_n_0 ),
        .O(seg[2]));
  LUT6 #(
    .INIT(64'hB8B8B8B8B8B8B888)) 
    \seg[2]_INST_0_i_3 
       (.I0(ones_place[3]),
        .I1(sel[1]),
        .I2(hundreds_place[3]),
        .I3(\din[14]_0 ),
        .I4(\din[14]_1 ),
        .I5(\din[14]_2 ),
        .O(\seg[2]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000D1DDFFFFD1DD)) 
    \seg[3]_INST_0 
       (.I0(\din[14]_5 ),
        .I1(sel[1]),
        .I2(\din[9] ),
        .I3(\din[9]_0 ),
        .I4(sel[0]),
        .I5(\seg[3]_INST_0_i_3_n_0 ),
        .O(seg[3]));
  LUT6 #(
    .INIT(64'hB8B8B8B8B8B8B888)) 
    \seg[3]_INST_0_i_3 
       (.I0(\din[14]_6 ),
        .I1(sel[1]),
        .I2(\din[14]_7 ),
        .I3(\din[14]_0 ),
        .I4(\din[14]_1 ),
        .I5(\din[14]_2 ),
        .O(\seg[3]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000D1DDFFFFD1DD)) 
    \seg[4]_INST_0 
       (.I0(\din[14]_4 ),
        .I1(sel[1]),
        .I2(\din[9] ),
        .I3(tens_place[2]),
        .I4(sel[0]),
        .I5(\seg[4]_INST_0_i_3_n_0 ),
        .O(seg[4]));
  LUT6 #(
    .INIT(64'hB8B8B8B8B8B8B888)) 
    \seg[4]_INST_0_i_3 
       (.I0(ones_place[2]),
        .I1(sel[1]),
        .I2(hundreds_place[2]),
        .I3(\din[14]_0 ),
        .I4(\din[14]_1 ),
        .I5(\din[14]_2 ),
        .O(\seg[4]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000D1DDFFFFD1DD)) 
    \seg[5]_INST_0 
       (.I0(\din[14]_3 ),
        .I1(sel[1]),
        .I2(\din[9] ),
        .I3(tens_place[1]),
        .I4(sel[0]),
        .I5(\seg[5]_INST_0_i_3_n_0 ),
        .O(seg[5]));
  LUT6 #(
    .INIT(64'hB8B8B8B8B8B8B888)) 
    \seg[5]_INST_0_i_3 
       (.I0(ones_place[1]),
        .I1(sel[1]),
        .I2(hundreds_place[1]),
        .I3(\din[14]_0 ),
        .I4(\din[14]_1 ),
        .I5(\din[14]_2 ),
        .O(\seg[5]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000D1DDFFFFD1DD)) 
    \seg[6]_INST_0 
       (.I0(\din[14] ),
        .I1(sel[1]),
        .I2(\din[9] ),
        .I3(tens_place[0]),
        .I4(sel[0]),
        .I5(\seg[6]_INST_0_i_4_n_0 ),
        .O(seg[6]));
  LUT6 #(
    .INIT(64'hB8B8B8B8B8B8B888)) 
    \seg[6]_INST_0_i_4 
       (.I0(ones_place[0]),
        .I1(sel[1]),
        .I2(hundreds_place[0]),
        .I3(\din[14]_0 ),
        .I4(\din[14]_1 ),
        .I5(\din[14]_2 ),
        .O(\seg[6]_INST_0_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sel[0]_i_1 
       (.I0(sel[0]),
        .O(\sel[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \sel[1]_i_1 
       (.I0(sel[0]),
        .I1(sel[1]),
        .O(\sel[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sel_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\sel[0]_i_1_n_0 ),
        .Q(sel[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sel_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\sel[1]_i_1_n_0 ),
        .Q(sel[1]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "clkB" *) 
module SevenSegmentDriver_0_clkB
   (refClk,
    clk);
  output refClk;
  input clk;

  wire clk;
  wire [23:0]count;
  wire \count[0]_i_2_n_0 ;
  wire \count[0]_i_3_n_0 ;
  wire \count[0]_i_4_n_0 ;
  wire \count[0]_i_5_n_0 ;
  wire \count[0]_i_6_n_0 ;
  wire \count[0]_i_7_n_0 ;
  wire \count[12]_i_2_n_0 ;
  wire \count[12]_i_3_n_0 ;
  wire \count[12]_i_4_n_0 ;
  wire \count[12]_i_5_n_0 ;
  wire \count[16]_i_2_n_0 ;
  wire \count[16]_i_3_n_0 ;
  wire \count[16]_i_4_n_0 ;
  wire \count[16]_i_5_n_0 ;
  wire \count[20]_i_2_n_0 ;
  wire \count[20]_i_3_n_0 ;
  wire \count[20]_i_4_n_0 ;
  wire \count[20]_i_5_n_0 ;
  wire \count[23]_i_3_n_0 ;
  wire \count[23]_i_4_n_0 ;
  wire \count[23]_i_5_n_0 ;
  wire \count[4]_i_2_n_0 ;
  wire \count[4]_i_3_n_0 ;
  wire \count[4]_i_4_n_0 ;
  wire \count[4]_i_5_n_0 ;
  wire \count[8]_i_2_n_0 ;
  wire \count[8]_i_3_n_0 ;
  wire \count[8]_i_4_n_0 ;
  wire \count[8]_i_5_n_0 ;
  wire [0:0]count_1;
  wire \count_reg[12]_i_1_n_0 ;
  wire \count_reg[12]_i_1_n_1 ;
  wire \count_reg[12]_i_1_n_2 ;
  wire \count_reg[12]_i_1_n_3 ;
  wire \count_reg[16]_i_1_n_0 ;
  wire \count_reg[16]_i_1_n_1 ;
  wire \count_reg[16]_i_1_n_2 ;
  wire \count_reg[16]_i_1_n_3 ;
  wire \count_reg[20]_i_1_n_0 ;
  wire \count_reg[20]_i_1_n_1 ;
  wire \count_reg[20]_i_1_n_2 ;
  wire \count_reg[20]_i_1_n_3 ;
  wire \count_reg[23]_i_2_n_2 ;
  wire \count_reg[23]_i_2_n_3 ;
  wire \count_reg[4]_i_1_n_0 ;
  wire \count_reg[4]_i_1_n_1 ;
  wire \count_reg[4]_i_1_n_2 ;
  wire \count_reg[4]_i_1_n_3 ;
  wire \count_reg[8]_i_1_n_0 ;
  wire \count_reg[8]_i_1_n_1 ;
  wire \count_reg[8]_i_1_n_2 ;
  wire \count_reg[8]_i_1_n_3 ;
  wire [23:1]data0;
  wire refClk;
  wire refClk_0;
  wire refClk_i_1_n_0;
  wire [3:2]\NLW_count_reg[23]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_count_reg[23]_i_2_O_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[0]_i_1 
       (.I0(\count[0]_i_2_n_0 ),
        .I1(count[0]),
        .O(count_1));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \count[0]_i_2 
       (.I0(\count[0]_i_3_n_0 ),
        .I1(count[1]),
        .I2(count[22]),
        .I3(count[23]),
        .I4(\count[0]_i_4_n_0 ),
        .I5(\count[0]_i_5_n_0 ),
        .O(\count[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \count[0]_i_3 
       (.I0(count[19]),
        .I1(count[18]),
        .I2(count[21]),
        .I3(count[20]),
        .O(\count[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \count[0]_i_4 
       (.I0(count[12]),
        .I1(count[13]),
        .I2(count[11]),
        .I3(count[10]),
        .I4(\count[0]_i_6_n_0 ),
        .O(\count[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \count[0]_i_5 
       (.I0(count[4]),
        .I1(count[5]),
        .I2(count[2]),
        .I3(count[3]),
        .I4(\count[0]_i_7_n_0 ),
        .O(\count[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \count[0]_i_6 
       (.I0(count[15]),
        .I1(count[14]),
        .I2(count[16]),
        .I3(count[17]),
        .O(\count[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \count[0]_i_7 
       (.I0(count[7]),
        .I1(count[6]),
        .I2(count[9]),
        .I3(count[8]),
        .O(\count[0]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[12]_i_2 
       (.I0(count[12]),
        .O(\count[12]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[12]_i_3 
       (.I0(count[11]),
        .O(\count[12]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[12]_i_4 
       (.I0(count[10]),
        .O(\count[12]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[12]_i_5 
       (.I0(count[9]),
        .O(\count[12]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[16]_i_2 
       (.I0(count[16]),
        .O(\count[16]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[16]_i_3 
       (.I0(count[15]),
        .O(\count[16]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[16]_i_4 
       (.I0(count[14]),
        .O(\count[16]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[16]_i_5 
       (.I0(count[13]),
        .O(\count[16]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[20]_i_2 
       (.I0(count[20]),
        .O(\count[20]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[20]_i_3 
       (.I0(count[19]),
        .O(\count[20]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[20]_i_4 
       (.I0(count[18]),
        .O(\count[20]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[20]_i_5 
       (.I0(count[17]),
        .O(\count[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \count[23]_i_1 
       (.I0(\count[0]_i_2_n_0 ),
        .I1(count[0]),
        .O(refClk_0));
  LUT1 #(
    .INIT(2'h2)) 
    \count[23]_i_3 
       (.I0(count[23]),
        .O(\count[23]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[23]_i_4 
       (.I0(count[22]),
        .O(\count[23]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[23]_i_5 
       (.I0(count[21]),
        .O(\count[23]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[4]_i_2 
       (.I0(count[4]),
        .O(\count[4]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[4]_i_3 
       (.I0(count[3]),
        .O(\count[4]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[4]_i_4 
       (.I0(count[2]),
        .O(\count[4]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[4]_i_5 
       (.I0(count[1]),
        .O(\count[4]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[8]_i_2 
       (.I0(count[8]),
        .O(\count[8]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[8]_i_3 
       (.I0(count[7]),
        .O(\count[8]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[8]_i_4 
       (.I0(count[6]),
        .O(\count[8]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \count[8]_i_5 
       (.I0(count[5]),
        .O(\count[8]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(count_1),
        .Q(count[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[10]),
        .Q(count[10]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[11]),
        .Q(count[11]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[12]),
        .Q(count[12]),
        .R(refClk_0));
  CARRY4 \count_reg[12]_i_1 
       (.CI(\count_reg[8]_i_1_n_0 ),
        .CO({\count_reg[12]_i_1_n_0 ,\count_reg[12]_i_1_n_1 ,\count_reg[12]_i_1_n_2 ,\count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S({\count[12]_i_2_n_0 ,\count[12]_i_3_n_0 ,\count[12]_i_4_n_0 ,\count[12]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[13]),
        .Q(count[13]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[14]),
        .Q(count[14]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[15]),
        .Q(count[15]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[16]),
        .Q(count[16]),
        .R(refClk_0));
  CARRY4 \count_reg[16]_i_1 
       (.CI(\count_reg[12]_i_1_n_0 ),
        .CO({\count_reg[16]_i_1_n_0 ,\count_reg[16]_i_1_n_1 ,\count_reg[16]_i_1_n_2 ,\count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S({\count[16]_i_2_n_0 ,\count[16]_i_3_n_0 ,\count[16]_i_4_n_0 ,\count[16]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[17]),
        .Q(count[17]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[18]),
        .Q(count[18]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[19]),
        .Q(count[19]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[1]),
        .Q(count[1]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[20]),
        .Q(count[20]),
        .R(refClk_0));
  CARRY4 \count_reg[20]_i_1 
       (.CI(\count_reg[16]_i_1_n_0 ),
        .CO({\count_reg[20]_i_1_n_0 ,\count_reg[20]_i_1_n_1 ,\count_reg[20]_i_1_n_2 ,\count_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S({\count[20]_i_2_n_0 ,\count[20]_i_3_n_0 ,\count[20]_i_4_n_0 ,\count[20]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[21]),
        .Q(count[21]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[22]),
        .Q(count[22]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[23]),
        .Q(count[23]),
        .R(refClk_0));
  CARRY4 \count_reg[23]_i_2 
       (.CI(\count_reg[20]_i_1_n_0 ),
        .CO({\NLW_count_reg[23]_i_2_CO_UNCONNECTED [3:2],\count_reg[23]_i_2_n_2 ,\count_reg[23]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_count_reg[23]_i_2_O_UNCONNECTED [3],data0[23:21]}),
        .S({1'b0,\count[23]_i_3_n_0 ,\count[23]_i_4_n_0 ,\count[23]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[2]),
        .Q(count[2]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[3]),
        .Q(count[3]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[4]),
        .Q(count[4]),
        .R(refClk_0));
  CARRY4 \count_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\count_reg[4]_i_1_n_0 ,\count_reg[4]_i_1_n_1 ,\count_reg[4]_i_1_n_2 ,\count_reg[4]_i_1_n_3 }),
        .CYINIT(count[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S({\count[4]_i_2_n_0 ,\count[4]_i_3_n_0 ,\count[4]_i_4_n_0 ,\count[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[5]),
        .Q(count[5]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[6]),
        .Q(count[6]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[7]),
        .Q(count[7]),
        .R(refClk_0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[8]),
        .Q(count[8]),
        .R(refClk_0));
  CARRY4 \count_reg[8]_i_1 
       (.CI(\count_reg[4]_i_1_n_0 ),
        .CO({\count_reg[8]_i_1_n_0 ,\count_reg[8]_i_1_n_1 ,\count_reg[8]_i_1_n_2 ,\count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S({\count[8]_i_2_n_0 ,\count[8]_i_3_n_0 ,\count[8]_i_4_n_0 ,\count[8]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[9]),
        .Q(count[9]),
        .R(refClk_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hE1)) 
    refClk_i_1
       (.I0(\count[0]_i_2_n_0 ),
        .I1(count[0]),
        .I2(refClk),
        .O(refClk_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    refClk_reg
       (.C(clk),
        .CE(1'b1),
        .D(refClk_i_1_n_0),
        .Q(refClk),
        .R(1'b0));
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

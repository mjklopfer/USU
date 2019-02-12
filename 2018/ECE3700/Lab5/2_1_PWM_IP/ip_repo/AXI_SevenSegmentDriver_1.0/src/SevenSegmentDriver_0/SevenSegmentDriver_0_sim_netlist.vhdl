-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
-- Date        : Mon Mar 12 12:45:36 2018
-- Host        : DESKTOP-PM6UVGK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/xilinxworking/lab3v2/lab3-20180226t173356z-001/lab3/ip_repo/axi_sevensegmentdriver_1.0/src/SevenSegmentDriver_0/SevenSegmentDriver_0_sim_netlist.vhdl
-- Design      : SevenSegmentDriver_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SevenSegmentDriver_0_ThePlexer is
  port (
    dp : out STD_LOGIC;
    an : out STD_LOGIC_VECTOR ( 3 downto 0 );
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \din[14]\ : in STD_LOGIC;
    \din[9]\ : in STD_LOGIC;
    tens_place : in STD_LOGIC_VECTOR ( 4 downto 0 );
    ones_place : in STD_LOGIC_VECTOR ( 3 downto 0 );
    hundreds_place : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \din[14]_0\ : in STD_LOGIC;
    \din[14]_1\ : in STD_LOGIC;
    \din[14]_2\ : in STD_LOGIC;
    \din[14]_3\ : in STD_LOGIC;
    \din[14]_4\ : in STD_LOGIC;
    \din[14]_5\ : in STD_LOGIC;
    \din[9]_0\ : in STD_LOGIC;
    \din[14]_6\ : in STD_LOGIC;
    \din[14]_7\ : in STD_LOGIC;
    \din[14]_8\ : in STD_LOGIC;
    \din[14]_9\ : in STD_LOGIC;
    \din[9]_1\ : in STD_LOGIC;
    \din[14]_10\ : in STD_LOGIC;
    \din[14]_11\ : in STD_LOGIC;
    \din[14]_12\ : in STD_LOGIC;
    \din[14]_13\ : in STD_LOGIC;
    \din[14]_14\ : in STD_LOGIC;
    dec : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SevenSegmentDriver_0_ThePlexer : entity is "ThePlexer";
end SevenSegmentDriver_0_ThePlexer;

architecture STRUCTURE of SevenSegmentDriver_0_ThePlexer is
  signal \^an\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal dp_reg_i_1_n_0 : STD_LOGIC;
  signal \seg[0]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \seg[1]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \seg[2]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \seg[3]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \seg[4]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \seg[5]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal sel : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \sel[0]_i_1_n_0\ : STD_LOGIC;
  signal \sel[1]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \an[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \an[1]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \an[2]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \an[3]_INST_0\ : label is "soft_lutpair1";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of dp_reg : label is "LD";
  attribute SOFT_HLUTNM of dp_reg_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \sel[1]_i_1\ : label is "soft_lutpair1";
begin
  an(3 downto 0) <= \^an\(3 downto 0);
\an[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      O => \^an\(0)
    );
\an[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      O => \^an\(1)
    );
\an[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sel(1),
      I1 => sel(0),
      O => \^an\(2)
    );
\an[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      O => \^an\(3)
    );
dp_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => dp_reg_i_1_n_0,
      G => \^an\(0),
      GE => '1',
      Q => dp
    );
dp_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F99F"
    )
        port map (
      I0 => sel(1),
      I1 => dec(1),
      I2 => sel(0),
      I3 => dec(0),
      O => dp_reg_i_1_n_0
    );
\seg[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000D1DDFFFFD1DD"
    )
        port map (
      I0 => \din[14]_12\,
      I1 => sel(1),
      I2 => \din[9]\,
      I3 => tens_place(4),
      I4 => sel(0),
      I5 => \seg[0]_INST_0_i_3_n_0\,
      O => seg(0)
    );
\seg[0]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8B8B8B8B888"
    )
        port map (
      I0 => \din[14]_13\,
      I1 => sel(1),
      I2 => \din[14]_14\,
      I3 => \din[14]_0\,
      I4 => \din[14]_1\,
      I5 => \din[14]_2\,
      O => \seg[0]_INST_0_i_3_n_0\
    );
\seg[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000D1DDFFFFD1DD"
    )
        port map (
      I0 => \din[14]_9\,
      I1 => sel(1),
      I2 => \din[9]\,
      I3 => \din[9]_1\,
      I4 => sel(0),
      I5 => \seg[1]_INST_0_i_3_n_0\,
      O => seg(1)
    );
\seg[1]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8B8B8B8B888"
    )
        port map (
      I0 => \din[14]_10\,
      I1 => sel(1),
      I2 => \din[14]_11\,
      I3 => \din[14]_0\,
      I4 => \din[14]_1\,
      I5 => \din[14]_2\,
      O => \seg[1]_INST_0_i_3_n_0\
    );
\seg[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000D1DDFFFFD1DD"
    )
        port map (
      I0 => \din[14]_8\,
      I1 => sel(1),
      I2 => \din[9]\,
      I3 => tens_place(3),
      I4 => sel(0),
      I5 => \seg[2]_INST_0_i_3_n_0\,
      O => seg(2)
    );
\seg[2]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8B8B8B8B888"
    )
        port map (
      I0 => ones_place(3),
      I1 => sel(1),
      I2 => hundreds_place(3),
      I3 => \din[14]_0\,
      I4 => \din[14]_1\,
      I5 => \din[14]_2\,
      O => \seg[2]_INST_0_i_3_n_0\
    );
\seg[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000D1DDFFFFD1DD"
    )
        port map (
      I0 => \din[14]_5\,
      I1 => sel(1),
      I2 => \din[9]\,
      I3 => \din[9]_0\,
      I4 => sel(0),
      I5 => \seg[3]_INST_0_i_3_n_0\,
      O => seg(3)
    );
\seg[3]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8B8B8B8B888"
    )
        port map (
      I0 => \din[14]_6\,
      I1 => sel(1),
      I2 => \din[14]_7\,
      I3 => \din[14]_0\,
      I4 => \din[14]_1\,
      I5 => \din[14]_2\,
      O => \seg[3]_INST_0_i_3_n_0\
    );
\seg[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000D1DDFFFFD1DD"
    )
        port map (
      I0 => \din[14]_4\,
      I1 => sel(1),
      I2 => \din[9]\,
      I3 => tens_place(2),
      I4 => sel(0),
      I5 => \seg[4]_INST_0_i_3_n_0\,
      O => seg(4)
    );
\seg[4]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8B8B8B8B888"
    )
        port map (
      I0 => ones_place(2),
      I1 => sel(1),
      I2 => hundreds_place(2),
      I3 => \din[14]_0\,
      I4 => \din[14]_1\,
      I5 => \din[14]_2\,
      O => \seg[4]_INST_0_i_3_n_0\
    );
\seg[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000D1DDFFFFD1DD"
    )
        port map (
      I0 => \din[14]_3\,
      I1 => sel(1),
      I2 => \din[9]\,
      I3 => tens_place(1),
      I4 => sel(0),
      I5 => \seg[5]_INST_0_i_3_n_0\,
      O => seg(5)
    );
\seg[5]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8B8B8B8B888"
    )
        port map (
      I0 => ones_place(1),
      I1 => sel(1),
      I2 => hundreds_place(1),
      I3 => \din[14]_0\,
      I4 => \din[14]_1\,
      I5 => \din[14]_2\,
      O => \seg[5]_INST_0_i_3_n_0\
    );
\seg[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000D1DDFFFFD1DD"
    )
        port map (
      I0 => \din[14]\,
      I1 => sel(1),
      I2 => \din[9]\,
      I3 => tens_place(0),
      I4 => sel(0),
      I5 => \seg[6]_INST_0_i_4_n_0\,
      O => seg(6)
    );
\seg[6]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8B8B8B8B888"
    )
        port map (
      I0 => ones_place(0),
      I1 => sel(1),
      I2 => hundreds_place(0),
      I3 => \din[14]_0\,
      I4 => \din[14]_1\,
      I5 => \din[14]_2\,
      O => \seg[6]_INST_0_i_4_n_0\
    );
\sel[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sel(0),
      O => \sel[0]_i_1_n_0\
    );
\sel[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      O => \sel[1]_i_1_n_0\
    );
\sel_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \sel[0]_i_1_n_0\,
      Q => sel(0),
      R => '0'
    );
\sel_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \sel[1]_i_1_n_0\,
      Q => sel(1),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SevenSegmentDriver_0_clkB is
  port (
    refClk : out STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SevenSegmentDriver_0_clkB : entity is "clkB";
end SevenSegmentDriver_0_clkB;

architecture STRUCTURE of SevenSegmentDriver_0_clkB is
  signal count : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal \count[0]_i_2_n_0\ : STD_LOGIC;
  signal \count[0]_i_3_n_0\ : STD_LOGIC;
  signal \count[0]_i_4_n_0\ : STD_LOGIC;
  signal \count[0]_i_5_n_0\ : STD_LOGIC;
  signal \count[0]_i_6_n_0\ : STD_LOGIC;
  signal \count[0]_i_7_n_0\ : STD_LOGIC;
  signal \count[12]_i_2_n_0\ : STD_LOGIC;
  signal \count[12]_i_3_n_0\ : STD_LOGIC;
  signal \count[12]_i_4_n_0\ : STD_LOGIC;
  signal \count[12]_i_5_n_0\ : STD_LOGIC;
  signal \count[16]_i_2_n_0\ : STD_LOGIC;
  signal \count[16]_i_3_n_0\ : STD_LOGIC;
  signal \count[16]_i_4_n_0\ : STD_LOGIC;
  signal \count[16]_i_5_n_0\ : STD_LOGIC;
  signal \count[20]_i_2_n_0\ : STD_LOGIC;
  signal \count[20]_i_3_n_0\ : STD_LOGIC;
  signal \count[20]_i_4_n_0\ : STD_LOGIC;
  signal \count[20]_i_5_n_0\ : STD_LOGIC;
  signal \count[23]_i_3_n_0\ : STD_LOGIC;
  signal \count[23]_i_4_n_0\ : STD_LOGIC;
  signal \count[23]_i_5_n_0\ : STD_LOGIC;
  signal \count[4]_i_2_n_0\ : STD_LOGIC;
  signal \count[4]_i_3_n_0\ : STD_LOGIC;
  signal \count[4]_i_4_n_0\ : STD_LOGIC;
  signal \count[4]_i_5_n_0\ : STD_LOGIC;
  signal \count[8]_i_2_n_0\ : STD_LOGIC;
  signal \count[8]_i_3_n_0\ : STD_LOGIC;
  signal \count[8]_i_4_n_0\ : STD_LOGIC;
  signal \count[8]_i_5_n_0\ : STD_LOGIC;
  signal count_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[23]_i_2_n_2\ : STD_LOGIC;
  signal \count_reg[23]_i_2_n_3\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 23 downto 1 );
  signal \^refclk\ : STD_LOGIC;
  signal refClk_0 : STD_LOGIC;
  signal refClk_i_1_n_0 : STD_LOGIC;
  signal \NLW_count_reg[23]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_count_reg[23]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of refClk_i_1 : label is "soft_lutpair3";
begin
  refClk <= \^refclk\;
\count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \count[0]_i_2_n_0\,
      I1 => count(0),
      O => count_1(0)
    );
\count[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \count[0]_i_3_n_0\,
      I1 => count(1),
      I2 => count(22),
      I3 => count(23),
      I4 => \count[0]_i_4_n_0\,
      I5 => \count[0]_i_5_n_0\,
      O => \count[0]_i_2_n_0\
    );
\count[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => count(19),
      I1 => count(18),
      I2 => count(21),
      I3 => count(20),
      O => \count[0]_i_3_n_0\
    );
\count[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEFF"
    )
        port map (
      I0 => count(12),
      I1 => count(13),
      I2 => count(11),
      I3 => count(10),
      I4 => \count[0]_i_6_n_0\,
      O => \count[0]_i_4_n_0\
    );
\count[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => count(4),
      I1 => count(5),
      I2 => count(2),
      I3 => count(3),
      I4 => \count[0]_i_7_n_0\,
      O => \count[0]_i_5_n_0\
    );
\count[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => count(15),
      I1 => count(14),
      I2 => count(16),
      I3 => count(17),
      O => \count[0]_i_6_n_0\
    );
\count[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => count(7),
      I1 => count(6),
      I2 => count(9),
      I3 => count(8),
      O => \count[0]_i_7_n_0\
    );
\count[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(12),
      O => \count[12]_i_2_n_0\
    );
\count[12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(11),
      O => \count[12]_i_3_n_0\
    );
\count[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(10),
      O => \count[12]_i_4_n_0\
    );
\count[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(9),
      O => \count[12]_i_5_n_0\
    );
\count[16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(16),
      O => \count[16]_i_2_n_0\
    );
\count[16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(15),
      O => \count[16]_i_3_n_0\
    );
\count[16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(14),
      O => \count[16]_i_4_n_0\
    );
\count[16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(13),
      O => \count[16]_i_5_n_0\
    );
\count[20]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(20),
      O => \count[20]_i_2_n_0\
    );
\count[20]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(19),
      O => \count[20]_i_3_n_0\
    );
\count[20]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(18),
      O => \count[20]_i_4_n_0\
    );
\count[20]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(17),
      O => \count[20]_i_5_n_0\
    );
\count[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \count[0]_i_2_n_0\,
      I1 => count(0),
      O => refClk_0
    );
\count[23]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(23),
      O => \count[23]_i_3_n_0\
    );
\count[23]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(22),
      O => \count[23]_i_4_n_0\
    );
\count[23]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(21),
      O => \count[23]_i_5_n_0\
    );
\count[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(4),
      O => \count[4]_i_2_n_0\
    );
\count[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(3),
      O => \count[4]_i_3_n_0\
    );
\count[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(2),
      O => \count[4]_i_4_n_0\
    );
\count[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(1),
      O => \count[4]_i_5_n_0\
    );
\count[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(8),
      O => \count[8]_i_2_n_0\
    );
\count[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(7),
      O => \count[8]_i_3_n_0\
    );
\count[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(6),
      O => \count[8]_i_4_n_0\
    );
\count[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(5),
      O => \count[8]_i_5_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => count_1(0),
      Q => count(0),
      R => '0'
    );
\count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(10),
      Q => count(10),
      R => refClk_0
    );
\count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(11),
      Q => count(11),
      R => refClk_0
    );
\count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(12),
      Q => count(12),
      R => refClk_0
    );
\count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[8]_i_1_n_0\,
      CO(3) => \count_reg[12]_i_1_n_0\,
      CO(2) => \count_reg[12]_i_1_n_1\,
      CO(1) => \count_reg[12]_i_1_n_2\,
      CO(0) => \count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3) => \count[12]_i_2_n_0\,
      S(2) => \count[12]_i_3_n_0\,
      S(1) => \count[12]_i_4_n_0\,
      S(0) => \count[12]_i_5_n_0\
    );
\count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(13),
      Q => count(13),
      R => refClk_0
    );
\count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(14),
      Q => count(14),
      R => refClk_0
    );
\count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(15),
      Q => count(15),
      R => refClk_0
    );
\count_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(16),
      Q => count(16),
      R => refClk_0
    );
\count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[12]_i_1_n_0\,
      CO(3) => \count_reg[16]_i_1_n_0\,
      CO(2) => \count_reg[16]_i_1_n_1\,
      CO(1) => \count_reg[16]_i_1_n_2\,
      CO(0) => \count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3) => \count[16]_i_2_n_0\,
      S(2) => \count[16]_i_3_n_0\,
      S(1) => \count[16]_i_4_n_0\,
      S(0) => \count[16]_i_5_n_0\
    );
\count_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(17),
      Q => count(17),
      R => refClk_0
    );
\count_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(18),
      Q => count(18),
      R => refClk_0
    );
\count_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(19),
      Q => count(19),
      R => refClk_0
    );
\count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(1),
      Q => count(1),
      R => refClk_0
    );
\count_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(20),
      Q => count(20),
      R => refClk_0
    );
\count_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[16]_i_1_n_0\,
      CO(3) => \count_reg[20]_i_1_n_0\,
      CO(2) => \count_reg[20]_i_1_n_1\,
      CO(1) => \count_reg[20]_i_1_n_2\,
      CO(0) => \count_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3) => \count[20]_i_2_n_0\,
      S(2) => \count[20]_i_3_n_0\,
      S(1) => \count[20]_i_4_n_0\,
      S(0) => \count[20]_i_5_n_0\
    );
\count_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(21),
      Q => count(21),
      R => refClk_0
    );
\count_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(22),
      Q => count(22),
      R => refClk_0
    );
\count_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(23),
      Q => count(23),
      R => refClk_0
    );
\count_reg[23]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[20]_i_1_n_0\,
      CO(3 downto 2) => \NLW_count_reg[23]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \count_reg[23]_i_2_n_2\,
      CO(0) => \count_reg[23]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_count_reg[23]_i_2_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(23 downto 21),
      S(3) => '0',
      S(2) => \count[23]_i_3_n_0\,
      S(1) => \count[23]_i_4_n_0\,
      S(0) => \count[23]_i_5_n_0\
    );
\count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(2),
      Q => count(2),
      R => refClk_0
    );
\count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(3),
      Q => count(3),
      R => refClk_0
    );
\count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(4),
      Q => count(4),
      R => refClk_0
    );
\count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_reg[4]_i_1_n_0\,
      CO(2) => \count_reg[4]_i_1_n_1\,
      CO(1) => \count_reg[4]_i_1_n_2\,
      CO(0) => \count_reg[4]_i_1_n_3\,
      CYINIT => count(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3) => \count[4]_i_2_n_0\,
      S(2) => \count[4]_i_3_n_0\,
      S(1) => \count[4]_i_4_n_0\,
      S(0) => \count[4]_i_5_n_0\
    );
\count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(5),
      Q => count(5),
      R => refClk_0
    );
\count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(6),
      Q => count(6),
      R => refClk_0
    );
\count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(7),
      Q => count(7),
      R => refClk_0
    );
\count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(8),
      Q => count(8),
      R => refClk_0
    );
\count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[4]_i_1_n_0\,
      CO(3) => \count_reg[8]_i_1_n_0\,
      CO(2) => \count_reg[8]_i_1_n_1\,
      CO(1) => \count_reg[8]_i_1_n_2\,
      CO(0) => \count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3) => \count[8]_i_2_n_0\,
      S(2) => \count[8]_i_3_n_0\,
      S(1) => \count[8]_i_4_n_0\,
      S(0) => \count[8]_i_5_n_0\
    );
\count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data0(9),
      Q => count(9),
      R => refClk_0
    );
refClk_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E1"
    )
        port map (
      I0 => \count[0]_i_2_n_0\,
      I1 => count(0),
      I2 => \^refclk\,
      O => refClk_i_1_n_0
    );
refClk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => refClk_i_1_n_0,
      Q => \^refclk\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SevenSegmentDriver_0_FullDisplay is
  port (
    dp : out STD_LOGIC;
    an : out STD_LOGIC_VECTOR ( 3 downto 0 );
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    clk : in STD_LOGIC;
    \din[14]\ : in STD_LOGIC;
    \din[9]\ : in STD_LOGIC;
    tens_place : in STD_LOGIC_VECTOR ( 4 downto 0 );
    ones_place : in STD_LOGIC_VECTOR ( 3 downto 0 );
    hundreds_place : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \din[14]_0\ : in STD_LOGIC;
    \din[14]_1\ : in STD_LOGIC;
    \din[14]_2\ : in STD_LOGIC;
    \din[14]_3\ : in STD_LOGIC;
    \din[14]_4\ : in STD_LOGIC;
    \din[14]_5\ : in STD_LOGIC;
    \din[9]_0\ : in STD_LOGIC;
    \din[14]_6\ : in STD_LOGIC;
    \din[14]_7\ : in STD_LOGIC;
    \din[14]_8\ : in STD_LOGIC;
    \din[14]_9\ : in STD_LOGIC;
    \din[9]_1\ : in STD_LOGIC;
    \din[14]_10\ : in STD_LOGIC;
    \din[14]_11\ : in STD_LOGIC;
    \din[14]_12\ : in STD_LOGIC;
    \din[14]_13\ : in STD_LOGIC;
    \din[14]_14\ : in STD_LOGIC;
    dec : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SevenSegmentDriver_0_FullDisplay : entity is "FullDisplay";
end SevenSegmentDriver_0_FullDisplay;

architecture STRUCTURE of SevenSegmentDriver_0_FullDisplay is
  signal refClk : STD_LOGIC;
begin
Mux: entity work.SevenSegmentDriver_0_ThePlexer
     port map (
      CLK => refClk,
      an(3 downto 0) => an(3 downto 0),
      dec(1 downto 0) => dec(1 downto 0),
      \din[14]\ => \din[14]\,
      \din[14]_0\ => \din[14]_0\,
      \din[14]_1\ => \din[14]_1\,
      \din[14]_10\ => \din[14]_10\,
      \din[14]_11\ => \din[14]_11\,
      \din[14]_12\ => \din[14]_12\,
      \din[14]_13\ => \din[14]_13\,
      \din[14]_14\ => \din[14]_14\,
      \din[14]_2\ => \din[14]_2\,
      \din[14]_3\ => \din[14]_3\,
      \din[14]_4\ => \din[14]_4\,
      \din[14]_5\ => \din[14]_5\,
      \din[14]_6\ => \din[14]_6\,
      \din[14]_7\ => \din[14]_7\,
      \din[14]_8\ => \din[14]_8\,
      \din[14]_9\ => \din[14]_9\,
      \din[9]\ => \din[9]\,
      \din[9]_0\ => \din[9]_0\,
      \din[9]_1\ => \din[9]_1\,
      dp => dp,
      hundreds_place(3 downto 0) => hundreds_place(3 downto 0),
      ones_place(3 downto 0) => ones_place(3 downto 0),
      seg(6 downto 0) => seg(6 downto 0),
      tens_place(4 downto 0) => tens_place(4 downto 0)
    );
clkInst: entity work.SevenSegmentDriver_0_clkB
     port map (
      clk => clk,
      refClk => refClk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SevenSegmentDriver_0 is
  port (
    clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 15 downto 0 );
    bcd : in STD_LOGIC;
    dec : in STD_LOGIC_VECTOR ( 1 downto 0 );
    an : out STD_LOGIC_VECTOR ( 3 downto 0 );
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    dp : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of SevenSegmentDriver_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of SevenSegmentDriver_0 : entity is "SevenSegmentDriver_0,FullDisplay,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of SevenSegmentDriver_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of SevenSegmentDriver_0 : entity is "FullDisplay,Vivado 2015.4";
end SevenSegmentDriver_0;

architecture STRUCTURE of SevenSegmentDriver_0 is
  signal hundreds_place : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal hundreds_sel : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ones_place : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal ones_sel : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \seg[0]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \seg[0]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \seg[0]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \seg[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \seg[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \seg[1]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \seg[1]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \seg[2]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \seg[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \seg[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \seg[3]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \seg[3]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \seg[4]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \seg[5]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_13_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_20_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_21_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_22_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_23_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_24_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_25_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_26_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_27_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_28_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_29_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_30_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_31_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_32_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_33_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_34_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_35_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_36_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_37_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_44_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_45_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_46_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_47_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_48_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_49_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_50_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_51_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_52_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_53_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_54_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_55_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_56_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_57_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_58_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_59_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_60_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_61_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_62_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_63_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_64_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_65_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_66_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_67_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_68_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_69_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_70_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_71_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_72_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_73_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_74_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_75_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_76_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_77_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_78_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_79_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_80_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_81_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_82_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_83_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_84_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_85_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_86_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_87_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_88_n_0\ : STD_LOGIC;
  signal \seg[6]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal tens_place : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal tens_sel : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal thousands_sel : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \seg[0]_INST_0_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \seg[0]_INST_0_i_2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \seg[0]_INST_0_i_5\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \seg[1]_INST_0_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \seg[1]_INST_0_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \seg[2]_INST_0_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \seg[2]_INST_0_i_2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \seg[2]_INST_0_i_5\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \seg[3]_INST_0_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \seg[3]_INST_0_i_2\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \seg[3]_INST_0_i_5\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \seg[4]_INST_0_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \seg[4]_INST_0_i_5\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \seg[5]_INST_0_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \seg[5]_INST_0_i_2\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \seg[5]_INST_0_i_5\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_12\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_13\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_19\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_21\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_28\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_29\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_3\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_30\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_31\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_33\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_35\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_36\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_46\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_47\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_48\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_49\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_53\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_54\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_55\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_56\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_57\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_62\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_63\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_64\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_67\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_69\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_74\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_75\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_81\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_82\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \seg[6]_INST_0_i_9\ : label is "soft_lutpair25";
begin
inst: entity work.SevenSegmentDriver_0_FullDisplay
     port map (
      an(3 downto 0) => an(3 downto 0),
      clk => clk,
      dec(1 downto 0) => dec(1 downto 0),
      \din[14]\ => \seg[6]_INST_0_i_1_n_0\,
      \din[14]_0\ => \seg[6]_INST_0_i_10_n_0\,
      \din[14]_1\ => \seg[6]_INST_0_i_11_n_0\,
      \din[14]_10\ => \seg[1]_INST_0_i_4_n_0\,
      \din[14]_11\ => \seg[1]_INST_0_i_5_n_0\,
      \din[14]_12\ => \seg[0]_INST_0_i_1_n_0\,
      \din[14]_13\ => \seg[0]_INST_0_i_4_n_0\,
      \din[14]_14\ => \seg[0]_INST_0_i_5_n_0\,
      \din[14]_2\ => \seg[6]_INST_0_i_12_n_0\,
      \din[14]_3\ => \seg[5]_INST_0_i_1_n_0\,
      \din[14]_4\ => \seg[4]_INST_0_i_1_n_0\,
      \din[14]_5\ => \seg[3]_INST_0_i_1_n_0\,
      \din[14]_6\ => \seg[3]_INST_0_i_4_n_0\,
      \din[14]_7\ => \seg[3]_INST_0_i_5_n_0\,
      \din[14]_8\ => \seg[2]_INST_0_i_1_n_0\,
      \din[14]_9\ => \seg[1]_INST_0_i_1_n_0\,
      \din[9]\ => \seg[6]_INST_0_i_2_n_0\,
      \din[9]_0\ => \seg[3]_INST_0_i_2_n_0\,
      \din[9]_1\ => \seg[1]_INST_0_i_2_n_0\,
      dp => dp,
      hundreds_place(3) => hundreds_place(4),
      hundreds_place(2 downto 0) => hundreds_place(2 downto 0),
      ones_place(3) => ones_place(4),
      ones_place(2 downto 0) => ones_place(2 downto 0),
      seg(6 downto 0) => seg(6 downto 0),
      tens_place(4) => tens_place(6),
      tens_place(3) => tens_place(4),
      tens_place(2 downto 0) => tens_place(2 downto 0)
    );
\seg[0]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B6AE"
    )
        port map (
      I0 => thousands_sel(1),
      I1 => thousands_sel(3),
      I2 => thousands_sel(2),
      I3 => thousands_sel(0),
      O => \seg[0]_INST_0_i_1_n_0\
    );
\seg[0]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F74B"
    )
        port map (
      I0 => tens_sel(3),
      I1 => tens_sel(0),
      I2 => tens_sel(2),
      I3 => tens_sel(1),
      O => tens_place(6)
    );
\seg[0]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"78FF78788778FFFF"
    )
        port map (
      I0 => \seg[6]_INST_0_i_37_n_0\,
      I1 => bcd,
      I2 => din(1),
      I3 => ones_sel(3),
      I4 => din(0),
      I5 => ones_sel(2),
      O => \seg[0]_INST_0_i_4_n_0\
    );
\seg[0]_INST_0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F47B"
    )
        port map (
      I0 => hundreds_sel(3),
      I1 => hundreds_sel(0),
      I2 => hundreds_sel(1),
      I3 => hundreds_sel(2),
      O => \seg[0]_INST_0_i_5_n_0\
    );
\seg[1]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"479E"
    )
        port map (
      I0 => thousands_sel(3),
      I1 => thousands_sel(0),
      I2 => thousands_sel(2),
      I3 => thousands_sel(1),
      O => \seg[1]_INST_0_i_1_n_0\
    );
\seg[1]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"479F"
    )
        port map (
      I0 => tens_sel(3),
      I1 => tens_sel(0),
      I2 => tens_sel(2),
      I3 => tens_sel(1),
      O => \seg[1]_INST_0_i_2_n_0\
    );
\seg[1]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8778008787FFFFFF"
    )
        port map (
      I0 => \seg[6]_INST_0_i_37_n_0\,
      I1 => bcd,
      I2 => din(1),
      I3 => ones_sel(3),
      I4 => din(0),
      I5 => ones_sel(2),
      O => \seg[1]_INST_0_i_4_n_0\
    );
\seg[1]_INST_0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"479F"
    )
        port map (
      I0 => hundreds_sel(3),
      I1 => hundreds_sel(0),
      I2 => hundreds_sel(2),
      I3 => hundreds_sel(1),
      O => \seg[1]_INST_0_i_5_n_0\
    );
\seg[2]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5EDE"
    )
        port map (
      I0 => thousands_sel(3),
      I1 => thousands_sel(0),
      I2 => thousands_sel(2),
      I3 => thousands_sel(1),
      O => \seg[2]_INST_0_i_1_n_0\
    );
\seg[2]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F67"
    )
        port map (
      I0 => tens_sel(3),
      I1 => tens_sel(2),
      I2 => tens_sel(1),
      I3 => tens_sel(0),
      O => tens_place(4)
    );
\seg[2]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"87FFFFFF00FFFF87"
    )
        port map (
      I0 => \seg[6]_INST_0_i_37_n_0\,
      I1 => bcd,
      I2 => din(1),
      I3 => ones_sel(3),
      I4 => ones_sel(2),
      I5 => din(0),
      O => ones_place(4)
    );
\seg[2]_INST_0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F67"
    )
        port map (
      I0 => hundreds_sel(3),
      I1 => hundreds_sel(2),
      I2 => hundreds_sel(1),
      I3 => hundreds_sel(0),
      O => hundreds_place(4)
    );
\seg[3]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3DEA"
    )
        port map (
      I0 => thousands_sel(3),
      I1 => thousands_sel(0),
      I2 => thousands_sel(2),
      I3 => thousands_sel(1),
      O => \seg[3]_INST_0_i_1_n_0\
    );
\seg[3]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3EE7"
    )
        port map (
      I0 => tens_sel(3),
      I1 => tens_sel(1),
      I2 => tens_sel(2),
      I3 => tens_sel(0),
      O => \seg[3]_INST_0_i_2_n_0\
    );
\seg[3]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8787FF78FF7887FF"
    )
        port map (
      I0 => \seg[6]_INST_0_i_37_n_0\,
      I1 => bcd,
      I2 => din(1),
      I3 => ones_sel(3),
      I4 => ones_sel(2),
      I5 => din(0),
      O => \seg[3]_INST_0_i_4_n_0\
    );
\seg[3]_INST_0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3EE7"
    )
        port map (
      I0 => hundreds_sel(3),
      I1 => hundreds_sel(1),
      I2 => hundreds_sel(2),
      I3 => hundreds_sel(0),
      O => \seg[3]_INST_0_i_5_n_0\
    );
\seg[4]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBA2"
    )
        port map (
      I0 => thousands_sel(3),
      I1 => thousands_sel(0),
      I2 => thousands_sel(2),
      I3 => thousands_sel(1),
      O => \seg[4]_INST_0_i_1_n_0\
    );
\seg[4]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD45"
    )
        port map (
      I0 => tens_sel(0),
      I1 => tens_sel(1),
      I2 => tens_sel(2),
      I3 => tens_sel(3),
      O => tens_place(2)
    );
\seg[4]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF78FF007800FF"
    )
        port map (
      I0 => \seg[6]_INST_0_i_37_n_0\,
      I1 => bcd,
      I2 => din(1),
      I3 => din(0),
      I4 => ones_sel(2),
      I5 => ones_sel(3),
      O => ones_place(2)
    );
\seg[4]_INST_0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD45"
    )
        port map (
      I0 => hundreds_sel(0),
      I1 => hundreds_sel(1),
      I2 => hundreds_sel(2),
      I3 => hundreds_sel(3),
      O => hundreds_place(2)
    );
\seg[5]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA5A"
    )
        port map (
      I0 => thousands_sel(3),
      I1 => thousands_sel(0),
      I2 => thousands_sel(2),
      I3 => thousands_sel(1),
      O => \seg[5]_INST_0_i_1_n_0\
    );
\seg[5]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B4BD"
    )
        port map (
      I0 => tens_sel(1),
      I1 => tens_sel(2),
      I2 => tens_sel(3),
      I3 => tens_sel(0),
      O => tens_place(1)
    );
\seg[5]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"78FF870078FFFF87"
    )
        port map (
      I0 => \seg[6]_INST_0_i_37_n_0\,
      I1 => bcd,
      I2 => din(1),
      I3 => ones_sel(2),
      I4 => ones_sel(3),
      I5 => din(0),
      O => ones_place(1)
    );
\seg[5]_INST_0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B4BD"
    )
        port map (
      I0 => hundreds_sel(1),
      I1 => hundreds_sel(2),
      I2 => hundreds_sel(3),
      I3 => hundreds_sel(0),
      O => hundreds_place(1)
    );
\seg[6]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFFA"
    )
        port map (
      I0 => thousands_sel(3),
      I1 => thousands_sel(0),
      I2 => thousands_sel(2),
      I3 => thousands_sel(1),
      O => \seg[6]_INST_0_i_1_n_0\
    );
\seg[6]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFD555F55D"
    )
        port map (
      I0 => \seg[0]_INST_0_i_5_n_0\,
      I1 => thousands_sel(1),
      I2 => thousands_sel(3),
      I3 => thousands_sel(2),
      I4 => thousands_sel(0),
      I5 => \seg[6]_INST_0_i_28_n_0\,
      O => \seg[6]_INST_0_i_10_n_0\
    );
\seg[6]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAEAEFBAFFFFFFFF"
    )
        port map (
      I0 => \seg[6]_INST_0_i_29_n_0\,
      I1 => thousands_sel(3),
      I2 => thousands_sel(0),
      I3 => thousands_sel(2),
      I4 => thousands_sel(1),
      I5 => hundreds_place(1),
      O => \seg[6]_INST_0_i_11_n_0\
    );
\seg[6]_INST_0_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => hundreds_place(0),
      I1 => thousands_sel(0),
      I2 => thousands_sel(3),
      I3 => thousands_sel(2),
      I4 => thousands_sel(1),
      O => \seg[6]_INST_0_i_12_n_0\
    );
\seg[6]_INST_0_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"23FA"
    )
        port map (
      I0 => tens_sel(0),
      I1 => tens_sel(3),
      I2 => tens_sel(2),
      I3 => tens_sel(1),
      O => \seg[6]_INST_0_i_13_n_0\
    );
\seg[6]_INST_0_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1FE0FFFF1FE00000"
    )
        port map (
      I0 => \seg[6]_INST_0_i_30_n_0\,
      I1 => \seg[6]_INST_0_i_31_n_0\,
      I2 => \seg[6]_INST_0_i_32_n_0\,
      I3 => \seg[6]_INST_0_i_33_n_0\,
      I4 => bcd,
      I5 => din(7),
      O => tens_sel(3)
    );
\seg[6]_INST_0_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6F60"
    )
        port map (
      I0 => \seg[6]_INST_0_i_32_n_0\,
      I1 => \seg[6]_INST_0_i_30_n_0\,
      I2 => bcd,
      I3 => din(5),
      O => tens_sel(1)
    );
\seg[6]_INST_0_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B4FFB400"
    )
        port map (
      I0 => \seg[6]_INST_0_i_30_n_0\,
      I1 => \seg[6]_INST_0_i_32_n_0\,
      I2 => \seg[6]_INST_0_i_31_n_0\,
      I3 => bcd,
      I4 => din(6),
      O => tens_sel(2)
    );
\seg[6]_INST_0_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1FE0FFFF1FE00000"
    )
        port map (
      I0 => din(1),
      I1 => \seg[6]_INST_0_i_34_n_0\,
      I2 => \seg[6]_INST_0_i_35_n_0\,
      I3 => \seg[6]_INST_0_i_36_n_0\,
      I4 => bcd,
      I5 => din(4),
      O => tens_sel(0)
    );
\seg[6]_INST_0_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF87FF78FFFFFF78"
    )
        port map (
      I0 => \seg[6]_INST_0_i_37_n_0\,
      I1 => bcd,
      I2 => din(1),
      I3 => ones_sel(3),
      I4 => ones_sel(2),
      I5 => din(0),
      O => ones_place(0)
    );
\seg[6]_INST_0_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BEFE"
    )
        port map (
      I0 => hundreds_sel(3),
      I1 => hundreds_sel(1),
      I2 => hundreds_sel(2),
      I3 => hundreds_sel(0),
      O => hundreds_place(0)
    );
\seg[6]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => \seg[6]_INST_0_i_9_n_0\,
      I1 => tens_place(6),
      I2 => \seg[6]_INST_0_i_10_n_0\,
      I3 => \seg[6]_INST_0_i_11_n_0\,
      I4 => \seg[6]_INST_0_i_12_n_0\,
      I5 => \seg[6]_INST_0_i_13_n_0\,
      O => \seg[6]_INST_0_i_2_n_0\
    );
\seg[6]_INST_0_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0821420810428410"
    )
        port map (
      I0 => \seg[6]_INST_0_i_25_n_0\,
      I1 => \seg[6]_INST_0_i_44_n_0\,
      I2 => \seg[6]_INST_0_i_45_n_0\,
      I3 => \seg[6]_INST_0_i_46_n_0\,
      I4 => \seg[6]_INST_0_i_47_n_0\,
      I5 => \seg[6]_INST_0_i_48_n_0\,
      O => \seg[6]_INST_0_i_20_n_0\
    );
\seg[6]_INST_0_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1FE0"
    )
        port map (
      I0 => \seg[6]_INST_0_i_49_n_0\,
      I1 => \seg[6]_INST_0_i_50_n_0\,
      I2 => \seg[6]_INST_0_i_51_n_0\,
      I3 => \seg[6]_INST_0_i_52_n_0\,
      O => \seg[6]_INST_0_i_21_n_0\
    );
\seg[6]_INST_0_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EC111C0B03E4E234"
    )
        port map (
      I0 => \seg[6]_INST_0_i_53_n_0\,
      I1 => \seg[6]_INST_0_i_54_n_0\,
      I2 => \seg[6]_INST_0_i_55_n_0\,
      I3 => \seg[6]_INST_0_i_56_n_0\,
      I4 => \seg[6]_INST_0_i_57_n_0\,
      I5 => \seg[6]_INST_0_i_58_n_0\,
      O => \seg[6]_INST_0_i_22_n_0\
    );
\seg[6]_INST_0_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"18C3266318C6318C"
    )
        port map (
      I0 => \seg[6]_INST_0_i_58_n_0\,
      I1 => \seg[6]_INST_0_i_57_n_0\,
      I2 => \seg[6]_INST_0_i_56_n_0\,
      I3 => \seg[6]_INST_0_i_55_n_0\,
      I4 => \seg[6]_INST_0_i_54_n_0\,
      I5 => \seg[6]_INST_0_i_53_n_0\,
      O => \seg[6]_INST_0_i_23_n_0\
    );
\seg[6]_INST_0_i_24\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2104078421084210"
    )
        port map (
      I0 => \seg[6]_INST_0_i_58_n_0\,
      I1 => \seg[6]_INST_0_i_57_n_0\,
      I2 => \seg[6]_INST_0_i_56_n_0\,
      I3 => \seg[6]_INST_0_i_55_n_0\,
      I4 => \seg[6]_INST_0_i_54_n_0\,
      I5 => \seg[6]_INST_0_i_53_n_0\,
      O => \seg[6]_INST_0_i_24_n_0\
    );
\seg[6]_INST_0_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3E0807F83E0F83E0"
    )
        port map (
      I0 => \seg[6]_INST_0_i_58_n_0\,
      I1 => \seg[6]_INST_0_i_57_n_0\,
      I2 => \seg[6]_INST_0_i_56_n_0\,
      I3 => \seg[6]_INST_0_i_55_n_0\,
      I4 => \seg[6]_INST_0_i_54_n_0\,
      I5 => \seg[6]_INST_0_i_53_n_0\,
      O => \seg[6]_INST_0_i_25_n_0\
    );
\seg[6]_INST_0_i_26\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F3E830FE083F8E0"
    )
        port map (
      I0 => \seg[6]_INST_0_i_25_n_0\,
      I1 => \seg[6]_INST_0_i_44_n_0\,
      I2 => \seg[6]_INST_0_i_45_n_0\,
      I3 => \seg[6]_INST_0_i_46_n_0\,
      I4 => \seg[6]_INST_0_i_47_n_0\,
      I5 => \seg[6]_INST_0_i_48_n_0\,
      O => \seg[6]_INST_0_i_26_n_0\
    );
\seg[6]_INST_0_i_27\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C3493492"
    )
        port map (
      I0 => \seg[6]_INST_0_i_48_n_0\,
      I1 => \seg[6]_INST_0_i_47_n_0\,
      I2 => \seg[6]_INST_0_i_46_n_0\,
      I3 => \seg[6]_INST_0_i_45_n_0\,
      I4 => \seg[6]_INST_0_i_44_n_0\,
      O => \seg[6]_INST_0_i_27_n_0\
    );
\seg[6]_INST_0_i_28\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D864"
    )
        port map (
      I0 => hundreds_sel(0),
      I1 => hundreds_sel(1),
      I2 => hundreds_sel(2),
      I3 => hundreds_sel(3),
      O => \seg[6]_INST_0_i_28_n_0\
    );
\seg[6]_INST_0_i_29\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D724"
    )
        port map (
      I0 => hundreds_sel(3),
      I1 => hundreds_sel(2),
      I2 => hundreds_sel(1),
      I3 => hundreds_sel(0),
      O => \seg[6]_INST_0_i_29_n_0\
    );
\seg[6]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BEFE"
    )
        port map (
      I0 => tens_sel(3),
      I1 => tens_sel(1),
      I2 => tens_sel(2),
      I3 => tens_sel(0),
      O => tens_place(0)
    );
\seg[6]_INST_0_i_30\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"807F83E0"
    )
        port map (
      I0 => din(2),
      I1 => din(3),
      I2 => \seg[6]_INST_0_i_59_n_0\,
      I3 => \seg[6]_INST_0_i_60_n_0\,
      I4 => \seg[6]_INST_0_i_61_n_0\,
      O => \seg[6]_INST_0_i_30_n_0\
    );
\seg[6]_INST_0_i_31\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"11EA"
    )
        port map (
      I0 => \seg[6]_INST_0_i_52_n_0\,
      I1 => \seg[6]_INST_0_i_51_n_0\,
      I2 => \seg[6]_INST_0_i_50_n_0\,
      I3 => \seg[6]_INST_0_i_49_n_0\,
      O => \seg[6]_INST_0_i_31_n_0\
    );
\seg[6]_INST_0_i_32\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFE0"
    )
        port map (
      I0 => \seg[6]_INST_0_i_30_n_0\,
      I1 => \seg[6]_INST_0_i_31_n_0\,
      I2 => \seg[6]_INST_0_i_33_n_0\,
      I3 => \seg[6]_INST_0_i_62_n_0\,
      O => \seg[6]_INST_0_i_32_n_0\
    );
\seg[6]_INST_0_i_33\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"998C"
    )
        port map (
      I0 => \seg[6]_INST_0_i_49_n_0\,
      I1 => \seg[6]_INST_0_i_50_n_0\,
      I2 => \seg[6]_INST_0_i_51_n_0\,
      I3 => \seg[6]_INST_0_i_52_n_0\,
      O => \seg[6]_INST_0_i_33_n_0\
    );
\seg[6]_INST_0_i_34\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \seg[6]_INST_0_i_63_n_0\,
      I1 => din(2),
      O => \seg[6]_INST_0_i_34_n_0\
    );
\seg[6]_INST_0_i_35\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6966"
    )
        port map (
      I0 => \seg[6]_INST_0_i_64_n_0\,
      I1 => din(3),
      I2 => din(2),
      I3 => \seg[6]_INST_0_i_63_n_0\,
      O => \seg[6]_INST_0_i_35_n_0\
    );
\seg[6]_INST_0_i_36\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09FFF600"
    )
        port map (
      I0 => \seg[6]_INST_0_i_64_n_0\,
      I1 => din(3),
      I2 => din(2),
      I3 => \seg[6]_INST_0_i_63_n_0\,
      I4 => \seg[6]_INST_0_i_65_n_0\,
      O => \seg[6]_INST_0_i_36_n_0\
    );
\seg[6]_INST_0_i_37\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6099FFFFFFFF6660"
    )
        port map (
      I0 => \seg[6]_INST_0_i_64_n_0\,
      I1 => din(3),
      I2 => din(1),
      I3 => din(2),
      I4 => \seg[6]_INST_0_i_63_n_0\,
      I5 => \seg[6]_INST_0_i_65_n_0\,
      O => \seg[6]_INST_0_i_37_n_0\
    );
\seg[6]_INST_0_i_38\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1FE0FFFF1FE00000"
    )
        port map (
      I0 => \seg[6]_INST_0_i_34_n_0\,
      I1 => din(1),
      I2 => \seg[6]_INST_0_i_37_n_0\,
      I3 => \seg[6]_INST_0_i_35_n_0\,
      I4 => bcd,
      I5 => din(3),
      O => ones_sel(3)
    );
\seg[6]_INST_0_i_39\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B4FFB400"
    )
        port map (
      I0 => din(1),
      I1 => \seg[6]_INST_0_i_37_n_0\,
      I2 => \seg[6]_INST_0_i_34_n_0\,
      I3 => bcd,
      I4 => din(2),
      O => ones_sel(2)
    );
\seg[6]_INST_0_i_40\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1E10FFFF1E100000"
    )
        port map (
      I0 => \seg[6]_INST_0_i_21_n_0\,
      I1 => \seg[6]_INST_0_i_22_n_0\,
      I2 => \seg[6]_INST_0_i_23_n_0\,
      I3 => \seg[6]_INST_0_i_24_n_0\,
      I4 => bcd,
      I5 => din(11),
      O => hundreds_sel(3)
    );
\seg[6]_INST_0_i_41\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11EAFFFF11EA0000"
    )
        port map (
      I0 => \seg[6]_INST_0_i_24_n_0\,
      I1 => \seg[6]_INST_0_i_23_n_0\,
      I2 => \seg[6]_INST_0_i_22_n_0\,
      I3 => \seg[6]_INST_0_i_21_n_0\,
      I4 => bcd,
      I5 => din(9),
      O => hundreds_sel(1)
    );
\seg[6]_INST_0_i_42\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"998CFFFF998C0000"
    )
        port map (
      I0 => \seg[6]_INST_0_i_21_n_0\,
      I1 => \seg[6]_INST_0_i_22_n_0\,
      I2 => \seg[6]_INST_0_i_23_n_0\,
      I3 => \seg[6]_INST_0_i_24_n_0\,
      I4 => bcd,
      I5 => din(10),
      O => hundreds_sel(2)
    );
\seg[6]_INST_0_i_43\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1FE0FFFF1FE00000"
    )
        port map (
      I0 => \seg[6]_INST_0_i_30_n_0\,
      I1 => \seg[6]_INST_0_i_31_n_0\,
      I2 => \seg[6]_INST_0_i_33_n_0\,
      I3 => \seg[6]_INST_0_i_62_n_0\,
      I4 => bcd,
      I5 => din(8),
      O => hundreds_sel(0)
    );
\seg[6]_INST_0_i_44\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"807F83E0"
    )
        port map (
      I0 => \seg[6]_INST_0_i_57_n_0\,
      I1 => \seg[6]_INST_0_i_56_n_0\,
      I2 => \seg[6]_INST_0_i_55_n_0\,
      I3 => \seg[6]_INST_0_i_54_n_0\,
      I4 => \seg[6]_INST_0_i_53_n_0\,
      O => \seg[6]_INST_0_i_44_n_0\
    );
\seg[6]_INST_0_i_45\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F3E830FE083F8E0"
    )
        port map (
      I0 => \seg[6]_INST_0_i_56_n_0\,
      I1 => \seg[6]_INST_0_i_66_n_0\,
      I2 => \seg[6]_INST_0_i_67_n_0\,
      I3 => \seg[6]_INST_0_i_68_n_0\,
      I4 => \seg[6]_INST_0_i_69_n_0\,
      I5 => \seg[6]_INST_0_i_70_n_0\,
      O => \seg[6]_INST_0_i_45_n_0\
    );
\seg[6]_INST_0_i_46\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \seg[6]_INST_0_i_68_n_0\,
      I1 => \seg[6]_INST_0_i_69_n_0\,
      I2 => \seg[6]_INST_0_i_70_n_0\,
      O => \seg[6]_INST_0_i_46_n_0\
    );
\seg[6]_INST_0_i_47\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"38E30EF0"
    )
        port map (
      I0 => \seg[6]_INST_0_i_66_n_0\,
      I1 => \seg[6]_INST_0_i_67_n_0\,
      I2 => \seg[6]_INST_0_i_68_n_0\,
      I3 => \seg[6]_INST_0_i_69_n_0\,
      I4 => \seg[6]_INST_0_i_70_n_0\,
      O => \seg[6]_INST_0_i_47_n_0\
    );
\seg[6]_INST_0_i_48\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B20C"
    )
        port map (
      I0 => \seg[6]_INST_0_i_67_n_0\,
      I1 => \seg[6]_INST_0_i_68_n_0\,
      I2 => \seg[6]_INST_0_i_69_n_0\,
      I3 => \seg[6]_INST_0_i_70_n_0\,
      O => \seg[6]_INST_0_i_48_n_0\
    );
\seg[6]_INST_0_i_49\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1FE0"
    )
        port map (
      I0 => din(3),
      I1 => \seg[6]_INST_0_i_59_n_0\,
      I2 => \seg[6]_INST_0_i_60_n_0\,
      I3 => \seg[6]_INST_0_i_61_n_0\,
      O => \seg[6]_INST_0_i_49_n_0\
    );
\seg[6]_INST_0_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \seg[6]_INST_0_i_20_n_0\,
      I1 => bcd,
      I2 => din(15),
      O => thousands_sel(3)
    );
\seg[6]_INST_0_i_50\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EC111C0B03E4E234"
    )
        port map (
      I0 => \seg[6]_INST_0_i_71_n_0\,
      I1 => \seg[6]_INST_0_i_72_n_0\,
      I2 => \seg[6]_INST_0_i_73_n_0\,
      I3 => \seg[6]_INST_0_i_74_n_0\,
      I4 => \seg[6]_INST_0_i_75_n_0\,
      I5 => \seg[6]_INST_0_i_76_n_0\,
      O => \seg[6]_INST_0_i_50_n_0\
    );
\seg[6]_INST_0_i_51\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"18C3266318C6318C"
    )
        port map (
      I0 => \seg[6]_INST_0_i_76_n_0\,
      I1 => \seg[6]_INST_0_i_75_n_0\,
      I2 => \seg[6]_INST_0_i_74_n_0\,
      I3 => \seg[6]_INST_0_i_73_n_0\,
      I4 => \seg[6]_INST_0_i_72_n_0\,
      I5 => \seg[6]_INST_0_i_71_n_0\,
      O => \seg[6]_INST_0_i_51_n_0\
    );
\seg[6]_INST_0_i_52\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2104078421084210"
    )
        port map (
      I0 => \seg[6]_INST_0_i_76_n_0\,
      I1 => \seg[6]_INST_0_i_75_n_0\,
      I2 => \seg[6]_INST_0_i_74_n_0\,
      I3 => \seg[6]_INST_0_i_73_n_0\,
      I4 => \seg[6]_INST_0_i_72_n_0\,
      I5 => \seg[6]_INST_0_i_71_n_0\,
      O => \seg[6]_INST_0_i_52_n_0\
    );
\seg[6]_INST_0_i_53\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"24120180"
    )
        port map (
      I0 => \seg[6]_INST_0_i_66_n_0\,
      I1 => \seg[6]_INST_0_i_67_n_0\,
      I2 => \seg[6]_INST_0_i_68_n_0\,
      I3 => \seg[6]_INST_0_i_69_n_0\,
      I4 => \seg[6]_INST_0_i_70_n_0\,
      O => \seg[6]_INST_0_i_53_n_0\
    );
\seg[6]_INST_0_i_54\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1381C86C"
    )
        port map (
      I0 => \seg[6]_INST_0_i_66_n_0\,
      I1 => \seg[6]_INST_0_i_67_n_0\,
      I2 => \seg[6]_INST_0_i_68_n_0\,
      I3 => \seg[6]_INST_0_i_69_n_0\,
      I4 => \seg[6]_INST_0_i_70_n_0\,
      O => \seg[6]_INST_0_i_54_n_0\
    );
\seg[6]_INST_0_i_55\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C3493492"
    )
        port map (
      I0 => \seg[6]_INST_0_i_70_n_0\,
      I1 => \seg[6]_INST_0_i_69_n_0\,
      I2 => \seg[6]_INST_0_i_68_n_0\,
      I3 => \seg[6]_INST_0_i_67_n_0\,
      I4 => \seg[6]_INST_0_i_66_n_0\,
      O => \seg[6]_INST_0_i_55_n_0\
    );
\seg[6]_INST_0_i_56\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1FE0"
    )
        port map (
      I0 => \seg[6]_INST_0_i_74_n_0\,
      I1 => \seg[6]_INST_0_i_73_n_0\,
      I2 => \seg[6]_INST_0_i_72_n_0\,
      I3 => \seg[6]_INST_0_i_71_n_0\,
      O => \seg[6]_INST_0_i_56_n_0\
    );
\seg[6]_INST_0_i_57\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"807F83E0"
    )
        port map (
      I0 => \seg[6]_INST_0_i_75_n_0\,
      I1 => \seg[6]_INST_0_i_74_n_0\,
      I2 => \seg[6]_INST_0_i_73_n_0\,
      I3 => \seg[6]_INST_0_i_72_n_0\,
      I4 => \seg[6]_INST_0_i_71_n_0\,
      O => \seg[6]_INST_0_i_57_n_0\
    );
\seg[6]_INST_0_i_58\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3E0807F83E0F83E0"
    )
        port map (
      I0 => \seg[6]_INST_0_i_76_n_0\,
      I1 => \seg[6]_INST_0_i_75_n_0\,
      I2 => \seg[6]_INST_0_i_74_n_0\,
      I3 => \seg[6]_INST_0_i_73_n_0\,
      I4 => \seg[6]_INST_0_i_72_n_0\,
      I5 => \seg[6]_INST_0_i_71_n_0\,
      O => \seg[6]_INST_0_i_58_n_0\
    );
\seg[6]_INST_0_i_59\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EC111C0B03E4E234"
    )
        port map (
      I0 => \seg[6]_INST_0_i_77_n_0\,
      I1 => \seg[6]_INST_0_i_78_n_0\,
      I2 => \seg[6]_INST_0_i_79_n_0\,
      I3 => din(6),
      I4 => din(5),
      I5 => din(4),
      O => \seg[6]_INST_0_i_59_n_0\
    );
\seg[6]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1FE0FFFF1FE00000"
    )
        port map (
      I0 => \seg[6]_INST_0_i_21_n_0\,
      I1 => \seg[6]_INST_0_i_22_n_0\,
      I2 => \seg[6]_INST_0_i_23_n_0\,
      I3 => \seg[6]_INST_0_i_24_n_0\,
      I4 => bcd,
      I5 => din(12),
      O => thousands_sel(0)
    );
\seg[6]_INST_0_i_60\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"18C3266318C6318C"
    )
        port map (
      I0 => din(4),
      I1 => din(5),
      I2 => din(6),
      I3 => \seg[6]_INST_0_i_79_n_0\,
      I4 => \seg[6]_INST_0_i_78_n_0\,
      I5 => \seg[6]_INST_0_i_77_n_0\,
      O => \seg[6]_INST_0_i_60_n_0\
    );
\seg[6]_INST_0_i_61\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2104078421084210"
    )
        port map (
      I0 => din(4),
      I1 => din(5),
      I2 => din(6),
      I3 => \seg[6]_INST_0_i_79_n_0\,
      I4 => \seg[6]_INST_0_i_78_n_0\,
      I5 => \seg[6]_INST_0_i_77_n_0\,
      O => \seg[6]_INST_0_i_61_n_0\
    );
\seg[6]_INST_0_i_62\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1E10"
    )
        port map (
      I0 => \seg[6]_INST_0_i_49_n_0\,
      I1 => \seg[6]_INST_0_i_50_n_0\,
      I2 => \seg[6]_INST_0_i_51_n_0\,
      I3 => \seg[6]_INST_0_i_52_n_0\,
      O => \seg[6]_INST_0_i_62_n_0\
    );
\seg[6]_INST_0_i_63\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"83FF83E0"
    )
        port map (
      I0 => din(2),
      I1 => din(3),
      I2 => \seg[6]_INST_0_i_59_n_0\,
      I3 => \seg[6]_INST_0_i_60_n_0\,
      I4 => \seg[6]_INST_0_i_61_n_0\,
      O => \seg[6]_INST_0_i_63_n_0\
    );
\seg[6]_INST_0_i_64\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFE0"
    )
        port map (
      I0 => din(3),
      I1 => \seg[6]_INST_0_i_59_n_0\,
      I2 => \seg[6]_INST_0_i_60_n_0\,
      I3 => \seg[6]_INST_0_i_61_n_0\,
      O => \seg[6]_INST_0_i_64_n_0\
    );
\seg[6]_INST_0_i_65\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B4"
    )
        port map (
      I0 => din(3),
      I1 => \seg[6]_INST_0_i_64_n_0\,
      I2 => \seg[6]_INST_0_i_59_n_0\,
      O => \seg[6]_INST_0_i_65_n_0\
    );
\seg[6]_INST_0_i_66\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3E0807F83E0F83E0"
    )
        port map (
      I0 => \seg[6]_INST_0_i_80_n_0\,
      I1 => \seg[6]_INST_0_i_81_n_0\,
      I2 => \seg[6]_INST_0_i_82_n_0\,
      I3 => \seg[6]_INST_0_i_83_n_0\,
      I4 => \seg[6]_INST_0_i_84_n_0\,
      I5 => \seg[6]_INST_0_i_85_n_0\,
      O => \seg[6]_INST_0_i_66_n_0\
    );
\seg[6]_INST_0_i_67\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"807F83E0"
    )
        port map (
      I0 => \seg[6]_INST_0_i_81_n_0\,
      I1 => \seg[6]_INST_0_i_82_n_0\,
      I2 => \seg[6]_INST_0_i_83_n_0\,
      I3 => \seg[6]_INST_0_i_84_n_0\,
      I4 => \seg[6]_INST_0_i_85_n_0\,
      O => \seg[6]_INST_0_i_67_n_0\
    );
\seg[6]_INST_0_i_68\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0E00000"
    )
        port map (
      I0 => din(11),
      I1 => din(12),
      I2 => din(15),
      I3 => din(13),
      I4 => din(14),
      O => \seg[6]_INST_0_i_68_n_0\
    );
\seg[6]_INST_0_i_69\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1FE0"
    )
        port map (
      I0 => \seg[6]_INST_0_i_82_n_0\,
      I1 => \seg[6]_INST_0_i_83_n_0\,
      I2 => \seg[6]_INST_0_i_84_n_0\,
      I3 => \seg[6]_INST_0_i_85_n_0\,
      O => \seg[6]_INST_0_i_69_n_0\
    );
\seg[6]_INST_0_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B4FFB400"
    )
        port map (
      I0 => \seg[6]_INST_0_i_25_n_0\,
      I1 => \seg[6]_INST_0_i_26_n_0\,
      I2 => \seg[6]_INST_0_i_27_n_0\,
      I3 => bcd,
      I4 => din(14),
      O => thousands_sel(2)
    );
\seg[6]_INST_0_i_70\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FE0300FF00FF00"
    )
        port map (
      I0 => din(10),
      I1 => din(11),
      I2 => din(12),
      I3 => din(15),
      I4 => din(13),
      I5 => din(14),
      O => \seg[6]_INST_0_i_70_n_0\
    );
\seg[6]_INST_0_i_71\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2104078421084210"
    )
        port map (
      I0 => \seg[6]_INST_0_i_80_n_0\,
      I1 => \seg[6]_INST_0_i_81_n_0\,
      I2 => \seg[6]_INST_0_i_82_n_0\,
      I3 => \seg[6]_INST_0_i_83_n_0\,
      I4 => \seg[6]_INST_0_i_84_n_0\,
      I5 => \seg[6]_INST_0_i_85_n_0\,
      O => \seg[6]_INST_0_i_71_n_0\
    );
\seg[6]_INST_0_i_72\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"18C3266318C6318C"
    )
        port map (
      I0 => \seg[6]_INST_0_i_80_n_0\,
      I1 => \seg[6]_INST_0_i_81_n_0\,
      I2 => \seg[6]_INST_0_i_82_n_0\,
      I3 => \seg[6]_INST_0_i_83_n_0\,
      I4 => \seg[6]_INST_0_i_84_n_0\,
      I5 => \seg[6]_INST_0_i_85_n_0\,
      O => \seg[6]_INST_0_i_72_n_0\
    );
\seg[6]_INST_0_i_73\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EC111C0B03E4E234"
    )
        port map (
      I0 => \seg[6]_INST_0_i_85_n_0\,
      I1 => \seg[6]_INST_0_i_84_n_0\,
      I2 => \seg[6]_INST_0_i_83_n_0\,
      I3 => \seg[6]_INST_0_i_82_n_0\,
      I4 => \seg[6]_INST_0_i_81_n_0\,
      I5 => \seg[6]_INST_0_i_80_n_0\,
      O => \seg[6]_INST_0_i_73_n_0\
    );
\seg[6]_INST_0_i_74\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1FE0"
    )
        port map (
      I0 => din(6),
      I1 => \seg[6]_INST_0_i_79_n_0\,
      I2 => \seg[6]_INST_0_i_78_n_0\,
      I3 => \seg[6]_INST_0_i_77_n_0\,
      O => \seg[6]_INST_0_i_74_n_0\
    );
\seg[6]_INST_0_i_75\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"807F83E0"
    )
        port map (
      I0 => din(5),
      I1 => din(6),
      I2 => \seg[6]_INST_0_i_79_n_0\,
      I3 => \seg[6]_INST_0_i_78_n_0\,
      I4 => \seg[6]_INST_0_i_77_n_0\,
      O => \seg[6]_INST_0_i_75_n_0\
    );
\seg[6]_INST_0_i_76\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3E0807F83E0F83E0"
    )
        port map (
      I0 => din(4),
      I1 => din(5),
      I2 => din(6),
      I3 => \seg[6]_INST_0_i_79_n_0\,
      I4 => \seg[6]_INST_0_i_78_n_0\,
      I5 => \seg[6]_INST_0_i_77_n_0\,
      O => \seg[6]_INST_0_i_76_n_0\
    );
\seg[6]_INST_0_i_77\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2104078421084210"
    )
        port map (
      I0 => din(7),
      I1 => din(8),
      I2 => din(9),
      I3 => \seg[6]_INST_0_i_86_n_0\,
      I4 => \seg[6]_INST_0_i_87_n_0\,
      I5 => \seg[6]_INST_0_i_88_n_0\,
      O => \seg[6]_INST_0_i_77_n_0\
    );
\seg[6]_INST_0_i_78\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"18C3266318C6318C"
    )
        port map (
      I0 => din(7),
      I1 => din(8),
      I2 => din(9),
      I3 => \seg[6]_INST_0_i_86_n_0\,
      I4 => \seg[6]_INST_0_i_87_n_0\,
      I5 => \seg[6]_INST_0_i_88_n_0\,
      O => \seg[6]_INST_0_i_78_n_0\
    );
\seg[6]_INST_0_i_79\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EC111C0B03E4E234"
    )
        port map (
      I0 => \seg[6]_INST_0_i_88_n_0\,
      I1 => \seg[6]_INST_0_i_87_n_0\,
      I2 => \seg[6]_INST_0_i_86_n_0\,
      I3 => din(9),
      I4 => din(8),
      I5 => din(7),
      O => \seg[6]_INST_0_i_79_n_0\
    );
\seg[6]_INST_0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6F60"
    )
        port map (
      I0 => \seg[6]_INST_0_i_26_n_0\,
      I1 => \seg[6]_INST_0_i_25_n_0\,
      I2 => bcd,
      I3 => din(13),
      O => thousands_sel(1)
    );
\seg[6]_INST_0_i_80\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3E0807F83E0F83E0"
    )
        port map (
      I0 => din(7),
      I1 => din(8),
      I2 => din(9),
      I3 => \seg[6]_INST_0_i_86_n_0\,
      I4 => \seg[6]_INST_0_i_87_n_0\,
      I5 => \seg[6]_INST_0_i_88_n_0\,
      O => \seg[6]_INST_0_i_80_n_0\
    );
\seg[6]_INST_0_i_81\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"807F83E0"
    )
        port map (
      I0 => din(8),
      I1 => din(9),
      I2 => \seg[6]_INST_0_i_86_n_0\,
      I3 => \seg[6]_INST_0_i_87_n_0\,
      I4 => \seg[6]_INST_0_i_88_n_0\,
      O => \seg[6]_INST_0_i_81_n_0\
    );
\seg[6]_INST_0_i_82\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1FE0"
    )
        port map (
      I0 => din(9),
      I1 => \seg[6]_INST_0_i_86_n_0\,
      I2 => \seg[6]_INST_0_i_87_n_0\,
      I3 => \seg[6]_INST_0_i_88_n_0\,
      O => \seg[6]_INST_0_i_82_n_0\
    );
\seg[6]_INST_0_i_83\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2DC201D609D240D6"
    )
        port map (
      I0 => din(14),
      I1 => din(13),
      I2 => din(15),
      I3 => din(12),
      I4 => din(11),
      I5 => din(10),
      O => \seg[6]_INST_0_i_83_n_0\
    );
\seg[6]_INST_0_i_84\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F000000F1FFCF800"
    )
        port map (
      I0 => din(10),
      I1 => din(11),
      I2 => din(12),
      I3 => din(15),
      I4 => din(13),
      I5 => din(14),
      O => \seg[6]_INST_0_i_84_n_0\
    );
\seg[6]_INST_0_i_85\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000103F0E0000000"
    )
        port map (
      I0 => din(10),
      I1 => din(11),
      I2 => din(12),
      I3 => din(15),
      I4 => din(13),
      I5 => din(14),
      O => \seg[6]_INST_0_i_85_n_0\
    );
\seg[6]_INST_0_i_86\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A65A651518A18A6"
    )
        port map (
      I0 => din(14),
      I1 => din(13),
      I2 => din(15),
      I3 => din(12),
      I4 => din(11),
      I5 => din(10),
      O => \seg[6]_INST_0_i_86_n_0\
    );
\seg[6]_INST_0_i_87\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C61831C68C31638C"
    )
        port map (
      I0 => din(10),
      I1 => din(11),
      I2 => din(12),
      I3 => din(15),
      I4 => din(13),
      I5 => din(14),
      O => \seg[6]_INST_0_i_87_n_0\
    );
\seg[6]_INST_0_i_88\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0821420810428410"
    )
        port map (
      I0 => din(10),
      I1 => din(11),
      I2 => din(12),
      I3 => din(15),
      I4 => din(13),
      I5 => din(14),
      O => \seg[6]_INST_0_i_88_n_0\
    );
\seg[6]_INST_0_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => tens_sel(3),
      I1 => tens_sel(1),
      I2 => tens_sel(2),
      I3 => tens_sel(0),
      O => \seg[6]_INST_0_i_9_n_0\
    );
end STRUCTURE;

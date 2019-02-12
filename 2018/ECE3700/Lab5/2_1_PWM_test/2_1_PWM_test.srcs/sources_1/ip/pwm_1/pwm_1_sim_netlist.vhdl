-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
-- Date        : Thu Mar 15 12:18:05 2018
-- Host        : DESKTOP-PM6UVGK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/XilinxWorking/Lab5/2_1_PWM_test/2_1_PWM_test.srcs/sources_1/ip/pwm_1/pwm_1_sim_netlist.vhdl
-- Design      : pwm_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_1_pwm is
  port (
    clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sout : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of pwm_1_pwm : entity is "pwm";
end pwm_1_pwm;

architecture STRUCTURE of pwm_1_pwm is
  signal \count[7]_i_2_n_0\ : STD_LOGIC;
  signal \count_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_in : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal sout_i_10_n_0 : STD_LOGIC;
  signal sout_i_1_n_0 : STD_LOGIC;
  signal sout_i_3_n_0 : STD_LOGIC;
  signal sout_i_4_n_0 : STD_LOGIC;
  signal sout_i_5_n_0 : STD_LOGIC;
  signal sout_i_6_n_0 : STD_LOGIC;
  signal sout_i_7_n_0 : STD_LOGIC;
  signal sout_i_8_n_0 : STD_LOGIC;
  signal sout_i_9_n_0 : STD_LOGIC;
  signal sout_reg_i_2_n_1 : STD_LOGIC;
  signal sout_reg_i_2_n_2 : STD_LOGIC;
  signal sout_reg_i_2_n_3 : STD_LOGIC;
  signal NLW_sout_reg_i_2_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count[7]_i_2\ : label is "soft_lutpair1";
begin
\count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \count_reg__0\(0),
      O => \p_0_in__0\(0)
    );
\count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \count_reg__0\(0),
      I1 => \count_reg__0\(1),
      O => \p_0_in__0\(1)
    );
\count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \count_reg__0\(0),
      I1 => \count_reg__0\(1),
      I2 => \count_reg__0\(2),
      O => \p_0_in__0\(2)
    );
\count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \count_reg__0\(3),
      I1 => \count_reg__0\(0),
      I2 => \count_reg__0\(1),
      I3 => \count_reg__0\(2),
      O => \p_0_in__0\(3)
    );
\count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \count_reg__0\(4),
      I1 => \count_reg__0\(2),
      I2 => \count_reg__0\(1),
      I3 => \count_reg__0\(0),
      I4 => \count_reg__0\(3),
      O => \p_0_in__0\(4)
    );
\count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \count_reg__0\(5),
      I1 => \count_reg__0\(3),
      I2 => \count_reg__0\(0),
      I3 => \count_reg__0\(1),
      I4 => \count_reg__0\(2),
      I5 => \count_reg__0\(4),
      O => \p_0_in__0\(5)
    );
\count[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \count_reg__0\(6),
      I1 => \count_reg__0\(4),
      I2 => \count[7]_i_2_n_0\,
      I3 => \count_reg__0\(3),
      I4 => \count_reg__0\(5),
      O => \p_0_in__0\(6)
    );
\count[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \count_reg__0\(7),
      I1 => \count_reg__0\(5),
      I2 => \count_reg__0\(3),
      I3 => \count[7]_i_2_n_0\,
      I4 => \count_reg__0\(4),
      I5 => \count_reg__0\(6),
      O => \p_0_in__0\(7)
    );
\count[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \count_reg__0\(2),
      I1 => \count_reg__0\(1),
      I2 => \count_reg__0\(0),
      O => \count[7]_i_2_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(0),
      Q => \count_reg__0\(0),
      R => '0'
    );
\count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(1),
      Q => \count_reg__0\(1),
      R => '0'
    );
\count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(2),
      Q => \count_reg__0\(2),
      R => '0'
    );
\count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(3),
      Q => \count_reg__0\(3),
      R => '0'
    );
\count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(4),
      Q => \count_reg__0\(4),
      R => '0'
    );
\count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(5),
      Q => \count_reg__0\(5),
      R => '0'
    );
\count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(6),
      Q => \count_reg__0\(6),
      R => '0'
    );
\count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(7),
      Q => \count_reg__0\(7),
      R => '0'
    );
sout_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_0_in,
      O => sout_i_1_n_0
    );
sout_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => din(1),
      I1 => \count_reg__0\(1),
      I2 => din(0),
      I3 => \count_reg__0\(0),
      O => sout_i_10_n_0
    );
sout_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \count_reg__0\(7),
      I1 => din(7),
      I2 => \count_reg__0\(6),
      I3 => din(6),
      O => sout_i_3_n_0
    );
sout_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \count_reg__0\(5),
      I1 => din(5),
      I2 => \count_reg__0\(4),
      I3 => din(4),
      O => sout_i_4_n_0
    );
sout_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \count_reg__0\(3),
      I1 => din(3),
      I2 => \count_reg__0\(2),
      I3 => din(2),
      O => sout_i_5_n_0
    );
sout_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \count_reg__0\(1),
      I1 => din(1),
      I2 => \count_reg__0\(0),
      I3 => din(0),
      O => sout_i_6_n_0
    );
sout_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => din(7),
      I1 => \count_reg__0\(7),
      I2 => din(6),
      I3 => \count_reg__0\(6),
      O => sout_i_7_n_0
    );
sout_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => din(5),
      I1 => \count_reg__0\(5),
      I2 => din(4),
      I3 => \count_reg__0\(4),
      O => sout_i_8_n_0
    );
sout_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => din(3),
      I1 => \count_reg__0\(3),
      I2 => din(2),
      I3 => \count_reg__0\(2),
      O => sout_i_9_n_0
    );
sout_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => sout_i_1_n_0,
      Q => sout,
      R => '0'
    );
sout_reg_i_2: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_in,
      CO(2) => sout_reg_i_2_n_1,
      CO(1) => sout_reg_i_2_n_2,
      CO(0) => sout_reg_i_2_n_3,
      CYINIT => '0',
      DI(3) => sout_i_3_n_0,
      DI(2) => sout_i_4_n_0,
      DI(1) => sout_i_5_n_0,
      DI(0) => sout_i_6_n_0,
      O(3 downto 0) => NLW_sout_reg_i_2_O_UNCONNECTED(3 downto 0),
      S(3) => sout_i_7_n_0,
      S(2) => sout_i_8_n_0,
      S(1) => sout_i_9_n_0,
      S(0) => sout_i_10_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_1 is
  port (
    clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sout : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_1 : entity is "pwm_1,pwm,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of pwm_1 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of pwm_1 : entity is "pwm,Vivado 2015.4";
end pwm_1;

architecture STRUCTURE of pwm_1 is
begin
inst: entity work.pwm_1_pwm
     port map (
      clk => clk,
      din(7 downto 0) => din(7 downto 0),
      sout => sout
    );
end STRUCTURE;

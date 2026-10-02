-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Oct  1 17:29:38 2026
-- Host        : Q running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ exp2_clk_mgnmnt_0_0_sim_netlist.vhdl
-- Design      : exp2_clk_mgnmnt_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clk_mgnmnt is
  port (
    clk_div : out STD_LOGIC;
    sw : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clk : in STD_LOGIC;
    rst : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clk_mgnmnt;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clk_mgnmnt is
  signal N : STD_LOGIC_VECTOR ( 9 downto 4 );
  signal \N[3]_i_1_n_0\ : STD_LOGIC;
  signal \N_reg_n_0_[3]\ : STD_LOGIC;
  signal \N_reg_n_0_[4]\ : STD_LOGIC;
  signal \N_reg_n_0_[6]\ : STD_LOGIC;
  signal \N_reg_n_0_[7]\ : STD_LOGIC;
  signal \N_reg_n_0_[9]\ : STD_LOGIC;
  signal \^clk_div\ : STD_LOGIC;
  signal clk_div_i_1_n_0 : STD_LOGIC;
  signal \count1_carry__0_n_3\ : STD_LOGIC;
  signal \count1_carry_i_1__0_n_0\ : STD_LOGIC;
  signal count1_carry_i_1_n_0 : STD_LOGIC;
  signal \count1_carry_i_2__0_n_0\ : STD_LOGIC;
  signal count1_carry_i_2_n_0 : STD_LOGIC;
  signal count1_carry_i_3_n_0 : STD_LOGIC;
  signal count1_carry_i_4_n_0 : STD_LOGIC;
  signal count1_carry_i_5_n_0 : STD_LOGIC;
  signal count1_carry_i_6_n_0 : STD_LOGIC;
  signal count1_carry_i_7_n_0 : STD_LOGIC;
  signal count1_carry_i_8_n_0 : STD_LOGIC;
  signal count1_carry_n_0 : STD_LOGIC;
  signal count1_carry_n_1 : STD_LOGIC;
  signal count1_carry_n_2 : STD_LOGIC;
  signal count1_carry_n_3 : STD_LOGIC;
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1_n_0\ : STD_LOGIC;
  signal \count[2]_i_1_n_0\ : STD_LOGIC;
  signal \count[3]_i_1_n_0\ : STD_LOGIC;
  signal \count[4]_i_1_n_0\ : STD_LOGIC;
  signal \count[5]_i_1_n_0\ : STD_LOGIC;
  signal \count[5]_i_2_n_0\ : STD_LOGIC;
  signal \count[6]_i_1_n_0\ : STD_LOGIC;
  signal \count[7]_i_1_n_0\ : STD_LOGIC;
  signal \count[8]_i_1_n_0\ : STD_LOGIC;
  signal \count[9]_i_1_n_0\ : STD_LOGIC;
  signal \count[9]_i_2_n_0\ : STD_LOGIC;
  signal count_reg : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_count1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_count1_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_count1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \N[3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \N[6]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \N[7]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \N[9]_i_1\ : label is "soft_lutpair5";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of count1_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \count1_carry__0\ : label is 11;
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count[5]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \count[6]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \count[7]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count[8]_i_1\ : label is "soft_lutpair0";
begin
  clk_div <= \^clk_div\;
\N[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => sw(0),
      I1 => sw(1),
      O => \N[3]_i_1_n_0\
    );
\N[4]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sw(1),
      O => N(4)
    );
\N[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => sw(1),
      I1 => sw(0),
      O => N(6)
    );
\N[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => sw(0),
      I1 => sw(1),
      O => N(7)
    );
\N[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sw(1),
      I1 => sw(0),
      O => N(9)
    );
\N_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \N[3]_i_1_n_0\,
      Q => \N_reg_n_0_[3]\,
      R => '0'
    );
\N_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => N(4),
      Q => \N_reg_n_0_[4]\,
      R => '0'
    );
\N_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => N(6),
      Q => \N_reg_n_0_[6]\,
      R => '0'
    );
\N_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => N(7),
      Q => \N_reg_n_0_[7]\,
      R => '0'
    );
\N_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => N(9),
      Q => \N_reg_n_0_[9]\,
      R => '0'
    );
clk_div_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B4"
    )
        port map (
      I0 => rst,
      I1 => \count1_carry__0_n_3\,
      I2 => \^clk_div\,
      O => clk_div_i_1_n_0
    );
clk_div_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => clk_div_i_1_n_0,
      Q => \^clk_div\
    );
count1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => count1_carry_n_0,
      CO(2) => count1_carry_n_1,
      CO(1) => count1_carry_n_2,
      CO(0) => count1_carry_n_3,
      CYINIT => '1',
      DI(3) => count1_carry_i_1_n_0,
      DI(2) => count1_carry_i_2_n_0,
      DI(1) => count1_carry_i_3_n_0,
      DI(0) => count1_carry_i_4_n_0,
      O(3 downto 0) => NLW_count1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => count1_carry_i_5_n_0,
      S(2) => count1_carry_i_6_n_0,
      S(1) => count1_carry_i_7_n_0,
      S(0) => count1_carry_i_8_n_0
    );
\count1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => count1_carry_n_0,
      CO(3 downto 1) => \NLW_count1_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \count1_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \count1_carry_i_1__0_n_0\,
      O(3 downto 0) => \NLW_count1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => B"000",
      S(0) => \count1_carry_i_2__0_n_0\
    );
count1_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => count_reg(6),
      I1 => \N_reg_n_0_[6]\,
      I2 => \N_reg_n_0_[7]\,
      I3 => count_reg(7),
      O => count1_carry_i_1_n_0
    );
\count1_carry_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count_reg(9),
      I1 => \N_reg_n_0_[9]\,
      O => \count1_carry_i_1__0_n_0\
    );
count1_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => count_reg(4),
      I1 => \N_reg_n_0_[4]\,
      I2 => \N_reg_n_0_[6]\,
      I3 => count_reg(5),
      O => count1_carry_i_2_n_0
    );
\count1_carry_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"82"
    )
        port map (
      I0 => count_reg(8),
      I1 => count_reg(9),
      I2 => \N_reg_n_0_[9]\,
      O => \count1_carry_i_2__0_n_0\
    );
count1_carry_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => count_reg(2),
      I1 => \N_reg_n_0_[3]\,
      I2 => count_reg(3),
      O => count1_carry_i_3_n_0
    );
count1_carry_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => count_reg(0),
      I1 => \N_reg_n_0_[7]\,
      I2 => count_reg(1),
      O => count1_carry_i_4_n_0
    );
count1_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => count_reg(6),
      I1 => \N_reg_n_0_[6]\,
      I2 => count_reg(7),
      I3 => \N_reg_n_0_[7]\,
      O => count1_carry_i_5_n_0
    );
count1_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => count_reg(4),
      I1 => \N_reg_n_0_[4]\,
      I2 => count_reg(5),
      I3 => \N_reg_n_0_[6]\,
      O => count1_carry_i_6_n_0
    );
count1_carry_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"09"
    )
        port map (
      I0 => count_reg(3),
      I1 => \N_reg_n_0_[3]\,
      I2 => count_reg(2),
      O => count1_carry_i_7_n_0
    );
count1_carry_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"09"
    )
        port map (
      I0 => count_reg(1),
      I1 => \N_reg_n_0_[7]\,
      I2 => count_reg(0),
      O => count1_carry_i_8_n_0
    );
\count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_reg(0),
      I1 => \count1_carry__0_n_3\,
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => count_reg(1),
      I1 => count_reg(0),
      I2 => \count1_carry__0_n_3\,
      O => \count[1]_i_1_n_0\
    );
\count[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"006A"
    )
        port map (
      I0 => count_reg(2),
      I1 => count_reg(1),
      I2 => count_reg(0),
      I3 => \count1_carry__0_n_3\,
      O => \count[2]_i_1_n_0\
    );
\count[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00006AAA"
    )
        port map (
      I0 => count_reg(3),
      I1 => count_reg(2),
      I2 => count_reg(0),
      I3 => count_reg(1),
      I4 => \count1_carry__0_n_3\,
      O => \count[3]_i_1_n_0\
    );
\count[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000006AAAAAAA"
    )
        port map (
      I0 => count_reg(4),
      I1 => count_reg(3),
      I2 => count_reg(1),
      I3 => count_reg(0),
      I4 => count_reg(2),
      I5 => \count1_carry__0_n_3\,
      O => \count[4]_i_1_n_0\
    );
\count[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => count_reg(5),
      I1 => \count[5]_i_2_n_0\,
      I2 => \count1_carry__0_n_3\,
      O => \count[5]_i_1_n_0\
    );
\count[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => count_reg(4),
      I1 => count_reg(2),
      I2 => count_reg(0),
      I3 => count_reg(1),
      I4 => count_reg(3),
      O => \count[5]_i_2_n_0\
    );
\count[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => count_reg(6),
      I1 => \count[9]_i_2_n_0\,
      I2 => \count1_carry__0_n_3\,
      O => \count[6]_i_1_n_0\
    );
\count[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"006A"
    )
        port map (
      I0 => count_reg(7),
      I1 => count_reg(6),
      I2 => \count[9]_i_2_n_0\,
      I3 => \count1_carry__0_n_3\,
      O => \count[7]_i_1_n_0\
    );
\count[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00006AAA"
    )
        port map (
      I0 => count_reg(8),
      I1 => count_reg(7),
      I2 => \count[9]_i_2_n_0\,
      I3 => count_reg(6),
      I4 => \count1_carry__0_n_3\,
      O => \count[8]_i_1_n_0\
    );
\count[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000006AAAAAAA"
    )
        port map (
      I0 => count_reg(9),
      I1 => count_reg(8),
      I2 => count_reg(6),
      I3 => \count[9]_i_2_n_0\,
      I4 => count_reg(7),
      I5 => \count1_carry__0_n_3\,
      O => \count[9]_i_1_n_0\
    );
\count[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => count_reg(5),
      I1 => count_reg(3),
      I2 => count_reg(1),
      I3 => count_reg(0),
      I4 => count_reg(2),
      I5 => count_reg(4),
      O => \count[9]_i_2_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \count[0]_i_1_n_0\,
      Q => count_reg(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \count[1]_i_1_n_0\,
      Q => count_reg(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \count[2]_i_1_n_0\,
      Q => count_reg(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \count[3]_i_1_n_0\,
      Q => count_reg(3)
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \count[4]_i_1_n_0\,
      Q => count_reg(4)
    );
\count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \count[5]_i_1_n_0\,
      Q => count_reg(5)
    );
\count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \count[6]_i_1_n_0\,
      Q => count_reg(6)
    );
\count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \count[7]_i_1_n_0\,
      Q => count_reg(7)
    );
\count_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \count[8]_i_1_n_0\,
      Q => count_reg(8)
    );
\count_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \count[9]_i_1_n_0\,
      Q => count_reg(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    sw : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clk_div : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "exp2_clk_mgnmnt_0_0,clk_mgnmnt,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "clk_mgnmnt,Vivado 2020.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clk_mgnmnt
     port map (
      clk => clk,
      clk_div => clk_div,
      rst => rst,
      sw(1 downto 0) => sw(1 downto 0)
    );
end STRUCTURE;

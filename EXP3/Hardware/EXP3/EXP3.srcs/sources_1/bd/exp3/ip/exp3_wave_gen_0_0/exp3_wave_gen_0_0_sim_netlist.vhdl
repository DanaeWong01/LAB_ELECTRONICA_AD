-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Sun Nov  1 15:57:29 2026
-- Host        : Q running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/LAB_ELECTRONICA_AD/EXP3/Hardware/EXP3/EXP3.srcs/sources_1/bd/exp3/ip/exp3_wave_gen_0_0/exp3_wave_gen_0_0_sim_netlist.vhdl
-- Design      : exp3_wave_gen_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity exp3_wave_gen_0_0_wave_gen is
  port (
    wave : out STD_LOGIC_VECTOR ( 7 downto 0 );
    value : in STD_LOGIC_VECTOR ( 6 downto 0 );
    semi_pos : in STD_LOGIC;
    rst : in STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of exp3_wave_gen_0_0_wave_gen : entity is "wave_gen";
end exp3_wave_gen_0_0_wave_gen;

architecture STRUCTURE of exp3_wave_gen_0_0_wave_gen is
  signal p_0_in : STD_LOGIC_VECTOR ( 6 downto 1 );
  signal \wave[7]_i_1_n_0\ : STD_LOGIC;
  signal \wave[7]_i_2_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \wave[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wave[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wave[5]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \wave[6]_i_1\ : label is "soft_lutpair1";
begin
\wave[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C6"
    )
        port map (
      I0 => value(0),
      I1 => value(1),
      I2 => semi_pos,
      O => p_0_in(1)
    );
\wave[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F01E"
    )
        port map (
      I0 => value(0),
      I1 => value(1),
      I2 => value(2),
      I3 => semi_pos,
      O => p_0_in(2)
    );
\wave[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF0001FE"
    )
        port map (
      I0 => value(1),
      I1 => value(0),
      I2 => value(2),
      I3 => value(3),
      I4 => semi_pos,
      O => p_0_in(3)
    );
\wave[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF00000001FFFE"
    )
        port map (
      I0 => value(2),
      I1 => value(0),
      I2 => value(1),
      I3 => value(3),
      I4 => value(4),
      I5 => semi_pos,
      O => p_0_in(4)
    );
\wave[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \wave[7]_i_2_n_0\,
      I1 => value(5),
      I2 => semi_pos,
      O => p_0_in(5)
    );
\wave[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"782D"
    )
        port map (
      I0 => \wave[7]_i_2_n_0\,
      I1 => value(5),
      I2 => value(6),
      I3 => semi_pos,
      O => p_0_in(6)
    );
\wave[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F04"
    )
        port map (
      I0 => value(5),
      I1 => \wave[7]_i_2_n_0\,
      I2 => value(6),
      I3 => semi_pos,
      O => \wave[7]_i_1_n_0\
    );
\wave[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => value(4),
      I1 => value(2),
      I2 => value(0),
      I3 => semi_pos,
      I4 => value(1),
      I5 => value(3),
      O => \wave[7]_i_2_n_0\
    );
\wave_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => value(0),
      Q => wave(0),
      R => rst
    );
\wave_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(1),
      Q => wave(1),
      R => rst
    );
\wave_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(2),
      Q => wave(2),
      R => rst
    );
\wave_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(3),
      Q => wave(3),
      R => rst
    );
\wave_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(4),
      Q => wave(4),
      R => rst
    );
\wave_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(5),
      Q => wave(5),
      R => rst
    );
\wave_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(6),
      Q => wave(6),
      R => rst
    );
\wave_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => \wave[7]_i_1_n_0\,
      Q => wave(7),
      S => rst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity exp3_wave_gen_0_0 is
  port (
    value : in STD_LOGIC_VECTOR ( 7 downto 0 );
    semi_pos : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    wave : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of exp3_wave_gen_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of exp3_wave_gen_0_0 : entity is "exp3_wave_gen_0_0,wave_gen,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of exp3_wave_gen_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of exp3_wave_gen_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of exp3_wave_gen_0_0 : entity is "wave_gen,Vivado 2020.1";
end exp3_wave_gen_0_0;

architecture STRUCTURE of exp3_wave_gen_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN exp3_clk_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.exp3_wave_gen_0_0_wave_gen
     port map (
      clk => clk,
      rst => rst,
      semi_pos => semi_pos,
      value(6 downto 0) => value(7 downto 1),
      wave(7 downto 0) => wave(7 downto 0)
    );
end STRUCTURE;

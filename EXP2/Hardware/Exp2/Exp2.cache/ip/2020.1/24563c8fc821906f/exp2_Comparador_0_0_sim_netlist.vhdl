-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Fri Sep 25 16:40:56 2026
-- Host        : Q running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ exp2_Comparador_0_0_sim_netlist.vhdl
-- Design      : exp2_Comparador_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Comparador is
  port (
    pwm : out STD_LOGIC;
    sgn : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rampa : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Comparador;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Comparador is
  signal pwm_INST_0_i_1_n_0 : STD_LOGIC;
  signal pwm_INST_0_i_2_n_0 : STD_LOGIC;
  signal pwm_INST_0_i_3_n_0 : STD_LOGIC;
  signal pwm_INST_0_i_4_n_0 : STD_LOGIC;
  signal pwm_INST_0_i_5_n_0 : STD_LOGIC;
  signal pwm_INST_0_i_6_n_0 : STD_LOGIC;
  signal pwm_INST_0_i_7_n_0 : STD_LOGIC;
  signal pwm_INST_0_i_8_n_0 : STD_LOGIC;
  signal pwm_INST_0_n_1 : STD_LOGIC;
  signal pwm_INST_0_n_2 : STD_LOGIC;
  signal pwm_INST_0_n_3 : STD_LOGIC;
  signal NLW_pwm_INST_0_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of pwm_INST_0 : label is 11;
begin
pwm_INST_0: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => pwm,
      CO(2) => pwm_INST_0_n_1,
      CO(1) => pwm_INST_0_n_2,
      CO(0) => pwm_INST_0_n_3,
      CYINIT => '0',
      DI(3) => pwm_INST_0_i_1_n_0,
      DI(2) => pwm_INST_0_i_2_n_0,
      DI(1) => pwm_INST_0_i_3_n_0,
      DI(0) => pwm_INST_0_i_4_n_0,
      O(3 downto 0) => NLW_pwm_INST_0_O_UNCONNECTED(3 downto 0),
      S(3) => pwm_INST_0_i_5_n_0,
      S(2) => pwm_INST_0_i_6_n_0,
      S(1) => pwm_INST_0_i_7_n_0,
      S(0) => pwm_INST_0_i_8_n_0
    );
pwm_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => sgn(6),
      I1 => rampa(6),
      I2 => rampa(7),
      I3 => sgn(7),
      O => pwm_INST_0_i_1_n_0
    );
pwm_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => sgn(4),
      I1 => rampa(4),
      I2 => rampa(5),
      I3 => sgn(5),
      O => pwm_INST_0_i_2_n_0
    );
pwm_INST_0_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => sgn(2),
      I1 => rampa(2),
      I2 => rampa(3),
      I3 => sgn(3),
      O => pwm_INST_0_i_3_n_0
    );
pwm_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => sgn(0),
      I1 => rampa(0),
      I2 => rampa(1),
      I3 => sgn(1),
      O => pwm_INST_0_i_4_n_0
    );
pwm_INST_0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => sgn(6),
      I1 => rampa(6),
      I2 => sgn(7),
      I3 => rampa(7),
      O => pwm_INST_0_i_5_n_0
    );
pwm_INST_0_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => sgn(4),
      I1 => rampa(4),
      I2 => sgn(5),
      I3 => rampa(5),
      O => pwm_INST_0_i_6_n_0
    );
pwm_INST_0_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => sgn(2),
      I1 => rampa(2),
      I2 => sgn(3),
      I3 => rampa(3),
      O => pwm_INST_0_i_7_n_0
    );
pwm_INST_0_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => sgn(0),
      I1 => rampa(0),
      I2 => sgn(1),
      I3 => rampa(1),
      O => pwm_INST_0_i_8_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    sgn : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rampa : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pwm : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "exp2_Comparador_0_0,Comparador,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "Comparador,Vivado 2020.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Comparador
     port map (
      pwm => pwm,
      rampa(7 downto 0) => rampa(7 downto 0),
      sgn(7 downto 0) => sgn(7 downto 0)
    );
end STRUCTURE;

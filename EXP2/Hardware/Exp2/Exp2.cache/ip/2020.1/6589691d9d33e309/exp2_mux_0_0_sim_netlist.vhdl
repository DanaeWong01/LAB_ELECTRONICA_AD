-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Fri Sep 25 16:41:01 2026
-- Host        : Q running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ exp2_mux_0_0_sim_netlist.vhdl
-- Design      : exp2_mux_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mux is
  port (
    sgnl : out STD_LOGIC_VECTOR ( 7 downto 0 );
    sen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    esp : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sw_sgnl : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mux;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mux is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \sgnl[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \sgnl[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \sgnl[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \sgnl[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \sgnl[4]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \sgnl[5]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \sgnl[6]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \sgnl[7]_INST_0\ : label is "soft_lutpair3";
begin
\sgnl[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => sen(0),
      I1 => esp(0),
      I2 => sw_sgnl,
      O => sgnl(0)
    );
\sgnl[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => sen(1),
      I1 => esp(1),
      I2 => sw_sgnl,
      O => sgnl(1)
    );
\sgnl[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => sen(2),
      I1 => esp(2),
      I2 => sw_sgnl,
      O => sgnl(2)
    );
\sgnl[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => sen(3),
      I1 => esp(3),
      I2 => sw_sgnl,
      O => sgnl(3)
    );
\sgnl[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => sen(4),
      I1 => esp(4),
      I2 => sw_sgnl,
      O => sgnl(4)
    );
\sgnl[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => sen(5),
      I1 => esp(5),
      I2 => sw_sgnl,
      O => sgnl(5)
    );
\sgnl[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => sen(6),
      I1 => esp(6),
      I2 => sw_sgnl,
      O => sgnl(6)
    );
\sgnl[7]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => sen(7),
      I1 => esp(7),
      I2 => sw_sgnl,
      O => sgnl(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    sen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    esp : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sw_sgnl : in STD_LOGIC;
    sgnl : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "exp2_mux_0_0,mux,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "mux,Vivado 2020.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mux
     port map (
      esp(7 downto 0) => esp(7 downto 0),
      sen(7 downto 0) => sen(7 downto 0),
      sgnl(7 downto 0) => sgnl(7 downto 0),
      sw_sgnl => sw_sgnl
    );
end STRUCTURE;

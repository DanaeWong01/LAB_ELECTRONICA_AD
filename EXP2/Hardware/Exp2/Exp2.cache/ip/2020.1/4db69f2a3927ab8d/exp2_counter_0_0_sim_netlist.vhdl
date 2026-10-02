-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Fri Sep 25 16:40:56 2026
-- Host        : Q running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ exp2_counter_0_0_sim_netlist.vhdl
-- Design      : exp2_counter_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk_div : in STD_LOGIC;
    rst : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter is
  signal \addr[7]_i_2_n_0\ : STD_LOGIC;
  signal \^out\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \addr[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \addr[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \addr[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \addr[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \addr[6]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \addr[7]_i_1\ : label is "soft_lutpair1";
begin
  \out\(7 downto 0) <= \^out\(7 downto 0);
\addr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^out\(0),
      O => p_0_in(0)
    );
\addr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^out\(0),
      I1 => \^out\(1),
      O => p_0_in(1)
    );
\addr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^out\(0),
      I1 => \^out\(1),
      I2 => \^out\(2),
      O => p_0_in(2)
    );
\addr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^out\(1),
      I1 => \^out\(0),
      I2 => \^out\(2),
      I3 => \^out\(3),
      O => p_0_in(3)
    );
\addr[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^out\(2),
      I1 => \^out\(0),
      I2 => \^out\(1),
      I3 => \^out\(3),
      I4 => \^out\(4),
      O => p_0_in(4)
    );
\addr[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^out\(3),
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => \^out\(2),
      I4 => \^out\(4),
      I5 => \^out\(5),
      O => p_0_in(5)
    );
\addr[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \addr[7]_i_2_n_0\,
      I1 => \^out\(6),
      O => p_0_in(6)
    );
\addr[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \addr[7]_i_2_n_0\,
      I1 => \^out\(6),
      I2 => \^out\(7),
      O => p_0_in(7)
    );
\addr[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^out\(5),
      I1 => \^out\(3),
      I2 => \^out\(1),
      I3 => \^out\(0),
      I4 => \^out\(2),
      I5 => \^out\(4),
      O => \addr[7]_i_2_n_0\
    );
\addr_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_div,
      CE => '1',
      CLR => rst,
      D => p_0_in(0),
      Q => \^out\(0)
    );
\addr_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_div,
      CE => '1',
      CLR => rst,
      D => p_0_in(1),
      Q => \^out\(1)
    );
\addr_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_div,
      CE => '1',
      CLR => rst,
      D => p_0_in(2),
      Q => \^out\(2)
    );
\addr_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_div,
      CE => '1',
      CLR => rst,
      D => p_0_in(3),
      Q => \^out\(3)
    );
\addr_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk_div,
      CE => '1',
      CLR => rst,
      D => p_0_in(4),
      Q => \^out\(4)
    );
\addr_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk_div,
      CE => '1',
      CLR => rst,
      D => p_0_in(5),
      Q => \^out\(5)
    );
\addr_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk_div,
      CE => '1',
      CLR => rst,
      D => p_0_in(6),
      Q => \^out\(6)
    );
\addr_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk_div,
      CE => '1',
      CLR => rst,
      D => p_0_in(7),
      Q => \^out\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    clk_div : in STD_LOGIC;
    rst : in STD_LOGIC;
    addr : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "exp2_counter_0_0,counter,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "counter,Vivado 2020.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter
     port map (
      clk_div => clk_div,
      \out\(7 downto 0) => addr(7 downto 0),
      rst => rst
    );
end STRUCTURE;

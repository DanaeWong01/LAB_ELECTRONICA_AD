-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Fri Sep 25 16:41:01 2026
-- Host        : Q running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ exp2_mux_0_0_stub.vhdl
-- Design      : exp2_mux_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    sen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    esp : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sw_sgnl : in STD_LOGIC;
    sgnl : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "sen[7:0],esp[7:0],sw_sgnl,sgnl[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "mux,Vivado 2020.1";
begin
end;

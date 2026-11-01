-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Sun Nov  1 15:57:29 2026
-- Host        : Q running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/LAB_ELECTRONICA_AD/EXP3/Hardware/EXP3/EXP3.srcs/sources_1/bd/exp3/ip/exp3_modular_clk_div_0_0/exp3_modular_clk_div_0_0_stub.vhdl
-- Design      : exp3_modular_clk_div_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity exp3_modular_clk_div_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    clk_div : out STD_LOGIC
  );

end exp3_modular_clk_div_0_0;

architecture stub of exp3_modular_clk_div_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst,clk_div";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "modular_clk_div,Vivado 2020.1";
begin
end;

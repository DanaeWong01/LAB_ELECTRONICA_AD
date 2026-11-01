//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Sun Nov  1 15:56:06 2026
//Host        : Q running 64-bit major release  (build 9200)
//Command     : generate_target exp3_wrapper.bd
//Design      : exp3_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module exp3_wrapper
   (addr_0,
    clk_0,
    clk_div_0,
    rst_0,
    wave_0);
  output [6:0]addr_0;
  input clk_0;
  output clk_div_0;
  input rst_0;
  output [7:0]wave_0;

  wire [6:0]addr_0;
  wire clk_0;
  wire clk_div_0;
  wire rst_0;
  wire [7:0]wave_0;

  exp3 exp3_i
       (.addr_0(addr_0),
        .clk_0(clk_0),
        .clk_div_0(clk_div_0),
        .rst_0(rst_0),
        .wave_0(wave_0));
endmodule

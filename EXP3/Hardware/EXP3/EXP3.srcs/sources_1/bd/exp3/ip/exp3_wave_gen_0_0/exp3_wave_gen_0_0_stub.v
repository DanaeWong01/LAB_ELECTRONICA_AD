// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sun Nov  1 15:57:29 2026
// Host        : Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/LAB_ELECTRONICA_AD/EXP3/Hardware/EXP3/EXP3.srcs/sources_1/bd/exp3/ip/exp3_wave_gen_0_0/exp3_wave_gen_0_0_stub.v
// Design      : exp3_wave_gen_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "wave_gen,Vivado 2020.1" *)
module exp3_wave_gen_0_0(value, semi_pos, clk, rst, wave)
/* synthesis syn_black_box black_box_pad_pin="value[7:0],semi_pos,clk,rst,wave[7:0]" */;
  input [7:0]value;
  input semi_pos;
  input clk;
  input rst;
  output [7:0]wave;
endmodule

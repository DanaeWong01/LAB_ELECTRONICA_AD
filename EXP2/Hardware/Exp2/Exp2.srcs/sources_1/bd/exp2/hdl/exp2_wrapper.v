//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Fri Oct  2 19:10:27 2026
//Host        : Q running 64-bit major release  (build 9200)
//Command     : generate_target exp2_wrapper.bd
//Design      : exp2_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module exp2_wrapper
   (an,
    clk,
    dp,
    pwm,
    rst,
    rx,
    segments,
    sw_freq,
    sw_sgnl);
  output [3:0]an;
  input clk;
  output dp;
  output pwm;
  input rst;
  input rx;
  output [6:0]segments;
  input [1:0]sw_freq;
  input sw_sgnl;

  wire [3:0]an;
  wire clk;
  wire dp;
  wire pwm;
  wire rst;
  wire rx;
  wire [6:0]segments;
  wire [1:0]sw_freq;
  wire sw_sgnl;

  exp2 exp2_i
       (.an(an),
        .clk(clk),
        .dp(dp),
        .pwm(pwm),
        .rst(rst),
        .rx(rx),
        .segments(segments),
        .sw_freq(sw_freq),
        .sw_sgnl(sw_sgnl));
endmodule

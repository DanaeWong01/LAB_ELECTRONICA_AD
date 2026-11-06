//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Fri Nov  6 00:56:20 2026
//Host        : Q running 64-bit major release  (build 9200)
//Command     : generate_target led_teclado_wrapper.bd
//Design      : led_teclado_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module led_teclado_wrapper
   (clk,
    leds,
    ps2c,
    ps2d,
    rst,
    wave);
  input clk;
  output [11:0]leds;
  input ps2c;
  input ps2d;
  input rst;
  output [7:0]wave;

  wire clk;
  wire [11:0]leds;
  wire ps2c;
  wire ps2d;
  wire rst;
  wire [7:0]wave;

  led_teclado led_teclado_i
       (.clk(clk),
        .leds(leds),
        .ps2c(ps2c),
        .ps2d(ps2d),
        .rst(rst),
        .wave(wave));
endmodule

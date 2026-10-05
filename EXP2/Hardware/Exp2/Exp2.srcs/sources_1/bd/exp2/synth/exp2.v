//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Mon Oct  5 16:06:14 2026
//Host        : Q running 64-bit major release  (build 9200)
//Command     : generate_target exp2.bd
//Design      : exp2
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "exp2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=exp2,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=12,numReposBlks=12,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "exp2.hwdef" *) 
module exp2
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst, CLK_DOMAIN exp2_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk;
  output dp;
  output pwm;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst;
  input rx;
  output [6:0]segments;
  input [1:0]sw_freq;
  input sw_sgnl;

  wire Comparador_0_pwm;
  wire OR_0_uart_clk_rst;
  wire clk_0_1;
  wire clk_mgnmnt_0_clk_div;
  wire [7:0]counter_0_addr;
  wire [7:0]counter_1_addr;
  wire [3:0]display_voltaje_0_an;
  wire display_voltaje_0_dp;
  wire [6:0]display_voltaje_0_segments;
  wire [7:0]generador_seno_0_n_out;
  wire modular_clk_div_0_clk_div;
  wire modular_clk_div_1_clk_div;
  wire [7:0]mux_0_sgnl;
  wire rst_0_1;
  wire rx_0_1;
  wire [15:0]ss_driver_0_display;
  wire [1:0]sw_0_1;
  wire sw_sgnl_0_1;
  wire [7:0]uart_rx_0_msg;
  wire uart_rx_0_rst_div;

  assign an[3:0] = display_voltaje_0_an;
  assign clk_0_1 = clk;
  assign dp = display_voltaje_0_dp;
  assign pwm = Comparador_0_pwm;
  assign rst_0_1 = rst;
  assign rx_0_1 = rx;
  assign segments[6:0] = display_voltaje_0_segments;
  assign sw_0_1 = sw_freq[1:0];
  assign sw_sgnl_0_1 = sw_sgnl;
  exp2_Comparador_0_0 Comparador_0
       (.pwm(Comparador_0_pwm),
        .rampa(counter_1_addr),
        .sgn(mux_0_sgnl));
  exp2_OR_0_0 OR_0
       (.rst(rst_0_1),
        .rst_uart(uart_rx_0_rst_div),
        .uart_clk_rst(OR_0_uart_clk_rst));
  exp2_clk_mgnmnt_0_0 clk_mgnmnt_0
       (.clk(clk_0_1),
        .clk_div(clk_mgnmnt_0_clk_div),
        .rst(rst_0_1),
        .sw(sw_0_1));
  exp2_counter_0_0 counter_0
       (.addr(counter_0_addr),
        .clk_div(clk_mgnmnt_0_clk_div),
        .rst(rst_0_1));
  exp2_counter_1_0 counter_1
       (.addr(counter_1_addr),
        .clk_div(modular_clk_div_0_clk_div),
        .rst(rst_0_1));
  exp2_display_voltaje_0_0 display_voltaje_0
       (.an(display_voltaje_0_an),
        .clk(clk_0_1),
        .display_value(ss_driver_0_display),
        .dp(display_voltaje_0_dp),
        .rst(rst_0_1),
        .segments(display_voltaje_0_segments));
  exp2_generador_seno_0_0 generador_seno_0
       (.addr(counter_0_addr),
        .clk(clk_0_1),
        .n_out(generador_seno_0_n_out),
        .rst(rst_0_1));
  exp2_modular_clk_div_0_0 modular_clk_div_0
       (.clk(clk_0_1),
        .clk_div(modular_clk_div_0_clk_div),
        .rst(rst_0_1));
  exp2_modular_clk_div_1_0 modular_clk_div_1
       (.clk(clk_0_1),
        .clk_div(modular_clk_div_1_clk_div),
        .rst(OR_0_uart_clk_rst));
  exp2_mux_0_0 mux_0
       (.esp(uart_rx_0_msg),
        .sen(generador_seno_0_n_out),
        .sgnl(mux_0_sgnl),
        .sw_sgnl(sw_sgnl_0_1));
  exp2_ss_driver_0_0 ss_driver_0
       (.display(ss_driver_0_display),
        .sw(sw_0_1));
  exp2_uart_rx_0_0 uart_rx_0
       (.clk(clk_0_1),
        .clk_uart(modular_clk_div_1_clk_div),
        .msg(uart_rx_0_msg),
        .rst(rst_0_1),
        .rst_div(uart_rx_0_rst_div),
        .rx(rx_0_1));
endmodule

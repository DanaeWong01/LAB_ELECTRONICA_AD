//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Fri Nov  6 00:56:20 2026
//Host        : Q running 64-bit major release  (build 9200)
//Command     : generate_target led_teclado.bd
//Design      : led_teclado
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "led_teclado,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=led_teclado,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=10,numReposBlks=10,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=8,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "led_teclado.hwdef" *) 
module led_teclado
   (clk,
    leds,
    ps2c,
    ps2d,
    rst,
    wave);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst, CLK_DOMAIN led_teclado_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk;
  output [11:0]leds;
  input ps2c;
  input ps2d;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst;
  output [7:0]wave;

  wire DB_0_ps2c_DB;
  wire [7:0]PS2_RX_0_msg;
  wire PS2_RX_0_msg_ready;
  wire [7:0]blk_mem_gen_0_douta;
  wire clk_0_1;
  wire [6:0]dec_notas_0_salto_decimal;
  wire [6:0]dec_notas_0_salto_entero;
  wire [8:0]gen_frecuencias_0_posicion;
  wire [11:0]led_enable_0_leds_enable;
  wire modular_clk_div_0_clkdiv;
  wire ps2c_0_1;
  wire ps2d_0_1;
  wire rst_0_1;
  wire [6:0]sinusoide_0_ROM_addr;
  wire [7:0]sinusoide_0_wave;
  wire [11:0]teclado_a_led_0_leds;
  wire teclado_a_led_0_nota_activa;
  wire [7:0]teclado_a_led_0_tecla_presionada;

  assign clk_0_1 = clk;
  assign leds[11:0] = led_enable_0_leds_enable;
  assign ps2c_0_1 = ps2c;
  assign ps2d_0_1 = ps2d;
  assign rst_0_1 = rst;
  assign wave[7:0] = sinusoide_0_wave;
  led_teclado_DB_0_1 DB_0
       (.clk(clk_0_1),
        .ps2c(ps2c_0_1),
        .ps2c_DB(DB_0_ps2c_DB),
        .rst(rst_0_1));
  led_teclado_PS2_RX_0_0 PS2_RX_0
       (.clk(clk_0_1),
        .msg(PS2_RX_0_msg),
        .msg_ready(PS2_RX_0_msg_ready),
        .ps2c(DB_0_ps2c_DB),
        .ps2d(ps2d_0_1),
        .rst(rst_0_1));
  led_teclado_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(sinusoide_0_ROM_addr),
        .clka(clk_0_1),
        .douta(blk_mem_gen_0_douta));
  led_teclado_dec_notas_0_0 dec_notas_0
       (.salto_decimal(dec_notas_0_salto_decimal),
        .salto_entero(dec_notas_0_salto_entero),
        .tecla_presionada(teclado_a_led_0_tecla_presionada));
  led_teclado_gen_frecuencias_0_0 gen_frecuencias_0
       (.clk(clk_0_1),
        .clkdiv(modular_clk_div_0_clkdiv),
        .posicion(gen_frecuencias_0_posicion),
        .rst(rst_0_1),
        .salto_decimal(dec_notas_0_salto_decimal),
        .salto_entero(dec_notas_0_salto_entero));
  led_teclado_ila_0_0 ila_0
       (.clk(clk_0_1),
        .probe0(ps2c_0_1),
        .probe1(ps2d_0_1),
        .probe2(teclado_a_led_0_tecla_presionada),
        .probe3(teclado_a_led_0_nota_activa));
  led_teclado_led_enable_0_0 led_enable_0
       (.enable(teclado_a_led_0_nota_activa),
        .leds(teclado_a_led_0_leds),
        .leds_enable(led_enable_0_leds_enable));
  led_teclado_modular_clk_div_0_0 modular_clk_div_0
       (.clk(clk_0_1),
        .clkdiv(modular_clk_div_0_clkdiv),
        .rst(rst_0_1));
  led_teclado_sinusoide_0_0 sinusoide_0
       (.ROM_addr(sinusoide_0_ROM_addr),
        .ROM_data(blk_mem_gen_0_douta),
        .clk(clk_0_1),
        .nota_activa(teclado_a_led_0_nota_activa),
        .posicion(gen_frecuencias_0_posicion),
        .rst(rst_0_1),
        .wave(sinusoide_0_wave));
  led_teclado_teclado_a_led_0_0 teclado_a_led_0
       (.clk(clk_0_1),
        .leds(teclado_a_led_0_leds),
        .msg(PS2_RX_0_msg),
        .msg_ready(PS2_RX_0_msg_ready),
        .nota_activa(teclado_a_led_0_nota_activa),
        .rst(rst_0_1),
        .tecla_presionada(teclado_a_led_0_tecla_presionada));
endmodule

//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Sun Nov  1 15:56:06 2026
//Host        : Q running 64-bit major release  (build 9200)
//Command     : generate_target exp3.bd
//Design      : exp3
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "exp3,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=exp3,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "exp3.hwdef" *) 
module exp3
   (addr_0,
    clk_0,
    clk_div_0,
    rst_0,
    wave_0);
  output [6:0]addr_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET rst_0, CLK_DOMAIN exp3_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk_0;
  output clk_div_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst_0;
  output [7:0]wave_0;

  wire clk_0_1;
  wire [6:0]lector_count_0_addr;
  wire lector_count_0_semi_pos;
  wire modular_clk_div_0_clk_div;
  wire rst_0_1;
  wire [7:0]sen_gen_douta;
  wire [7:0]wave_gen_0_wave;
  wire [22:0]xlconstant_0_dout;

  assign addr_0[6:0] = lector_count_0_addr;
  assign clk_0_1 = clk_0;
  assign clk_div_0 = modular_clk_div_0_clk_div;
  assign rst_0_1 = rst_0;
  assign wave_0[7:0] = wave_gen_0_wave;
  exp3_lector_count_0_1 lector_count_0
       (.addr(lector_count_0_addr),
        .clk(clk_0_1),
        .rst(rst_0_1),
        .sample_tick(modular_clk_div_0_clk_div),
        .semi_pos(lector_count_0_semi_pos),
        .step_q16(xlconstant_0_dout));
  exp3_modular_clk_div_0_0 modular_clk_div_0
       (.clk(clk_0_1),
        .clk_div(modular_clk_div_0_clk_div),
        .rst(rst_0_1));
  exp3_blk_mem_gen_0_0 sen_gen
       (.addra(lector_count_0_addr),
        .clka(clk_0_1),
        .douta(sen_gen_douta),
        .ena(1'b0));
  exp3_wave_gen_0_0 wave_gen_0
       (.clk(clk_0_1),
        .rst(rst_0_1),
        .semi_pos(lector_count_0_semi_pos),
        .value(sen_gen_douta),
        .wave(wave_gen_0_wave));
  exp3_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule

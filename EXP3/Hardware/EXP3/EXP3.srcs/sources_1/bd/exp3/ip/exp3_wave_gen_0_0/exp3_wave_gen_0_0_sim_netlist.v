// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sun Nov  1 15:57:29 2026
// Host        : Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/LAB_ELECTRONICA_AD/EXP3/Hardware/EXP3/EXP3.srcs/sources_1/bd/exp3/ip/exp3_wave_gen_0_0/exp3_wave_gen_0_0_sim_netlist.v
// Design      : exp3_wave_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "exp3_wave_gen_0_0,wave_gen,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "wave_gen,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module exp3_wave_gen_0_0
   (value,
    semi_pos,
    clk,
    rst,
    wave);
  input [7:0]value;
  input semi_pos;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN exp3_clk_0, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  output [7:0]wave;

  wire clk;
  wire rst;
  wire semi_pos;
  wire [7:0]value;
  wire [7:0]wave;

  exp3_wave_gen_0_0_wave_gen inst
       (.clk(clk),
        .rst(rst),
        .semi_pos(semi_pos),
        .value(value[7:1]),
        .wave(wave));
endmodule

(* ORIG_REF_NAME = "wave_gen" *) 
module exp3_wave_gen_0_0_wave_gen
   (wave,
    value,
    semi_pos,
    rst,
    clk);
  output [7:0]wave;
  input [6:0]value;
  input semi_pos;
  input rst;
  input clk;

  wire clk;
  wire [6:1]p_0_in;
  wire rst;
  wire semi_pos;
  wire [6:0]value;
  wire [7:0]wave;
  wire \wave[7]_i_1_n_0 ;
  wire \wave[7]_i_2_n_0 ;

  LUT3 #(
    .INIT(8'hC6)) 
    \wave[1]_i_1 
       (.I0(value[0]),
        .I1(value[1]),
        .I2(semi_pos),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hF01E)) 
    \wave[2]_i_1 
       (.I0(value[0]),
        .I1(value[1]),
        .I2(value[2]),
        .I3(semi_pos),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFF0001FE)) 
    \wave[3]_i_1 
       (.I0(value[1]),
        .I1(value[0]),
        .I2(value[2]),
        .I3(value[3]),
        .I4(semi_pos),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'hFFFF00000001FFFE)) 
    \wave[4]_i_1 
       (.I0(value[2]),
        .I1(value[0]),
        .I2(value[1]),
        .I3(value[3]),
        .I4(value[4]),
        .I5(semi_pos),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \wave[5]_i_1 
       (.I0(\wave[7]_i_2_n_0 ),
        .I1(value[5]),
        .I2(semi_pos),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h782D)) 
    \wave[6]_i_1 
       (.I0(\wave[7]_i_2_n_0 ),
        .I1(value[5]),
        .I2(value[6]),
        .I3(semi_pos),
        .O(p_0_in[6]));
  LUT4 #(
    .INIT(16'h7F04)) 
    \wave[7]_i_1 
       (.I0(value[5]),
        .I1(\wave[7]_i_2_n_0 ),
        .I2(value[6]),
        .I3(semi_pos),
        .O(\wave[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \wave[7]_i_2 
       (.I0(value[4]),
        .I1(value[2]),
        .I2(value[0]),
        .I3(semi_pos),
        .I4(value[1]),
        .I5(value[3]),
        .O(\wave[7]_i_2_n_0 ));
  FDRE \wave_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(value[0]),
        .Q(wave[0]),
        .R(rst));
  FDRE \wave_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(wave[1]),
        .R(rst));
  FDRE \wave_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[2]),
        .Q(wave[2]),
        .R(rst));
  FDRE \wave_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[3]),
        .Q(wave[3]),
        .R(rst));
  FDRE \wave_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[4]),
        .Q(wave[4]),
        .R(rst));
  FDRE \wave_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[5]),
        .Q(wave[5]),
        .R(rst));
  FDRE \wave_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[6]),
        .Q(wave[6]),
        .R(rst));
  FDSE \wave_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\wave[7]_i_1_n_0 ),
        .Q(wave[7]),
        .S(rst));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

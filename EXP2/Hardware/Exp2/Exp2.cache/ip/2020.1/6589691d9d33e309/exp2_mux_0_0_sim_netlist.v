// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Fri Sep 25 16:41:01 2026
// Host        : Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ exp2_mux_0_0_sim_netlist.v
// Design      : exp2_mux_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "exp2_mux_0_0,mux,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "mux,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (sen,
    esp,
    sw_sgnl,
    sgnl);
  input [7:0]sen;
  input [7:0]esp;
  input sw_sgnl;
  output [7:0]sgnl;

  wire [7:0]esp;
  wire [7:0]sen;
  wire [7:0]sgnl;
  wire sw_sgnl;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mux inst
       (.esp(esp),
        .sen(sen),
        .sgnl(sgnl),
        .sw_sgnl(sw_sgnl));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mux
   (sgnl,
    sen,
    esp,
    sw_sgnl);
  output [7:0]sgnl;
  input [7:0]sen;
  input [7:0]esp;
  input sw_sgnl;

  wire [7:0]esp;
  wire [7:0]sen;
  wire [7:0]sgnl;
  wire sw_sgnl;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \sgnl[0]_INST_0 
       (.I0(sen[0]),
        .I1(esp[0]),
        .I2(sw_sgnl),
        .O(sgnl[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \sgnl[1]_INST_0 
       (.I0(sen[1]),
        .I1(esp[1]),
        .I2(sw_sgnl),
        .O(sgnl[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \sgnl[2]_INST_0 
       (.I0(sen[2]),
        .I1(esp[2]),
        .I2(sw_sgnl),
        .O(sgnl[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \sgnl[3]_INST_0 
       (.I0(sen[3]),
        .I1(esp[3]),
        .I2(sw_sgnl),
        .O(sgnl[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \sgnl[4]_INST_0 
       (.I0(sen[4]),
        .I1(esp[4]),
        .I2(sw_sgnl),
        .O(sgnl[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \sgnl[5]_INST_0 
       (.I0(sen[5]),
        .I1(esp[5]),
        .I2(sw_sgnl),
        .O(sgnl[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \sgnl[6]_INST_0 
       (.I0(sen[6]),
        .I1(esp[6]),
        .I2(sw_sgnl),
        .O(sgnl[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \sgnl[7]_INST_0 
       (.I0(sen[7]),
        .I1(esp[7]),
        .I2(sw_sgnl),
        .O(sgnl[7]));
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

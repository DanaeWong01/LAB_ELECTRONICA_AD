// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Fri Sep 25 16:40:56 2026
// Host        : Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ exp2_Comparador_0_0_sim_netlist.v
// Design      : exp2_Comparador_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Comparador
   (pwm,
    sgn,
    rampa);
  output pwm;
  input [7:0]sgn;
  input [7:0]rampa;

  wire pwm;
  wire pwm_INST_0_i_1_n_0;
  wire pwm_INST_0_i_2_n_0;
  wire pwm_INST_0_i_3_n_0;
  wire pwm_INST_0_i_4_n_0;
  wire pwm_INST_0_i_5_n_0;
  wire pwm_INST_0_i_6_n_0;
  wire pwm_INST_0_i_7_n_0;
  wire pwm_INST_0_i_8_n_0;
  wire pwm_INST_0_n_1;
  wire pwm_INST_0_n_2;
  wire pwm_INST_0_n_3;
  wire [7:0]rampa;
  wire [7:0]sgn;
  wire [3:0]NLW_pwm_INST_0_O_UNCONNECTED;

  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_INST_0
       (.CI(1'b0),
        .CO({pwm,pwm_INST_0_n_1,pwm_INST_0_n_2,pwm_INST_0_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_INST_0_i_1_n_0,pwm_INST_0_i_2_n_0,pwm_INST_0_i_3_n_0,pwm_INST_0_i_4_n_0}),
        .O(NLW_pwm_INST_0_O_UNCONNECTED[3:0]),
        .S({pwm_INST_0_i_5_n_0,pwm_INST_0_i_6_n_0,pwm_INST_0_i_7_n_0,pwm_INST_0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_INST_0_i_1
       (.I0(sgn[6]),
        .I1(rampa[6]),
        .I2(rampa[7]),
        .I3(sgn[7]),
        .O(pwm_INST_0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_INST_0_i_2
       (.I0(sgn[4]),
        .I1(rampa[4]),
        .I2(rampa[5]),
        .I3(sgn[5]),
        .O(pwm_INST_0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_INST_0_i_3
       (.I0(sgn[2]),
        .I1(rampa[2]),
        .I2(rampa[3]),
        .I3(sgn[3]),
        .O(pwm_INST_0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_INST_0_i_4
       (.I0(sgn[0]),
        .I1(rampa[0]),
        .I2(rampa[1]),
        .I3(sgn[1]),
        .O(pwm_INST_0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_INST_0_i_5
       (.I0(sgn[6]),
        .I1(rampa[6]),
        .I2(sgn[7]),
        .I3(rampa[7]),
        .O(pwm_INST_0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_INST_0_i_6
       (.I0(sgn[4]),
        .I1(rampa[4]),
        .I2(sgn[5]),
        .I3(rampa[5]),
        .O(pwm_INST_0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_INST_0_i_7
       (.I0(sgn[2]),
        .I1(rampa[2]),
        .I2(sgn[3]),
        .I3(rampa[3]),
        .O(pwm_INST_0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_INST_0_i_8
       (.I0(sgn[0]),
        .I1(rampa[0]),
        .I2(sgn[1]),
        .I3(rampa[1]),
        .O(pwm_INST_0_i_8_n_0));
endmodule

(* CHECK_LICENSE_TYPE = "exp2_Comparador_0_0,Comparador,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "Comparador,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (sgn,
    rampa,
    pwm);
  input [7:0]sgn;
  input [7:0]rampa;
  output pwm;

  wire pwm;
  wire [7:0]rampa;
  wire [7:0]sgn;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Comparador inst
       (.pwm(pwm),
        .rampa(rampa),
        .sgn(sgn));
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

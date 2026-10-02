// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Fri Sep 25 16:40:56 2026
// Host        : Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ exp2_counter_0_0_sim_netlist.v
// Design      : exp2_counter_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter
   (out,
    clk_div,
    rst);
  output [7:0]out;
  input clk_div;
  input rst;

  wire \addr[7]_i_2_n_0 ;
  wire clk_div;
  wire [7:0]out;
  wire [7:0]p_0_in;
  wire rst;

  LUT1 #(
    .INIT(2'h1)) 
    \addr[0]_i_1 
       (.I0(out[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \addr[1]_i_1 
       (.I0(out[0]),
        .I1(out[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \addr[2]_i_1 
       (.I0(out[0]),
        .I1(out[1]),
        .I2(out[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \addr[3]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(out[2]),
        .I3(out[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \addr[4]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(out[1]),
        .I3(out[3]),
        .I4(out[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \addr[5]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(out[2]),
        .I4(out[4]),
        .I5(out[5]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \addr[6]_i_1 
       (.I0(\addr[7]_i_2_n_0 ),
        .I1(out[6]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \addr[7]_i_1 
       (.I0(\addr[7]_i_2_n_0 ),
        .I1(out[6]),
        .I2(out[7]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \addr[7]_i_2 
       (.I0(out[5]),
        .I1(out[3]),
        .I2(out[1]),
        .I3(out[0]),
        .I4(out[2]),
        .I5(out[4]),
        .O(\addr[7]_i_2_n_0 ));
  FDCE \addr_reg[0] 
       (.C(clk_div),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[0]),
        .Q(out[0]));
  FDCE \addr_reg[1] 
       (.C(clk_div),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[1]),
        .Q(out[1]));
  FDCE \addr_reg[2] 
       (.C(clk_div),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[2]),
        .Q(out[2]));
  FDCE \addr_reg[3] 
       (.C(clk_div),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[3]),
        .Q(out[3]));
  FDCE \addr_reg[4] 
       (.C(clk_div),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[4]),
        .Q(out[4]));
  FDCE \addr_reg[5] 
       (.C(clk_div),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[5]),
        .Q(out[5]));
  FDCE \addr_reg[6] 
       (.C(clk_div),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[6]),
        .Q(out[6]));
  FDCE \addr_reg[7] 
       (.C(clk_div),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[7]),
        .Q(out[7]));
endmodule

(* CHECK_LICENSE_TYPE = "exp2_counter_0_0,counter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "counter,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk_div,
    rst,
    addr);
  input clk_div;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  output [7:0]addr;

  wire [7:0]addr;
  wire clk_div;
  wire rst;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter inst
       (.clk_div(clk_div),
        .out(addr),
        .rst(rst));
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

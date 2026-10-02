// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Oct  1 17:29:38 2026
// Host        : Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ exp2_clk_mgnmnt_0_0_sim_netlist.v
// Design      : exp2_clk_mgnmnt_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clk_mgnmnt
   (clk_div,
    sw,
    clk,
    rst);
  output clk_div;
  input [1:0]sw;
  input clk;
  input rst;

  wire [9:4]N;
  wire \N[3]_i_1_n_0 ;
  wire \N_reg_n_0_[3] ;
  wire \N_reg_n_0_[4] ;
  wire \N_reg_n_0_[6] ;
  wire \N_reg_n_0_[7] ;
  wire \N_reg_n_0_[9] ;
  wire clk;
  wire clk_div;
  wire clk_div_i_1_n_0;
  wire count1_carry__0_n_3;
  wire count1_carry_i_1__0_n_0;
  wire count1_carry_i_1_n_0;
  wire count1_carry_i_2__0_n_0;
  wire count1_carry_i_2_n_0;
  wire count1_carry_i_3_n_0;
  wire count1_carry_i_4_n_0;
  wire count1_carry_i_5_n_0;
  wire count1_carry_i_6_n_0;
  wire count1_carry_i_7_n_0;
  wire count1_carry_i_8_n_0;
  wire count1_carry_n_0;
  wire count1_carry_n_1;
  wire count1_carry_n_2;
  wire count1_carry_n_3;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire \count[3]_i_1_n_0 ;
  wire \count[4]_i_1_n_0 ;
  wire \count[5]_i_1_n_0 ;
  wire \count[5]_i_2_n_0 ;
  wire \count[6]_i_1_n_0 ;
  wire \count[7]_i_1_n_0 ;
  wire \count[8]_i_1_n_0 ;
  wire \count[9]_i_1_n_0 ;
  wire \count[9]_i_2_n_0 ;
  wire [9:0]count_reg;
  wire rst;
  wire [1:0]sw;
  wire [3:0]NLW_count1_carry_O_UNCONNECTED;
  wire [3:1]NLW_count1_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_count1_carry__0_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \N[3]_i_1 
       (.I0(sw[0]),
        .I1(sw[1]),
        .O(\N[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \N[4]_i_1 
       (.I0(sw[1]),
        .O(N[4]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \N[6]_i_1 
       (.I0(sw[1]),
        .I1(sw[0]),
        .O(N[6]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \N[7]_i_1 
       (.I0(sw[0]),
        .I1(sw[1]),
        .O(N[7]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \N[9]_i_1 
       (.I0(sw[1]),
        .I1(sw[0]),
        .O(N[9]));
  FDRE \N_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\N[3]_i_1_n_0 ),
        .Q(\N_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \N_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(N[4]),
        .Q(\N_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \N_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(N[6]),
        .Q(\N_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \N_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(N[7]),
        .Q(\N_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \N_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(N[9]),
        .Q(\N_reg_n_0_[9] ),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB4)) 
    clk_div_i_1
       (.I0(rst),
        .I1(count1_carry__0_n_3),
        .I2(clk_div),
        .O(clk_div_i_1_n_0));
  FDCE clk_div_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(clk_div_i_1_n_0),
        .Q(clk_div));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 count1_carry
       (.CI(1'b0),
        .CO({count1_carry_n_0,count1_carry_n_1,count1_carry_n_2,count1_carry_n_3}),
        .CYINIT(1'b1),
        .DI({count1_carry_i_1_n_0,count1_carry_i_2_n_0,count1_carry_i_3_n_0,count1_carry_i_4_n_0}),
        .O(NLW_count1_carry_O_UNCONNECTED[3:0]),
        .S({count1_carry_i_5_n_0,count1_carry_i_6_n_0,count1_carry_i_7_n_0,count1_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 count1_carry__0
       (.CI(count1_carry_n_0),
        .CO({NLW_count1_carry__0_CO_UNCONNECTED[3:1],count1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,count1_carry_i_1__0_n_0}),
        .O(NLW_count1_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,count1_carry_i_2__0_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry_i_1
       (.I0(count_reg[6]),
        .I1(\N_reg_n_0_[6] ),
        .I2(\N_reg_n_0_[7] ),
        .I3(count_reg[7]),
        .O(count1_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    count1_carry_i_1__0
       (.I0(count_reg[9]),
        .I1(\N_reg_n_0_[9] ),
        .O(count1_carry_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry_i_2
       (.I0(count_reg[4]),
        .I1(\N_reg_n_0_[4] ),
        .I2(\N_reg_n_0_[6] ),
        .I3(count_reg[5]),
        .O(count1_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h82)) 
    count1_carry_i_2__0
       (.I0(count_reg[8]),
        .I1(count_reg[9]),
        .I2(\N_reg_n_0_[9] ),
        .O(count1_carry_i_2__0_n_0));
  LUT3 #(
    .INIT(8'hB2)) 
    count1_carry_i_3
       (.I0(count_reg[2]),
        .I1(\N_reg_n_0_[3] ),
        .I2(count_reg[3]),
        .O(count1_carry_i_3_n_0));
  LUT3 #(
    .INIT(8'hB2)) 
    count1_carry_i_4
       (.I0(count_reg[0]),
        .I1(\N_reg_n_0_[7] ),
        .I2(count_reg[1]),
        .O(count1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry_i_5
       (.I0(count_reg[6]),
        .I1(\N_reg_n_0_[6] ),
        .I2(count_reg[7]),
        .I3(\N_reg_n_0_[7] ),
        .O(count1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry_i_6
       (.I0(count_reg[4]),
        .I1(\N_reg_n_0_[4] ),
        .I2(count_reg[5]),
        .I3(\N_reg_n_0_[6] ),
        .O(count1_carry_i_6_n_0));
  LUT3 #(
    .INIT(8'h09)) 
    count1_carry_i_7
       (.I0(count_reg[3]),
        .I1(\N_reg_n_0_[3] ),
        .I2(count_reg[2]),
        .O(count1_carry_i_7_n_0));
  LUT3 #(
    .INIT(8'h09)) 
    count1_carry_i_8
       (.I0(count_reg[1]),
        .I1(\N_reg_n_0_[7] ),
        .I2(count_reg[0]),
        .O(count1_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \count[0]_i_1 
       (.I0(count_reg[0]),
        .I1(count1_carry__0_n_3),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \count[1]_i_1 
       (.I0(count_reg[1]),
        .I1(count_reg[0]),
        .I2(count1_carry__0_n_3),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h006A)) 
    \count[2]_i_1 
       (.I0(count_reg[2]),
        .I1(count_reg[1]),
        .I2(count_reg[0]),
        .I3(count1_carry__0_n_3),
        .O(\count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00006AAA)) 
    \count[3]_i_1 
       (.I0(count_reg[3]),
        .I1(count_reg[2]),
        .I2(count_reg[0]),
        .I3(count_reg[1]),
        .I4(count1_carry__0_n_3),
        .O(\count[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000006AAAAAAA)) 
    \count[4]_i_1 
       (.I0(count_reg[4]),
        .I1(count_reg[3]),
        .I2(count_reg[1]),
        .I3(count_reg[0]),
        .I4(count_reg[2]),
        .I5(count1_carry__0_n_3),
        .O(\count[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \count[5]_i_1 
       (.I0(count_reg[5]),
        .I1(\count[5]_i_2_n_0 ),
        .I2(count1_carry__0_n_3),
        .O(\count[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \count[5]_i_2 
       (.I0(count_reg[4]),
        .I1(count_reg[2]),
        .I2(count_reg[0]),
        .I3(count_reg[1]),
        .I4(count_reg[3]),
        .O(\count[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \count[6]_i_1 
       (.I0(count_reg[6]),
        .I1(\count[9]_i_2_n_0 ),
        .I2(count1_carry__0_n_3),
        .O(\count[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h006A)) 
    \count[7]_i_1 
       (.I0(count_reg[7]),
        .I1(count_reg[6]),
        .I2(\count[9]_i_2_n_0 ),
        .I3(count1_carry__0_n_3),
        .O(\count[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00006AAA)) 
    \count[8]_i_1 
       (.I0(count_reg[8]),
        .I1(count_reg[7]),
        .I2(\count[9]_i_2_n_0 ),
        .I3(count_reg[6]),
        .I4(count1_carry__0_n_3),
        .O(\count[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000006AAAAAAA)) 
    \count[9]_i_1 
       (.I0(count_reg[9]),
        .I1(count_reg[8]),
        .I2(count_reg[6]),
        .I3(\count[9]_i_2_n_0 ),
        .I4(count_reg[7]),
        .I5(count1_carry__0_n_3),
        .O(\count[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count[9]_i_2 
       (.I0(count_reg[5]),
        .I1(count_reg[3]),
        .I2(count_reg[1]),
        .I3(count_reg[0]),
        .I4(count_reg[2]),
        .I5(count_reg[4]),
        .O(\count[9]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\count[0]_i_1_n_0 ),
        .Q(count_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\count[1]_i_1_n_0 ),
        .Q(count_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\count[2]_i_1_n_0 ),
        .Q(count_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\count[3]_i_1_n_0 ),
        .Q(count_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\count[4]_i_1_n_0 ),
        .Q(count_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\count[5]_i_1_n_0 ),
        .Q(count_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\count[6]_i_1_n_0 ),
        .Q(count_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\count[7]_i_1_n_0 ),
        .Q(count_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\count[8]_i_1_n_0 ),
        .Q(count_reg[8]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\count[9]_i_1_n_0 ),
        .Q(count_reg[9]));
endmodule

(* CHECK_LICENSE_TYPE = "exp2_clk_mgnmnt_0_0,clk_mgnmnt,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "clk_mgnmnt,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    rst,
    sw,
    clk_div);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  input [1:0]sw;
  output clk_div;

  wire clk;
  wire clk_div;
  wire rst;
  wire [1:0]sw;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clk_mgnmnt inst
       (.clk(clk),
        .clk_div(clk_div),
        .rst(rst),
        .sw(sw));
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

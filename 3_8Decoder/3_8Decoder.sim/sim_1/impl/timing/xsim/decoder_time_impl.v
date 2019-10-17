// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Thu Oct 17 16:43:07 2019
// Host        : hln running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/hln/Code/FPGA/3_8Decoder/3_8Decoder.sim/sim_1/impl/timing/xsim/decoder_time_impl.v
// Design      : decoder
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "790c0495" *) 
(* NotValidForBitStream *)
module decoder
   (a,
    enable,
    out);
  input [2:0]a;
  input enable;
  output [7:0]out;

  wire [2:0]a;
  wire [2:0]a_IBUF;
  wire enable;
  wire enable_IBUF;
  wire [7:0]out;
  wire [7:0]out_OBUF;

initial begin
 $sdf_annotate("decoder_time_impl.sdf",,,,"tool_control");
end
  IBUF \a_IBUF[0]_inst 
       (.I(a[0]),
        .O(a_IBUF[0]));
  IBUF \a_IBUF[1]_inst 
       (.I(a[1]),
        .O(a_IBUF[1]));
  IBUF \a_IBUF[2]_inst 
       (.I(a[2]),
        .O(a_IBUF[2]));
  IBUF enable_IBUF_inst
       (.I(enable),
        .O(enable_IBUF));
  OBUF \out_OBUF[0]_inst 
       (.I(out_OBUF[0]),
        .O(out[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h01FF)) 
    \out_OBUF[0]_inst_i_1 
       (.I0(a_IBUF[1]),
        .I1(a_IBUF[0]),
        .I2(a_IBUF[2]),
        .I3(enable_IBUF),
        .O(out_OBUF[0]));
  OBUF \out_OBUF[1]_inst 
       (.I(out_OBUF[1]),
        .O(out[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h10FF)) 
    \out_OBUF[1]_inst_i_1 
       (.I0(a_IBUF[1]),
        .I1(a_IBUF[2]),
        .I2(a_IBUF[0]),
        .I3(enable_IBUF),
        .O(out_OBUF[1]));
  OBUF \out_OBUF[2]_inst 
       (.I(out_OBUF[2]),
        .O(out[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h10FF)) 
    \out_OBUF[2]_inst_i_1 
       (.I0(a_IBUF[0]),
        .I1(a_IBUF[2]),
        .I2(a_IBUF[1]),
        .I3(enable_IBUF),
        .O(out_OBUF[2]));
  OBUF \out_OBUF[3]_inst 
       (.I(out_OBUF[3]),
        .O(out[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h08FF)) 
    \out_OBUF[3]_inst_i_1 
       (.I0(a_IBUF[1]),
        .I1(a_IBUF[0]),
        .I2(a_IBUF[2]),
        .I3(enable_IBUF),
        .O(out_OBUF[3]));
  OBUF \out_OBUF[4]_inst 
       (.I(out_OBUF[4]),
        .O(out[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h10FF)) 
    \out_OBUF[4]_inst_i_1 
       (.I0(a_IBUF[1]),
        .I1(a_IBUF[0]),
        .I2(a_IBUF[2]),
        .I3(enable_IBUF),
        .O(out_OBUF[4]));
  OBUF \out_OBUF[5]_inst 
       (.I(out_OBUF[5]),
        .O(out[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h40FF)) 
    \out_OBUF[5]_inst_i_1 
       (.I0(a_IBUF[1]),
        .I1(a_IBUF[2]),
        .I2(a_IBUF[0]),
        .I3(enable_IBUF),
        .O(out_OBUF[5]));
  OBUF \out_OBUF[6]_inst 
       (.I(out_OBUF[6]),
        .O(out[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h08FF)) 
    \out_OBUF[6]_inst_i_1 
       (.I0(a_IBUF[1]),
        .I1(a_IBUF[2]),
        .I2(a_IBUF[0]),
        .I3(enable_IBUF),
        .O(out_OBUF[6]));
  OBUF \out_OBUF[7]_inst 
       (.I(out_OBUF[7]),
        .O(out[7]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h80FF)) 
    \out_OBUF[7]_inst_i_1 
       (.I0(a_IBUF[2]),
        .I1(a_IBUF[0]),
        .I2(a_IBUF[1]),
        .I3(enable_IBUF),
        .O(out_OBUF[7]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

endmodule
`endif

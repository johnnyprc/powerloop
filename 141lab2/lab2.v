// Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 14.1.0 Build 186 12/03/2014 SJ Web Edition"
// CREATED		"Wed Feb 18 03:38:44 2015"

module lab2(
	f_clk,
	start,
	start_addr
);


input wire	f_clk;
input wire	start;
input wire	[7:0] start_addr;

wire	[7:0] SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_30;
wire	[7:0] SYNTHESIZED_WIRE_31;
wire	[7:0] SYNTHESIZED_WIRE_32;
wire	[1:0] SYNTHESIZED_WIRE_7;
wire	[3:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_34;
wire	[3:0] SYNTHESIZED_WIRE_17;
wire	[2:0] SYNTHESIZED_WIRE_18;
wire	[2:0] SYNTHESIZED_WIRE_19;
wire	[2:0] SYNTHESIZED_WIRE_20;
wire	[7:0] SYNTHESIZED_WIRE_21;
wire	[7:0] SYNTHESIZED_WIRE_23;
wire	[7:0] SYNTHESIZED_WIRE_27;
wire	[7:0] SYNTHESIZED_WIRE_28;





inst_rom	b2v_inst(
	.address_i(SYNTHESIZED_WIRE_29),
	.instruction_o(SYNTHESIZED_WIRE_28));


fetch_unit	b2v_inst123455(
	.f_clk(f_clk),
	.start(start),
	
	.taken(SYNTHESIZED_WIRE_1),
	.halt(SYNTHESIZED_WIRE_2),
	.pc_i(SYNTHESIZED_WIRE_29),
	.start_addr(start_addr),
	.target(SYNTHESIZED_WIRE_30),
	.pc_o(SYNTHESIZED_WIRE_29));


alu	b2v_inst13(
	.alu_rs1(SYNTHESIZED_WIRE_31),
	.alu_rs2(SYNTHESIZED_WIRE_32),
	.constant(SYNTHESIZED_WIRE_7),
	.opcode(SYNTHESIZED_WIRE_8),
	.overflow(SYNTHESIZED_WIRE_13),
	.branch_taken_o(SYNTHESIZED_WIRE_1),
	.aluOut(SYNTHESIZED_WIRE_30));


single_port_ram_with_init	b2v_inst15(
	.writemem(SYNTHESIZED_WIRE_9),
	.readmem(SYNTHESIZED_WIRE_33),
	.clk(f_clk),
	.addr(SYNTHESIZED_WIRE_32),
	.data(SYNTHESIZED_WIRE_31),
	.q(SYNTHESIZED_WIRE_23));
	defparam	b2v_inst15.ADDR_WIDTH = 8;


register_file	b2v_inst16(
	.clk(f_clk),
	.condition_bit(SYNTHESIZED_WIRE_13),
	.reg_write(SYNTHESIZED_WIRE_14),
	.label_read(SYNTHESIZED_WIRE_15),
	.label_write(SYNTHESIZED_WIRE_34),
	.label_rs(SYNTHESIZED_WIRE_17),
	.rd(SYNTHESIZED_WIRE_18),
	.rs1(SYNTHESIZED_WIRE_19),
	.rs2(SYNTHESIZED_WIRE_20),
	.write_data(SYNTHESIZED_WIRE_21),
	.regA_o(SYNTHESIZED_WIRE_31),
	.regB_o(SYNTHESIZED_WIRE_32));


mux_0	b2v_inst17(
	.sel(SYNTHESIZED_WIRE_33),
	.in1(SYNTHESIZED_WIRE_23),
	.in2(SYNTHESIZED_WIRE_30),
	.out(SYNTHESIZED_WIRE_27));


mux_1	b2v_inst233(
	.sel(SYNTHESIZED_WIRE_34),
	.in1(SYNTHESIZED_WIRE_29),
	.in2(SYNTHESIZED_WIRE_27),
	.out(SYNTHESIZED_WIRE_21));


decoder	b2v_inst7(
	.instr(SYNTHESIZED_WIRE_28),
	.memRead_o(SYNTHESIZED_WIRE_33),
	.memWrite_o(SYNTHESIZED_WIRE_9),
	.labelRead_o(SYNTHESIZED_WIRE_15),
	.labelWrite_o(SYNTHESIZED_WIRE_34),
	.regWrite_o(SYNTHESIZED_WIRE_14),
	.halt_o(SYNTHESIZED_WIRE_2),
	.alu_op_o(SYNTHESIZED_WIRE_8),
	.branchAddr_o(SYNTHESIZED_WIRE_17),
	.constant_o(SYNTHESIZED_WIRE_7),
	.regDest_o(SYNTHESIZED_WIRE_18),
	.regSource1_o(SYNTHESIZED_WIRE_19),
	.regSource2_o(SYNTHESIZED_WIRE_20));


endmodule

module mux_0(sel,in1,in2,out);
/* synthesis black_box */

input sel;
input [7:0] in1;
input [7:0] in2;
output [7:0] out;

endmodule

module mux_1(sel,in1,in2,out);
/* synthesis black_box */

input sel;
input [7:0] in1;
input [7:0] in2;
output [7:0] out;

endmodule

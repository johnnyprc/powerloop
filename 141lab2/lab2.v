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
// CREATED		"Wed Feb 04 22:28:11 2015"

module lab2(
	clk,
	reg_write,
	label_write,
	label_read,
	start,
	branch,
	taken,
	address_i,
	alu_rs1,
	alu_rs2,
	constant,
	opcode,
	pc_i,
	rd,
	rs1,
	rs2,
	start_add,
	target,
	write_data,
	overflow,
	aluOut,
	instruction_o,
	pc_o,
	regA_o,
	regB_o
);


input wire	clk;
input wire	reg_write;
input wire	label_write;
input wire	label_read;
input wire	start;
input wire	branch;
input wire	taken;
input wire	[7:0] address_i;
input wire	[7:0] alu_rs1;
input wire	[7:0] alu_rs2;
input wire	[1:0] constant;
input wire	[3:0] opcode;
input wire	[7:0] pc_i;
input wire	[2:0] rd;
input wire	[2:0] rs1;
input wire	[2:0] rs2;
input wire	[7:0] start_add;
input wire	[7:0] target;
input wire	[7:0] write_data;
output wire	overflow;
output wire	[7:0] aluOut;
output wire	[7:0] instruction_o;
output wire	[7:0] pc_o;
output wire	[7:0] regA_o;
output wire	[7:0] regB_o;






register_file	b2v_inst(
	.clk(clk),
	.reg_write(reg_write),
	.label_write(label_write),
	.label_read(label_read),
	.rd(rd),
	.rs1(rs1),
	.rs2(rs2),
	.write_data(write_data),
	.regA_o(regA_o),
	.regB_o(regB_o));


alu	b2v_inst2(
	.alu_rs1(alu_rs1),
	.alu_rs2(alu_rs2),
	.constant(constant),
	.opcode(opcode),
	.overflow(overflow),
	.aluOut(aluOut));


fetch_unit	b2v_inst3(
	.start(start),
	.branch(branch),
	.taken(taken),
	.pc_i(pc_i),
	.start_addr(start_add),
	.target(target),
	.pc_o(pc_o));


inst_rom	b2v_inst4(
	.address_i(address_i),
	.instruction_o(instruction_o));


endmodule

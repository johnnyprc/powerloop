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
// CREATED		"Tue Feb 03 22:58:09 2015"

module lab2(
	clk,
	reg_write,
	lable_write,
	lable_read,
	rd,
	rs1,
	rs2,
	write_data,
	regA_o,
	regB_o
);


input wire	clk;
input wire	reg_write;
input wire	lable_write;
input wire	lable_read;
input wire	[2:0] rd;
input wire	[2:0] rs1;
input wire	[2:0] rs2;
input wire	[7:0] write_data;
output wire	[7:0] regA_o;
output wire	[7:0] regB_o;






register_file	b2v_inst2(
	.clk(clk),
	.reg_write(reg_write),
	.label_write(lable_write),
	.label_read(lable_read),
	.rd(rd),
	.rs1(rs1),
	.rs2(rs2),
	.write_data(write_data),
	.regA_o(regA_o),
	.regB_o(regB_o));


endmodule

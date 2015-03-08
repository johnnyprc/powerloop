module IDEX(
	input clk,
	input [3:0] alu_op,
	input [7:0] data_in1,
	input [7:0] data_in2,
	input [2:0] data_rd,
	input memRead_i,
	input memWrite_i,
	input regWrite_i,
	input	[1:0] constant_i,
	input [2:0] rs1,
	input [2:0] rs2,
	output reg [3:0] alu_op_o,
	output reg [7:0] data_out1,
	output reg [7:0] data_out2,
	output reg [2:0] data_rd_o,
	output reg memRead_o,
	output reg memWrite_o,
	output reg regWrite_o,
	output reg [1:0] constant_o,
	output reg [2:0] rs1_o,
	output reg [2:0] rs2_o
);

always_ff @ (posedge clk) begin
	alu_op_o <= alu_op;
	data_out1 <= data_in1;
	data_out2 <= data_in2;
	data_rd_o <= data_rd;
	memRead_o <= memRead_i;
	memWrite_o <= memWrite_i;
	regWrite_o <= regWrite_i;
	constant_o <= constant_i;
	rs1_o <= rs1;
	rs2_o <= rs2;
end

endmodule
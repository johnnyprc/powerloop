module EXMEM(
	input clk,
	input [7:0] data_in,
	input overflow_i,
	input [2:0] data_rd_i,
	input memRead_i,
	input memWrite_i,
	input regWrite_i,
	input [7:0] memAddr_i,
	output reg [7:0] data_out,
	output reg overflow_o,
	output reg [2:0] data_rd_o,
	output reg memRead_o,
	output reg memWrite_o,
	output reg regWrite_o,
	output reg [7:0] memAddr_o
);

always_ff @ (posedge clk) begin
	data_out <= data_in;
	overflow_o <= overflow_i;
	data_rd_o <= data_rd_i;
	memRead_o <= memRead_i;
	memWrite_o <= memWrite_i;
	regWrite_o <= regWrite_i;
	memAddr_o <= memAddr_i;
end

endmodule
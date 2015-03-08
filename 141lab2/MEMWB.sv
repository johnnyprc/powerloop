module MEMWB(
	input clk,
	input [7:0] data_i,
	input regWrite_i,
	input overflow_i,
	input [2:0] data_rd_i,
	output reg [7:0] data_o,
	output reg regWrite_o,
	output reg overflow_o,
	output reg [2:0] data_rd_o
);

always_ff @ (posedge clk) begin
	data_o <= data_i;
	regWrite_o <= regWrite_i;
	overflow_o <= overflow_i;
	data_rd_o <= data_rd_i;
end

endmodule
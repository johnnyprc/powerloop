module register_file(
	input clk,
	input [2:0] rs1,
	input [2:0] rs2,
	input [2:0] rd,
	input [7:0] write_data,
	input condition_bit,
	input reg_write,
	input label_read,
	input label_write,
	input [3:0] label_rs,
	output [7:0] regA_o,
	output [7:0] regB_o
);

reg [7:0] regA, regB;
reg [7:0] general_registers[6:0]; // a0- a3, v0, c0, zero
reg [7:0] label_registers[5:0]; // l0 - l5

assign regA_o = regA;
assign regB_o = regB;

always_comb begin
	if (label_read == 1) begin
		regA = general_registers[label_rs]; //should be v0
		regB = label_registers[label_rs];
	end
	else begin
		regA = general_registers[rs1];
		regB = general_registers[rs2];
	end
end

always_ff @(negedge clk) begin
	if (reg_write == 1) begin
		general_registers[rd] <= write_data;
		general_registers[5] <= condition_bit;
	end
	else if (label_write == 1)
		label_registers[rd] <= write_data;
end
endmodule
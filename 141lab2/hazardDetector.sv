module hazardDetector(
	input clk,
	input [7:0] instruction,
	output [7:0] instruction_o
);

reg [7:0] instr_o;
assign instruction_o = instr_o;

always_comb begin
	instr_o = instruction;
end

endmodule
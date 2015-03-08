module IFID(
	input clk,
	input [7:0] instruction,
	output [7:0] instruction_o
);

reg [7:0] instr_o;
reg [7:0] localInstr;
assign instruction_o = instr_o;

always_comb begin
	localInstr = instruction;
end

always_ff @ (posedge clk) begin
	instr_o <= localInstr;		
end



endmodule
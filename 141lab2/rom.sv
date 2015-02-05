module inst_rom(
	input [7:0] address_i,
	output [7:0] instruction_o
);

reg [7:0] instruction_output;
assign instruction_o = instruction_output;

always_comb begin
	case(address_i)
		8'b0  : instruction_output = 8'b0;
		8'b1  : instruction_output = 8'b1;
		8'b10 : instruction_output = 8'b10;
		8'b11 : instruction_output = 8'b11;
		8'b100: instruction_output = 8'b100;
		default: instruction_output = 8'b11111111;
	endcase
end
endmodule

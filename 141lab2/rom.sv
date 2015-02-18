module inst_rom(
	input [7:0] address_i,
	output [7:0] instruction_o
);

reg [7:0] instruction_output;
assign instruction_o = instruction_output;

always_comb begin
	case(address_i)
		// START PROGRAM 2
		8'b00000000  : instruction_output = 8'b11000000; // clr a0
		8'b00000001  : instruction_output = 8'b11000010;	// clr a2
		8'b00000010 : instruction_output = 8'b11000011; // clr a3
		8'b00000011 : instruction_output = 8'b00010001;	// addi a0, 1
		8'b00000100: instruction_output = 8'b01000010;	// shl, a0, 2
		8'b00000101: instruction_output = 8'b00010001;	// addi a0, 1	
		8'b00000110: instruction_output = 8'b00010001;	// addi a0, 1
		8'b00000111: instruction_output = 8'b00100100;	// ld a1, a0	
		8'b00001000: instruction_output = 8'b00100100;	// fuck you tullsen
		8'b00001001: instruction_output = 8'b01000111;	// shl, a1, 3
		8'b00001010: instruction_output = 8'b01000101;	// shl, a1, 1
		8'b00001011: instruction_output = 8'b11110000;	// OUTER_LOOOP
		8'b00001100: instruction_output = 8'b01000101;	// shl, a1, 1
		8'b00001101: instruction_output = 8'b01110000;	// jmp OUTER_LOOOP
		default: instruction_output = 8'b11111111;
	endcase
end
endmodule

module inst_rom(
	input [7:0] address_i,
	output [7:0] instruction_o
);

reg [7:0] instruction_output;
assign instruction_o = instruction_output;

always_comb begin
	case(address_i)
		// START PROGRAM 2
		8'b00000000: instruction_output = 8'b11000000;  // clr a0
		8'b00000001: instruction_output = 8'b11000010;  // clr a2
		8'b00000010: instruction_output = 8'b11000011;  // clr a3
		8'b00000011: instruction_output = 8'b00010001;	// addi a0, 1
		8'b00000100: instruction_output = 8'b01000010;	// shl, a0, 2
		8'b00000101: instruction_output = 8'b00010001;	// addi a0, 1	
		8'b00000110: instruction_output = 8'b00010001;	// addi a0, 1
		8'b00000111: instruction_output = 8'b00100100;	// ld a1, a0	
		8'b00001000: instruction_output = 8'b00100100;	// nop
		8'b00001001: instruction_output = 8'b01000111;	// shl, a1, 3
		8'b00001010: instruction_output = 8'b01000101;	// shl, a1, 1
		8'b00001011: instruction_output = 8'b11110000;	// OUTER_LOOOP
		8'b00001100: instruction_output = 8'b10010010;	// pushv a2
		8'b00001101: instruction_output = 8'b11000010;	// clr a2
		8'b00001110: instruction_output = 8'b00011001;	// addi a2, 1
		8'b00001111: instruction_output = 8'b01001011;	// shl, a2, 3
		8'b00010000: instruction_output = 8'b00111110;	// st, a3, a2
		8'b00010001: instruction_output = 8'b10100010;	// popv a2
		8'b00010010: instruction_output = 8'b11000000;	// clr a0
		8'b00010011: instruction_output = 8'b00010001;	// addi a0, 1
		8'b00010100: instruction_output = 8'b01000011;	// shl, a0, 3
		8'b00010101: instruction_output = 8'b01000011;	// shl, a0, 3
		8'b00010110: instruction_output = 8'b10000011;	// sub, a0, a3
		8'b00010111: instruction_output = 8'b10010000;	// pushv a0
		8'b00011000: instruction_output = 8'b01100100;	// beq0 exit
		8'b00011001: instruction_output = 8'b11000000;  // clr a0
		8'b00011010: instruction_output = 8'b00010001;	// addi a0, 1
		8'b00011011: instruction_output = 8'b01000011;	// shl, a0, 3
		8'b00011100: instruction_output = 8'b01000010;	// shl, a0, 2
		8'b00011101: instruction_output = 8'b00000011;  // add a0, a3
		8'b00011110: instruction_output = 8'b00101100;	// ld a3, a0
		8'b00011111: instruction_output = 8'b00101100;	// nop
		8'b00100000: instruction_output = 8'b11000000;	// clr a0
		8'b00100001: instruction_output = 8'b00000011;  // add a0, a3
		8'b00100010: instruction_output = 8'b11000011;  // clr a3
		8'b00100011: instruction_output = 8'b00011101;	// addi a3, 1;
		8'b00100100: instruction_output = 8'b01001110;	// shl, a3, 2
		8'b00100101: instruction_output = 8'b11110001;	// INNERLOOP
		8'b00100110: instruction_output = 8'b10010011;	// pushv a3
		8'b00100111: instruction_output = 8'b01100010;	// beq0 end_inner
		8'b00101000: instruction_output = 8'b11010001;	// cmp4 a0, a1
		8'b00101001: instruction_output = 8'b01100011;	// beq0 not_equal
		8'b00101010: instruction_output = 8'b00011001;	// addi a2, 1
		8'b00101011: instruction_output = 8'b11110010;	// END_INNER
		8'b00101100: instruction_output = 8'b10010010;	// pushv a2
		8'b00101101: instruction_output = 8'b11000010;	// clr a2
		8'b00101110: instruction_output = 8'b00011001;	// addi a2, 1
		8'b00101111: instruction_output = 8'b01001011;	// shl a2, 3
		8'b00110000: instruction_output = 8'b00101110;	// ld  a3, a2
		8'b00110001: instruction_output = 8'b00101110;	// ld  a3, a2
		8'b00110010: instruction_output = 8'b10100010;	// popv a2
		8'b00110011: instruction_output = 8'b00011101;	// addi a3, 1
		8'b00110100: instruction_output = 8'b01110000;	// jmp outerloop
		8'b00110101: instruction_output = 8'b11110011;	// NOT_EQUAL
		8'b00110110: instruction_output = 8'b00011111;	// addi a3, -1
		8'b00110111: instruction_output = 8'b01000001;	// shl a0, 1
		8'b00111000: instruction_output = 8'b01110001;	// jmp innerloop
		8'b00111001: instruction_output = 8'b11110100;	// EXIT
		8'b00111010: instruction_output = 8'b11000000;  // clr a0
		8'b00111011: instruction_output = 8'b00010001;  // addi a0, 1
		8'b00111100: instruction_output = 8'b01000011;  // shl a0, 3
		8'b00111101: instruction_output = 8'b00010011;  // addi a0, -1
		8'b00111110: instruction_output = 8'b00111000;  // st a2, a0
		8'b00111111: instruction_output = 8'b11100000;  // halt
		default: instruction_output = 8'b11111111;
	endcase
end
endmodule

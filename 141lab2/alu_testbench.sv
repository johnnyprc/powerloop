module alu_testbench();
reg [3:0] opcode;
reg [7:0] alu_rs1;
reg [7:0] alu_rs2;
reg [1:0] constant;
wire [7:0] aluOut;
wire overflow;

initial begin

		
	// TEST ADD: set rs2 = 255 and test overflow
	opcode = 4'b0000;
	alu_rs1 = 8'b00000001;
	alu_rs2 = 8'b11111111;
	constant = 2'b00;
	
	// TEST ADD: set rs2 = 4 and test 1 + 4
	#10 alu_rs2 = 8'b00000100; 
	
	
	// TEST ADDDI: set const to -1. 4 + -1
	#10 opcode = 4'b0001;
	constant = 2'b11;
	
	// TEST ADDI: set const to 1. 4 + 1
	#10 constant = 2'b01;
	
	// TEST SUB: 4 - 1
	#10 opcode = 4'b0010;
	
	// TEST SUB: 1 - 4
	#10 alu_rs1 = 8'b00000001;
	alu_rs2 = 8'b00000100;
	
	// TEST SHL: rs1 << 1
	#10 opcode = 4'b0011;
	
	// TEST LT: rs1(1) < rs2(4) = 1
	#10 opcode = 4'b0100;
	
	// TEST LT: rs(1) < rs2(-4) = 0
	#10 alu_rs2 = 8'b10000100;
	 
	// TEST EQ0: set rs1 to 0. beq0 on rs1
	#10 alu_rs1 = 8'b00000000;
	opcode = 4'b0101;
	
	// TEST CMP4: set rs1 adn rs2 to 1000. output = 1
	#10 alu_rs2 = 8'b00000000;
	opcode = 4'b0110;
	
	// TEST CMP4: set rs1 to 0000. output = 0
	#10 alu_rs2 = 8'b01000000;
	
	// TEST XOR: 111 xor 110. output = 1
	#10 alu_rs1 = 8'b00000111;
	alu_rs2 = 8'b00000110;
	opcode = 4'b0111;
	
	// TEST AND: 111 and 110. output = 110
	#10 opcode = 4'b1000;
	
	// TEST OR: 111 OR 110. output = 111
	#10 opcode = 4'b1001;
	
	// TEST NOT: set rs1 to 0. output = 255
	#10 opcode = 4'b1010;
	alu_rs1 = 8'b00000000;
end


alu	b2v_inst2(
	.alu_rs1(alu_rs1),
	.alu_rs2(alu_rs2),
	.constant(constant),
	.opcode(opcode),
	.overflow(overflow),
	.aluOut(aluOut));
endmodule
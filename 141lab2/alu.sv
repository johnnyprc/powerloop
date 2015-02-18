module alu(
	input [3:0] opcode,
	input [7:0] alu_rs1,
	input	[7:0] alu_rs2,
	input [1:0] constant,
	output	[7:0] aluOut,
	output	overflow,
	output 	branch_taken_o
);

reg [7:0] alu_out;
reg [8:0] sum;
reg of;
reg taken;
assign aluOut = alu_out;
assign overflow = of;
assign branch_taken_o = taken;

always_comb begin
	case(opcode)
		4'b0000:	begin
					sum = alu_rs1 + alu_rs2;
					of = sum[8];
					alu_out = sum[7:0];
		end//add
		4'b0001: alu_out = $signed(alu_rs1) + $signed(constant);//addi
		4'b0010: alu_out = alu_rs1 - alu_rs2;		//sub
		4'b0011: alu_out = alu_rs1<<constant; //shl 
		4'b0100: alu_out = $signed(alu_rs1) < $signed(alu_rs2); //stl 
		4'b0101: taken = (alu_rs1 == 0);		//eq0
		4'b0110: alu_out = (alu_rs1[7:4] == alu_rs2[7:4]);	//cmp4
		4'b0111: alu_out = alu_rs1^alu_rs2;			//xor
		4'b1000: alu_out = 8'b0;					//clr
		4'b1001: alu_out = alu_rs1|alu_rs2;			//or
		4'b1010: alu_out = ~alu_rs1;				//not
		4'b1011: begin
			alu_out = alu_rs1;
			taken = 1;	
		end 	//jmp
		4'b1100: alu_out = alu_rs1;					//magic
	endcase
end

endmodule
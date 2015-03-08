module alu(
	input [3:0] opcode,
	input [7:0] alu_rs1,
	input	[7:0] alu_rs2,
	input [1:0] constant,
	input [7:0] startAddr_i,
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
					taken = 0;
					end//add
		4'b0001: begin
					alu_out = $signed(alu_rs1) + $signed(constant);  //addi
					taken = 0;
					end
		4'b0010: begin
					alu_out = alu_rs1 - alu_rs2;		//sub
					taken = 0;
					end
		4'b0011: begin
					alu_out = alu_rs1<<constant; //shl 
					taken = 0;
					end
		4'b0100: begin
					alu_out = $signed(alu_rs1) < $signed(alu_rs2); //stl 
					taken = 0;
					end
		4'b0101: begin
					label_addr(startAddr_i, alu_rs1, alu_out);
					taken = (alu_rs2 == 0);		//beq0
					end
		4'b0110: begin
					alu_out = (alu_rs1[7:4] == alu_rs2[7:4]);	//cmp4
					taken = 0;
					end
		4'b0111: begin
					alu_out = alu_rs1^alu_rs2;			//xor
					taken = 0;
					end
		4'b1000: begin
					alu_out = 8'b0;					//clr
					taken = 0;
					end
		4'b1001: begin
					alu_out = alu_rs1|alu_rs2;			//or
					taken = 0;
					end
		4'b1010: begin
					alu_out = ~alu_rs1;				//not
					taken = 0;
					end
		4'b1011: begin
					label_addr(startAddr_i, alu_rs1, alu_out);
					taken = 1;	
					end 	//jmp
		4'b1100: begin
					alu_out = alu_rs1;					//magic
					taken = 0;
					end
		4'b1111: taken = 0;		//nop, set taken to 0
	endcase
end

task label_addr;
	input [7:0] startPt;
	input [7:0] label_num;
	output [7:0]  label_address;
		case(startPt)
			8'b0: begin
				case(label_num)	
					//8'b0:    label_address = 8'b00000101;
					8'b0:    label_address = 8'b00001011; //loop1
					8'b1:    label_address = 8'b00010110; //st_loop2
					8'b10:   label_address = 8'b00100011; //lowBitL
					8'b11:   label_address = 8'b00101110; //st_HBL
					8'b100:  label_address = 8'b00110111; //HBLO
					8'b101:  label_address = 8'b01000010; //HBLI
					8'b110:  label_address = 8'b01001101; //EndInner
					8'b111:  label_address = 8'b01010100; //exit
				endcase
			end
			8'b01000000: begin
				case(label_num)
					8'b0:  label_address = 8'b00001011; //loop1
					8'b1:  label_address = 8'b01010010; //st_loop2
					8'b10:  label_address = 8'b01011111; //lowBitL
					8'b11:  label_address = 8'b01100110; //st_HBL
					8'b100:  label_address = 8'b01101110; //HBLO
					8'b101:  label_address = 8'b01111000; //HBLI
					8'b110:  label_address = 8'b01111111; //EndInner
					8'b111:  label_address = 8'b10000011; //exit
				endcase
			end
			default:
					label_address = 8'bxxxxxxxx;
		endcase
endtask

endmodule
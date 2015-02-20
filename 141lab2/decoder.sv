module decoder(
	input [7:0] instr,
	output	[3:0] alu_op_o,
	output	[2:0] regSource1_o,
	output	[2:0] regSource2_o,
	output	[2:0] regDest_o,
	output 	[3:0] branchAddr_o,
	output 	memRead_o,
	output   memWrite_o,
	output	labelRead_o,
	output 	labelWrite_o,
	output	[1:0] constant_o,
	output 	regWrite_o,
	output	halt_o,
	output 	branch_o,
	output	another_mem_o
);


reg [3:0] alu_op;
reg [2:0] regSource1;
reg [2:0] regSource2;
reg [2:0] regDest;
reg [3:0] branchAddr;
reg memRead;
reg memWrite;
reg labelRead;
reg labelWrite;
reg [1:0] constant;
reg regWrite;
reg halt;
reg branch;
reg mem_write_again;

assign alu_op_o = alu_op;
assign regSource1_o = regSource1;
assign regSource2_o = regSource2;
assign regDest_o = regDest;
assign branchAddr_o = branchAddr;
assign memRead_o = memRead;
assign memwrite_o = memWrite;
assign labelRead_o = labelRead;
assign labelWrite_o = labelWrite;
assign constant_o = constant;
assign regWrite_o = regWrite;
assign halt_o = halt;
assign branch_o = branch;
assign another_mem_o = mem_write_again;

always_comb begin
	case(instr[7:4]) 
		4'b0: begin //add
			alu_op = 4'b0000;
			regSource1 = instr[3:2];
			regSource2 = instr[1:0];
			regDest = instr[3:2];
			branchAddr = 4'b0;
			memRead = 0;
			mem_write_again = 0;
			labelRead = 0;
			labelWrite = 0;
			constant = 0;
			regWrite = 1;
			halt = 0;
			branch = 0;
		end
		4'b1: begin //addi
			alu_op = 4'b0001;
			regSource1 = instr[3:2];
			regDest = instr[3:2];
			branchAddr = 4'b0;
			memRead = 0;
			mem_write_again = 0;
			labelRead = 0;
			labelWrite = 0;
			constant = instr[1:0];
			regWrite = 1;
			branch = 0;
			halt = 0;
		end
		4'b10: begin //ld
			alu_op = 4'b1111;
			regSource2 = instr[1:0];
			regDest = instr[3:2];
			branchAddr = 4'b0;
			memRead = 1;
			mem_write_again = 0;
			labelRead = 0;
			labelWrite = 0;
			constant = 0;
			regWrite = 1;
			branch = 0;
			mem_write_again = 0;
			halt = 0;
		end
		4'b11: begin //st
			alu_op = 4'b1111;
			regSource1 = instr[3:2];
			regSource2 = instr[1:0];
			branchAddr = 4'b0;
			memRead = 0;
			mem_write_again = 1;
			labelRead = 0;
			labelWrite = 0;
			constant = 0;
			regWrite = 0;	
			branch = 0;	
			halt = 0;
		end
		4'b100: begin //shl
			alu_op = 4'b0011;
			regSource1 = instr[3:2];
			regDest = instr[3:2];
			branchAddr = 4'b0;
			memRead = 0;
			mem_write_again = 0;
			labelRead = 0;
			labelWrite = 0;
			constant = instr[1:0];
			regWrite = 1;
			branch = 0;		
			halt = 0;
		end
		4'b101: begin //stl
	
		end
		4'b110: begin //beq0
			alu_op = 4'b0101;
			branchAddr = instr[3:0];
			memRead = 0;
			mem_write_again = 0;
			labelRead = 1;
			labelWrite = 0;
			constant = 0;
			regWrite = 0;		
			branch = 1;
			halt = 0;
		end
		4'b111: begin //j
			alu_op = 4'b1011;
			branchAddr = instr[3:0];
			memRead = 0;
			mem_write_again = 0;
			labelRead = 1;
			labelWrite = 0;
			constant = 0;
			regWrite = 0;
			branch = 0;
			halt = 0;
		end
		4'b1000: begin //sub
			alu_op = 4'b0010;
			regSource1 = instr[3:2];
			regSource2 = instr[1:0];
			regDest = instr[3:2];
			branchAddr = 4'b0;
			memRead = 0;
			mem_write_again = 0;
			labelRead = 0;
			labelWrite = 0;
			constant = 0;
			regWrite = 1;
			branch = 0;
			halt = 0;
		end
		4'b1001: begin //pushv
			alu_op = 4'b1100;
			regSource1 = instr[2:0];
			regDest = 3'b100;				//v0 at 4
			branchAddr = 4'b0;
			memRead = 0;
			mem_write_again = 0;
			labelRead = 0;
			labelWrite = 0;
			constant = 0;
			regWrite = 1;
			branch = 0;
			halt = 0;
		end
		4'b1010: begin //popv
			alu_op = 4'b1100;
			regSource1 = 3'b100;
			regDest = instr[2:0];				
			branchAddr = 4'b0;
			memRead = 0;
			mem_write_again = 0;
			labelRead = 0;
			labelWrite = 0;
			constant = 0;
			regWrite = 1;
			branch = 0;	
			halt = 0;	
		end
		4'b1011: begin //addrc
			alu_op = 4'b0000;
			regSource1 = instr[3:2];
			regSource2 = 3'b101;
			regDest = instr[3:2];
			branchAddr = 4'b0;
			memRead = 0;
			mem_write_again = 0;
			labelRead = 0;
			labelWrite = 0;
			constant = 0;
			regWrite = 1;
			branch = 0;
			halt = 0;
		end
		4'b1100: begin //clr
			alu_op = 4'b1000;
			regSource1 = instr[2:0];
			regDest = instr[2:0];
			branchAddr = 4'b0;
			memRead = 0;
			mem_write_again = 0;
			labelRead = 0;
			labelWrite = 0;
			constant = 0;
			regWrite = 1;
			branch = 0;
			halt = 0;
		end
		4'b1101: begin //cmp4
			alu_op = 4'b0110;
			regSource1 = instr[3:2];
			regSource2 = instr[1:0];
			regDest = 3'b100;
			branchAddr = 4'b0;
			memRead = 0;
			mem_write_again = 0;
			labelRead = 0;
			labelWrite = 0;
			constant = 0;
			regWrite = 1;
			branch = 0;
			halt = 0;
		end
		4'b1110: begin //halt
			halt = 1;
			branch = 0;
		end
		4'b1111: begin //TBD
			alu_op = 4'b1111;
			regDest = instr[2:0];				
			branchAddr = 4'b0;
			memRead = 0;
			mem_write_again = 0;
			labelRead = 0;
			labelWrite = 0;
			constant = 0;
			regWrite = 0;
			branch = 0;
			halt = 0;
		end
	endcase
end

endmodule
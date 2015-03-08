module forward_unit(
	input [2:0] rs1,
	input [2:0] rs2,
	input [2:0] mem_rd,
	input [7:0] mem_data,
	input [2:0] wb_rd,
	input [7:0] wb_data,
	input overflow,
	output reg [7:0] data_out1,
	output reg [7:0] data_out2,
	output reg forward_rs1,
	output reg forward_rs2
);
always @ (*) begin
	if(rs1 == mem_rd) begin
		forward_rs1 = 1;
		data_out1 = mem_data;
	end
	else if(rs1 == wb_rd) begin
		forward_rs1 = 1;
		data_out1 = wb_data;
	end
	else
		forward_rs1 = 0;
		
	if(rs2 == mem_rd) begin
		forward_rs2 = 1;
		data_out2 = mem_data;
	end
	else if(rs2 == wb_rd) begin
		forward_rs2 = 1;
		data_out2 = wb_data;
	end
	else
		forward_rs2 = 0;
		
	if(rs2 == 3'b101) begin
		data_out2 = overflow;
		forward_rs2 = 1;
	end
end

endmodule
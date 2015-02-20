module fetch_unit(
	input f_clk,
	input [7:0] pc_i,
	input start,
	input [7:0] start_addr,
	input branch,
	input [7:0] target,
	input taken,
	input halt,
	output [7:0] pc_o
);

reg [7:0] pc, pc_next;
assign pc_o = pc_next;

always_ff @(posedge f_clk) begin
	if (start == 1)
		pc_next = start_addr;
	else if (halt == 0) begin
		if (taken == 1)
			pc <= target;
		else
			pc <= pc_next;
		
		if (start == 1)
			pc_next <= start_addr;
		else
			pc_next <= pc + 1;
	end
end


endmodule
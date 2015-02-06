module fetch_unit(
	input f_clk,
	input [7:0] pc_i,
	input start,
	input [7:0] start_addr,
	input branch,
	input [7:0] target,
	input taken,
	output [7:0] pc_o
);

reg [7:0] pc, pc_next;
assign pc_o = pc_next;

always_comb begin
	if (start == 1)
		pc_next = start_addr;
	
	if (taken == 1)
		pc_next = target;
	else if(taken == 0 && start != 1)
		pc_next = pc + 1;
end

always_ff @(posedge f_clk)
	pc <= pc_next;

endmodule
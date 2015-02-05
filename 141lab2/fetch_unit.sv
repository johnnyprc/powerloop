module fetch_unit(
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
		pc = start_addr;
	else
		pc = pc_i;
	
	if (branch == 1 && taken == 1)
		pc_next = target;
	else
		pc_next = pc + 1;
end

endmodule
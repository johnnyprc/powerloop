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
reg [32:0] cycleCounter;
assign pc_o = pc_next;

initial begin
	cycleCounter = 0;
end


always_comb begin
	if (start == 1) begin
		pc_next = start_addr;
	end
	else if (halt == 0) begin
		if (taken == 1)
			pc_next = target;
		else if (start == 1)
			pc_next = start_addr;
		else
			pc_next = pc + 1;
		

	end
end

always_ff @(posedge f_clk) begin
	pc <= pc_next;	
	cycleCounter <= (cycleCounter + 1);
end


endmodule
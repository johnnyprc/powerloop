module fetch_unit_testbench();
reg f_clk;
reg [7:0] pc_i;
reg start;
reg [7:0] start_addr;
reg branch;
reg [7:0] target;
reg taken;
 
wire [7:0] pc_o;

initial begin
f_clk = 1;
taken = 0;
start = 1;
start_addr = 8'b0;
#10 start = 0;
#10 taken = 1;
target = 8'b101;
#10 taken = 0;
end

always begin
	#5 f_clk = ~f_clk;
end

fetch_unit	b2v_inst3(
	.f_clk(f_clk),
	.start(start),
	.branch(branch),
	.taken(taken),
	.pc_i(pc_i),
	.start_addr(start_addr),
	.target(target),
	.pc_o(pc_o));

endmodule
module fetch_unit_testbench();

reg [7:0] pc_i;
reg start;
reg [7:0] start_addr;
reg branch;
reg [7:0] target;
reg taken;
 
wire [7:0] pc_o;

initial begin

end

fetch_unit	b2v_inst3(
	.start(start),
	.branch(branch),
	.taken(taken),
	.pc_i(pc_i),
	.start_addr(start_add),
	.target(target),
	.pc_o(pc_o));
	
endmodule
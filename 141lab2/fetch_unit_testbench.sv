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
start_addr = 8'b00000000;
pc_i = 8'b00000000;


#10 start = 0;
end

always begin
	#5 f_clk = ~f_clk;
end

fetch_unit	b2v_inst(
	.f_clk(f_clk),
	.start(start),
	
	.taken(SYNTHESIZED_WIRE_0),
	.halt(SYNTHESIZED_WIRE_1),
	.pc_i(SYNTHESIZED_WIRE_29),
	.start_addr(start_addr),
	.target(SYNTHESIZED_WIRE_30),
	.pc_o(SYNTHESIZED_WIRE_29));


alu	b2v_inst13(
	.alu_rs1(SYNTHESIZED_WIRE_30),
	.alu_rs2(SYNTHESIZED_WIRE_31),
	.constant(SYNTHESIZED_WIRE_6),
	.opcode(SYNTHESIZED_WIRE_7),
	.overflow(SYNTHESIZED_WIRE_12),
	.branch_taken_o(SYNTHESIZED_WIRE_0),
	.aluOut(SYNTHESIZED_WIRE_23));


single_port_ram_with_init	b2v_inst15(
	.writemem(SYNTHESIZED_WIRE_8),
	.readmem(SYNTHESIZED_WIRE_32),
	
	.addr(SYNTHESIZED_WIRE_31),
	.data(SYNTHESIZED_WIRE_30),
	.q(SYNTHESIZED_WIRE_22));
	defparam	b2v_inst15.ADDR_WIDTH = 8;


register_file	b2v_inst16(
	.clk(f_clk),
	.condition_bit(SYNTHESIZED_WIRE_12),
	.reg_write(SYNTHESIZED_WIRE_13),
	.label_read(SYNTHESIZED_WIRE_14),
	.label_write(SYNTHESIZED_WIRE_33),
	.label_rs(SYNTHESIZED_WIRE_16),
	.rd(SYNTHESIZED_WIRE_17),
	.rs1(SYNTHESIZED_WIRE_18),
	.rs2(SYNTHESIZED_WIRE_19),
	.write_data(SYNTHESIZED_WIRE_20),
	.regA_o(SYNTHESIZED_WIRE_30),
	.regB_o(SYNTHESIZED_WIRE_31));


mux_0	b2v_inst17(
	.sel(SYNTHESIZED_WIRE_32),
	.in1(SYNTHESIZED_WIRE_22),
	.in2(SYNTHESIZED_WIRE_23),
	.out(SYNTHESIZED_WIRE_27));


inst_rom	b2v_inst2(
	.address_i(SYNTHESIZED_WIRE_29),
	.instruction_o(SYNTHESIZED_WIRE_28));


mux_1	b2v_inst233(
	.sel(SYNTHESIZED_WIRE_33),
	.in1(SYNTHESIZED_WIRE_29),
	.in2(SYNTHESIZED_WIRE_27),
	.out(SYNTHESIZED_WIRE_20));


decoder	b2v_inst7(
	.instr(SYNTHESIZED_WIRE_28),
	.memRead_o(SYNTHESIZED_WIRE_32),
	.memWrite_o(SYNTHESIZED_WIRE_8),
	.labelRead_o(SYNTHESIZED_WIRE_14),
	.labelWrite_o(SYNTHESIZED_WIRE_33),
	.regWrite_o(SYNTHESIZED_WIRE_13),
	.halt_o(SYNTHESIZED_WIRE_1),
	.alu_op_o(SYNTHESIZED_WIRE_7),
	.branchAddr_o(SYNTHESIZED_WIRE_16),
	.constant_o(SYNTHESIZED_WIRE_6),
	.regDest_o(SYNTHESIZED_WIRE_17),
	.regSource1_o(SYNTHESIZED_WIRE_18),
	.regSource2_o(SYNTHESIZED_WIRE_19));

endmodule
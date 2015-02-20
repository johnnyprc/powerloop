module totalTestbench();
	reg f_clk;
	reg [7:0] pc_i;
	reg start;
	reg [7:0] start_addr;

	

initial begin
	start = 1;
	start_addr = 8'b00000000;
	f_clk = 0;

	#15 start = 0;

end

always begin
	#5 f_clk = ~f_clk; 
end

wire	[7:0] SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_32;
wire	[7:0] SYNTHESIZED_WIRE_33;
wire	[7:0] SYNTHESIZED_WIRE_34;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_16;
wire	[3:0] SYNTHESIZED_WIRE_17;
wire	[2:0] SYNTHESIZED_WIRE_18;
wire	[2:0] SYNTHESIZED_WIRE_19;
wire	[2:0] SYNTHESIZED_WIRE_20;
wire	[7:0] SYNTHESIZED_WIRE_21;
wire	[7:0] SYNTHESIZED_WIRE_24;
wire	[7:0] SYNTHESIZED_WIRE_25;
wire	[1:0] SYNTHESIZED_WIRE_28;
wire	[3:0] SYNTHESIZED_WIRE_29;





inst_rom	b2v_inst(
	.address_i(SYNTHESIZED_WIRE_30),
	.instruction_o(SYNTHESIZED_WIRE_25));


fetch_unit	b2v_inst123455(
	.f_clk(f_clk),
	.start(start),
	
	.taken(SYNTHESIZED_WIRE_1),
	.halt(SYNTHESIZED_WIRE_2),
	.pc_i(SYNTHESIZED_WIRE_30),
	.start_addr(start_addr),
	.target(SYNTHESIZED_WIRE_31),
	.pc_o(SYNTHESIZED_WIRE_30));


single_port_ram_with_init	b2v_inst15(
	.writemem(SYNTHESIZED_WIRE_5),
	.readmem(SYNTHESIZED_WIRE_32),
	.clk(f_clk),
	.addr(SYNTHESIZED_WIRE_33),
	.data(SYNTHESIZED_WIRE_34),
	.q(SYNTHESIZED_WIRE_10));
	defparam	b2v_inst15.ADDR_WIDTH = 8;


mux_0	b2v_inst17(
	.sel(SYNTHESIZED_WIRE_32),
	.in1(SYNTHESIZED_WIRE_10),
	.in2(SYNTHESIZED_WIRE_31),
	.out(SYNTHESIZED_WIRE_24));


register_file	b2v_inst2(
	.clk(f_clk),
	.condition_bit(SYNTHESIZED_WIRE_12),
	.reg_write(SYNTHESIZED_WIRE_13),
	.label_read(SYNTHESIZED_WIRE_14),
	.label_write(SYNTHESIZED_WIRE_35),
	.branch_i(SYNTHESIZED_WIRE_16),
	.label_rs(SYNTHESIZED_WIRE_17),
	.rd(SYNTHESIZED_WIRE_18),
	.rs1(SYNTHESIZED_WIRE_19),
	.rs2(SYNTHESIZED_WIRE_20),
	.write_data(SYNTHESIZED_WIRE_21),
	.regA_o(SYNTHESIZED_WIRE_34),
	.regB_o(SYNTHESIZED_WIRE_33));


mux_1	b2v_inst233(
	.sel(SYNTHESIZED_WIRE_35),
	.in1(SYNTHESIZED_WIRE_30),
	.in2(SYNTHESIZED_WIRE_24),
	.out(SYNTHESIZED_WIRE_21));


decoder	b2v_inst6(
	.instr(SYNTHESIZED_WIRE_25),
	.memRead_o(SYNTHESIZED_WIRE_32),
	
	.labelRead_o(SYNTHESIZED_WIRE_14),
	.labelWrite_o(SYNTHESIZED_WIRE_35),
	.regWrite_o(SYNTHESIZED_WIRE_13),
	.halt_o(SYNTHESIZED_WIRE_2),
	.branch_o(SYNTHESIZED_WIRE_16),
	.another_mem_o(SYNTHESIZED_WIRE_5),
	.alu_op_o(SYNTHESIZED_WIRE_29),
	.branchAddr_o(SYNTHESIZED_WIRE_17),
	.constant_o(SYNTHESIZED_WIRE_28),
	.regDest_o(SYNTHESIZED_WIRE_18),
	.regSource1_o(SYNTHESIZED_WIRE_19),
	.regSource2_o(SYNTHESIZED_WIRE_20));


alu	b2v_inst7(
	.alu_rs1(SYNTHESIZED_WIRE_34),
	.alu_rs2(SYNTHESIZED_WIRE_33),
	.constant(SYNTHESIZED_WIRE_28),
	.opcode(SYNTHESIZED_WIRE_29),
	.startAddr_i(start_addr),
	.overflow(SYNTHESIZED_WIRE_12),
	.branch_taken_o(SYNTHESIZED_WIRE_1),
	.aluOut(SYNTHESIZED_WIRE_31));
	
endmodule
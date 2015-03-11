module totalTestbench();
	reg f_clk;
	reg start;
	reg [7:0] start_addr;
	reg halt;

	

initial begin
	start = 1;
	start_addr = 8'b00000000; //P1
	//start_addr = 8'b01011110; //P2
	//start_addr = 8'b10101011; //P3
	halt = 0;
	f_clk = 0;
	#15 start = 0;

end

always begin
	#5 f_clk = ~f_clk; 
end

wire	[7:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[3:0] SYNTHESIZED_WIRE_7;
wire	[1:0] SYNTHESIZED_WIRE_8;
wire	[7:0] SYNTHESIZED_WIRE_9;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	[2:0] SYNTHESIZED_WIRE_11;
wire	[2:0] SYNTHESIZED_WIRE_61;
wire	[2:0] SYNTHESIZED_WIRE_62;
wire	[7:0] SYNTHESIZED_WIRE_14;
wire	[7:0] SYNTHESIZED_WIRE_63;
wire	[1:0] SYNTHESIZED_WIRE_16;
wire	[3:0] SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_64;
wire	[7:0] SYNTHESIZED_WIRE_20;
wire	[7:0] SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	[7:0] SYNTHESIZED_WIRE_66;
wire	[2:0] SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_67;
wire	[7:0] SYNTHESIZED_WIRE_31;
wire	[2:0] SYNTHESIZED_WIRE_68;
wire	[7:0] SYNTHESIZED_WIRE_34;
wire	[2:0] SYNTHESIZED_WIRE_39;
wire	[2:0] SYNTHESIZED_WIRE_40;
wire	[7:0] SYNTHESIZED_WIRE_69;
wire	[2:0] SYNTHESIZED_WIRE_70;
wire	SYNTHESIZED_WIRE_43;
wire	[7:0] SYNTHESIZED_WIRE_44;
wire	[7:0] SYNTHESIZED_WIRE_45;
wire	[7:0] SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	[7:0] SYNTHESIZED_WIRE_71;
wire	SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_54;
wire	SYNTHESIZED_WIRE_55;
wire	[3:0] SYNTHESIZED_WIRE_56;





IFID	b2v_inst(
	.clk(f_clk),
	.instruction(SYNTHESIZED_WIRE_0),
	.instruction_o(SYNTHESIZED_WIRE_46));


mux_0	b2v_inst10(
	.sel(SYNTHESIZED_WIRE_1),
	.in1(SYNTHESIZED_WIRE_2),
	.in2(SYNTHESIZED_WIRE_3),
	.out(SYNTHESIZED_WIRE_63));


IDEX	b2v_inst11(
	.clk(f_clk),
	.memRead_i(SYNTHESIZED_WIRE_4),
	.memWrite_i(SYNTHESIZED_WIRE_5),
	.regWrite_i(SYNTHESIZED_WIRE_6),
	.alu_op(SYNTHESIZED_WIRE_7),
	.constant_i(SYNTHESIZED_WIRE_8),
	.data_in1(SYNTHESIZED_WIRE_9),
	.data_in2(SYNTHESIZED_WIRE_10),
	.data_rd(SYNTHESIZED_WIRE_11),
	.rs1(SYNTHESIZED_WIRE_61),
	.rs2(SYNTHESIZED_WIRE_62),
	.memRead_o(SYNTHESIZED_WIRE_23),
	.memWrite_o(SYNTHESIZED_WIRE_24),
	.regWrite_o(SYNTHESIZED_WIRE_25),
	.alu_op_o(SYNTHESIZED_WIRE_17),
	.constant_o(SYNTHESIZED_WIRE_16),
	.data_out1(SYNTHESIZED_WIRE_45),
	.data_out2(SYNTHESIZED_WIRE_3),
	.data_rd_o(SYNTHESIZED_WIRE_27),
	.rs1_o(SYNTHESIZED_WIRE_39),
	.rs2_o(SYNTHESIZED_WIRE_40));


alu	b2v_inst12(
	.alu_rs1(SYNTHESIZED_WIRE_14),
	.alu_rs2(SYNTHESIZED_WIRE_63),
	.constant(SYNTHESIZED_WIRE_16),
	.opcode(SYNTHESIZED_WIRE_17),
	.startAddr_i(start_addr),
	.overflow(SYNTHESIZED_WIRE_22),
	.branch_taken_o(SYNTHESIZED_WIRE_47),
	.aluOut(SYNTHESIZED_WIRE_66));


single_port_ram_with_init	b2v_inst14(
	.writemem(SYNTHESIZED_WIRE_18),
	.readmem(SYNTHESIZED_WIRE_64),
	.clk(f_clk),
	.addr(SYNTHESIZED_WIRE_20),
	.data(SYNTHESIZED_WIRE_65),
	.q(SYNTHESIZED_WIRE_34));
	defparam	b2v_inst14.ADDR_WIDTH = 8;


EXMEM	b2v_inst16(
	.clk(f_clk),
	.overflow_i(SYNTHESIZED_WIRE_22),
	.memRead_i(SYNTHESIZED_WIRE_23),
	.memWrite_i(SYNTHESIZED_WIRE_24),
	.regWrite_i(SYNTHESIZED_WIRE_25),
	.data_in(SYNTHESIZED_WIRE_66),
	.data_rd_i(SYNTHESIZED_WIRE_27),
	.memAddr_i(SYNTHESIZED_WIRE_63),
	.overflow_o(SYNTHESIZED_WIRE_67),
	.memRead_o(SYNTHESIZED_WIRE_64),
	.memWrite_o(SYNTHESIZED_WIRE_18),
	.regWrite_o(SYNTHESIZED_WIRE_29),
	.data_out(SYNTHESIZED_WIRE_65),
	.data_rd_o(SYNTHESIZED_WIRE_68),
	.memAddr_o(SYNTHESIZED_WIRE_20));


MEMWB	b2v_inst17(
	.clk(f_clk),
	.regWrite_i(SYNTHESIZED_WIRE_29),
	.overflow_i(SYNTHESIZED_WIRE_67),
	.data_i(SYNTHESIZED_WIRE_31),
	.data_rd_i(SYNTHESIZED_WIRE_68),
	.regWrite_o(SYNTHESIZED_WIRE_53),
	.overflow_o(SYNTHESIZED_WIRE_52),
	.data_o(SYNTHESIZED_WIRE_69),
	.data_rd_o(SYNTHESIZED_WIRE_70));


mux_1	b2v_inst18(
	.sel(SYNTHESIZED_WIRE_64),
	.in1(SYNTHESIZED_WIRE_34),
	.in2(SYNTHESIZED_WIRE_65),
	.out(SYNTHESIZED_WIRE_31));


forward_unit	b2v_inst19(
	.overflow(SYNTHESIZED_WIRE_67),
	.mem_data(SYNTHESIZED_WIRE_65),
	.mem_rd(SYNTHESIZED_WIRE_68),
	.rs1(SYNTHESIZED_WIRE_39),
	.rs2(SYNTHESIZED_WIRE_40),
	.wb_data(SYNTHESIZED_WIRE_69),
	.wb_rd(SYNTHESIZED_WIRE_70),
	.forward_rs1(SYNTHESIZED_WIRE_43),
	.forward_rs2(SYNTHESIZED_WIRE_1),
	.data_out1(SYNTHESIZED_WIRE_44),
	.data_out2(SYNTHESIZED_WIRE_2));


mux_2	b2v_inst2(
	.sel(SYNTHESIZED_WIRE_43),
	.in1(SYNTHESIZED_WIRE_44),
	.in2(SYNTHESIZED_WIRE_45),
	.out(SYNTHESIZED_WIRE_14));


decoder	b2v_inst4(
	.instr(SYNTHESIZED_WIRE_46),
	.memRead_o(SYNTHESIZED_WIRE_4),
	.memWrite_o(SYNTHESIZED_WIRE_5),
	.labelRead_o(SYNTHESIZED_WIRE_54),
	.regWrite_o(SYNTHESIZED_WIRE_6),
	.halt_o(SYNTHESIZED_WIRE_48),
	.branch_o(SYNTHESIZED_WIRE_55),
	.alu_op_o(SYNTHESIZED_WIRE_7),
	.branchAddr_o(SYNTHESIZED_WIRE_56),
	.constant_o(SYNTHESIZED_WIRE_8),
	.regDest_o(SYNTHESIZED_WIRE_11),
	.regSource1_o(SYNTHESIZED_WIRE_61),
	.regSource2_o(SYNTHESIZED_WIRE_62));


fetch_unit	b2v_inst5(
	.f_clk(f_clk),
	.start(start),
	
	.taken(SYNTHESIZED_WIRE_47),
	.halt(SYNTHESIZED_WIRE_48),
	.pc_i(SYNTHESIZED_WIRE_71),
	.start_addr(start_addr),
	.target(SYNTHESIZED_WIRE_66),
	.pc_o(SYNTHESIZED_WIRE_71));


inst_rom	b2v_inst6(
	.address_i(SYNTHESIZED_WIRE_71),
	.instruction_o(SYNTHESIZED_WIRE_0));


register_file	b2v_inst7(
	.clk(f_clk),
	.condition_bit(SYNTHESIZED_WIRE_52),
	.reg_write(SYNTHESIZED_WIRE_53),
	.label_read(SYNTHESIZED_WIRE_54),
	.branch_i(SYNTHESIZED_WIRE_55),
	.label_rs(SYNTHESIZED_WIRE_56),
	.rd(SYNTHESIZED_WIRE_70),
	.rs1(SYNTHESIZED_WIRE_61),
	.rs2(SYNTHESIZED_WIRE_62),
	.write_data(SYNTHESIZED_WIRE_69),
	.regA_o(SYNTHESIZED_WIRE_9),
	.regB_o(SYNTHESIZED_WIRE_10));


endmodule
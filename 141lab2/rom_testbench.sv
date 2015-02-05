module rom_testbench();

reg [7:0] address_i;
wire[7:0] instruction_o;

initial begin

	//TEST input address = 1
	#10 address_i = 8'b1;
	
	//TEST input address = 2
	#10 address_i = 8'b10;
	
	//TEST input address = 3
	#10 address_i = 8'b11;
	
	//TEST input address = 4
	#10 address_i = 8'b100;

end

inst_rom	b2v_inst4(
	.address_i(address_i),
	.instruction_o(instruction_o));

endmodule
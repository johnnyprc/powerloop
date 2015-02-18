module mux(
	input	[7:0] in1,
	input [7:0] in2,
	input	sel,
	output [7:0] out
);

reg [7:0] o;
assign out = o;

always_comb begin
	if(sel)
		o = in1;
	else
		o = in2;
end

endmodule
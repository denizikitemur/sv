module half_adder(
    input  logic a, b,
    output logic S, C
);
assign S = a ^ b ;
assign C = a & b ;
endmodule

module full_adder(
	input a, b, c,
	output Cout, Sout
);

	logic C1, S1, C2, S2;
	half_adder half_adder1(.a(a),.b(b),.C(C1),.S(S1));
	half_adder half_adder2(.a(S1),.b(c),.C(C2),.S(S2));
	assign Cout = (C1|C2);
	assign Sout = S2;
	endmodule
	
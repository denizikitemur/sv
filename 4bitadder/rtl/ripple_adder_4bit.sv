
module half_adder(
    input  logic a, b,
    output logic S, C
);
assign S = a ^ b ;
assign C = a & b ;
endmodule

module full_adder(
	input a, b, c,
	output C, Sout
);

	logic C1, S1, C2, S2;
	half_adder half_adder1(.a(a),.b(b),.C(C1),.S(S1));
	half_adder half_adder2(.a(S1),.b(c),.C(C2),.S(S2));
	assign C = (C1|C2);
	assign Sout = S2;
	endmodule
	
module ripple_adder_4bit(
		input [3:0] A,
		input [3:0] B,
		input C0,
		output [3:0] S, 
		output C4
		);
		
	logic C1, C2, C3;
	full_adder full_adder0(.a(A[0]),.b(B[0]),.c(C0),.C(C1),.Sout(S[0]));
	full_adder full_adder1(.a(A[1]),.b(B[1]),.c(C1),.C(C2),.Sout(S[1]));
	full_adder full_adder2(.a(A[2]),.b(B[2]),.c(C2),.C(C3),.Sout(S[2]));
	full_adder full_adder3(.a(A[3]),.b(B[3]),.c(C3),.C(C4),.Sout(S[3]));
	endmodule

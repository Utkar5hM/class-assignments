module FullAdder(input A, B, Ci,output S, Co);
	assign S = Ci^(A^B);
	assign Co = (A&B) | Ci&(A^B);
endmodule

module FourBitAdder(input [3:0]A, B,
		    input Ci,
		    output [3:0]S, 
		    output Co);
	wire  C1, C2,C3;
	FullAdder FA1(.A(A[0]),.B(B[0]),.Ci(Ci),.S(S[0]),.Co(C1));
	FullAdder FA2(.A(A[1]),.B(B[1]),.Ci(C1),.S(S[1]),.Co(c2));
	FullAdder FA3(.A(A[2]),.B(B[2]),.Ci(c2),.S(S[2]),.Co(c3));
	FullAdder FA4(.A(A[3]),.B(B[3]),.Ci(c3),.S(S[3]),.Co(Co));

endmodule


	
module Mux_2_1(input A, B, S0, output reg Y);
	always @(*)
	begin
	if(S0==1) Y =A;
	else Y = B;
	end
endmodule

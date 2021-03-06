module Majority4Var(input A, B, C, D, output Y);
assign Y =  ~((~(A|B))|(~(A|C))|(~(A|D))|(~(B|C))|(~(B|D))|(~(C|D))); 
endmodule
/*201EC164*/
module Majority4VarTest();
	reg A, B, C, D;
	reg [1:0] inp;
	integer a,b,c,d;
	assign inp[0] =0;
	assign inp[1] =1;
	wire Y;
Major4B test(.A(A), .B(B), .C(C), .D(D), .Y(Y));
initial
begin
	for(a=0;a<2;a=a+1)
	begin	for(b=0;b<2;b=b+1)
		begin	for(c=0;c<2;c=c+1)
			begin	for(d=0;d<2;d=d+1)
				begin	A=inp[a]; B=inp[b];
					C=inp[c]; D=inp[d];
					#100;
				end
			end
		end
	end
end
endmodule
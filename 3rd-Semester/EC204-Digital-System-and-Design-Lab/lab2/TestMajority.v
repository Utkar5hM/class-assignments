module testMajority();
	reg A, B, C, D;
	reg [1:0] inp;
	integer a,b,c,d;
	assign inp[0] =0;
	assign inp[1] =1;
	wire Y;
Majority4B test(.A(A), .B(B), .C(C), .D(D), .Y(Y));
initial
begin
	for(a=0;a<2;a=a+1)
	begin	for(b=0;b<2;b=b+1)
		begin	for(c=0;c<2;c=c+1)
			begin	for(d=0;d<2;d=d+1)
				begin
				#100
				A=inp[a]; B=inp[b];
				C=inp[c]; D=inp[d];
				end
			end
		end
	end
end
endmodule
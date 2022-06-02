module twofourdecoder ( 
input [1:0] X, 
output [3:0] Y
);
assign Y[0] = ~X[0] & ~X[1];
assign Y[1] = ~X[1] & X[0];
assign Y[2] = X[1] & ~X[0];
assign Y[3] = X[1] & X[0];
endmodule 

module testfunction();
	reg [1:0] X;
	wire [3:0]Y;
	integer a;
twofourdecoder test(.X(X), .Y(Y));
initial
begin
	for(a=0;a<4;a=a+1)
	begin	
		assign X=a; #100;
		
	end
end
endmodule
module testbench1();
reg X, clk, resetn;
wire Y;
wire [2:0] m1cs, m1ns, m2cs, m2ns;
reg [15:0] testinput;
integer i;
comp2gen ut(.X(X),.clk(clk),.resetn(resetn),.Y(Y), .m1cs(m1cs), .m1ns(m1ns), .m2cs(m2cs), .m2ns(m2ns));
initial
begin
	X=0; clk=1;
	resetn=1; #1; resetn=0; #1; resetn=1;
	testinput = 16'b0100110101010101; 
	for( i=15; i>=0; i=i-1)begin
		X = testinput[i];
		clk =1; #20; 
clk =0; #20;		
	end
end
endmodule

module signedmultiplier_tb();
reg clk, resetn, start;
reg [3:0] A, B;
wire [7:0] P;
wire done;
signedmultiplier ut(.clk(clk), .resetn(resetn), .start(start), .A(A), .B(B), .P(P), .done(done));
initial
begin
	clk=0;resetn=0; 
	#20; clk=1; 
	A=4'b1100; B= 4'b0111;
	#20 resetn=1; clk=0; start=1'b1;
	#20 clk =1; #20 clk=0;
	#20 clk =1; #20 clk=0;
	#20 clk =1; #20 clk=0;
	#20 clk =1; #20 clk=0;
	#20 clk =1; #20 clk=0;
	#20 clk =1; #20 clk=0;
	#20 clk =1; #20 clk=0;
end
endmodule
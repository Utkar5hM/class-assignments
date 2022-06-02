
module dot_product_tb();
reg[7:0] X, Y;
wire [7:0] Z;
wire done;
reg clk, resetn;
integer i;
dot_product ut(.clk(clk), .resetn(resetn),.X(X), .Y(Y), .Z(Z), .done(done));

initial 
begin
	clk=0;resetn=0; 
	#20; clk=1; 
	X = 8'b01000001;
	Y = 8'b01010101;
	#20 resetn=1; clk=0; 
	for(i=0; i<10; i=i+1) begin
		#20 clk =1; #20 clk=0;
		end
end
endmodule
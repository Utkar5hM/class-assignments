
module testbench1();
integer i;
reg clk,  resetn, xin;
reg [31:0] testinput;
wire y, z;
sequenceMealy ut(.clk(clk), .resetn(resetn), .xin(xin) ,.y(y), .z(z));
initial
begin	
	resetn=1;#1; resetn=0; #1; resetn=1;
	testinput = 32'b01010101001010101010101010101110;
	for( i=0; i<32; i=i+1)begin
	xin = testinput[i];	
	clk =1; #20; clk =0; #20;
	end
end
endmodule
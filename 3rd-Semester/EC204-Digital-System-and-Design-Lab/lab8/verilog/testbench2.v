
module testbench2();
integer i;
reg clk,  resetn, onein, twoin, fivein;
reg [31:0] testinput1;
wire water, change;
vendingMachine ut(.clk(clk), .resetn(resetn), .onein(onein), .twoin(twoin), .fivein(fivein), .water(water), .change(change));
initial
begin	
	resetn=1;#1; resetn=0; #1; resetn=1;
	testinput1 = 32'b00010011101000110111100111011110;
	for( i=0; i<30; i=i+1)begin
	fivein = testinput1[i];
	twoin = testinput1[i+1];
	onein = testinput1[i+2];
	clk =1; #20; clk =0; #20;
	end
end
endmodule

module testbench_2();
integer i;
reg clk, counter_on, resetn, load, counter_up;
reg [7:0] data_in;
wire [7:0] count;
wire TC;
twoDigitDecadeCounter d1(counter_up,
load, resetn, counter_on,
clk, data_in, count, TC);
initial
begin
	resetn=1;#1; resetn=0; #1; resetn=1;
	load=0; data_in =8'b01001000;
	counter_on=1; counter_up =1;
	for( i=0; i<20; i=i+1)begin
	clk =1; #20; clk =0; #20;	
	end
	load =1;
	clk =1; #20; clk =0; #20; load =0;	
	counter_up =0;
	for( i=0; i<20; i=i+1)begin
	clk =1; #20; clk =0; #20;	
	end
end
endmodule

module testbench_3();
integer i;
reg resetn, clk, PCload, PCinc;
reg [3:0] load_in;
wire [3:0] PC;
programCounter pc1(resetn, clk, PCload, PCinc, load_in, PC);
initial
begin
	resetn=1;#1; resetn=0; #1; resetn=1;
	PCload=0; load_in =4'b0100;
	PCinc=1;
	for( i=0; i<12; i=i+1)begin
	clk =1; #20; clk =0; #20;	
	end
	PCload =1;
	clk =1; #20; clk =0; #20; PCload =0;	
	for( i=0; i<6; i=i+1)begin
	clk =1; #20; clk =0; #20;	
	end
end
endmodule
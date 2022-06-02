module testbench_6();
integer i;
reg resetn, clk;
wire [7:0] Q;
pseudoRandomSeqGenerator ut(resetn, clk, Q);
initial
begin
	resetn=1;#1; resetn=0; #1; resetn=1;
	for( i=0; i<50; i=i+1)begin
	clk =1; #20; clk =0; #20;
	end
end
endmodule
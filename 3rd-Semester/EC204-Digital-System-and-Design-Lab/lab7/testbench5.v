
module testbench_5();
integer i;
reg resetn, clk;
wire [3:0] Q;
rignCounterSelfCorrecting ut(clk, resetn,Q);
initial
begin
	resetn=1;#1; resetn=0; #1; resetn=1;
	for( i=0; i<12; i=i+1)begin
	clk =1; #20; clk =0; #20;	
	end
end
endmodule
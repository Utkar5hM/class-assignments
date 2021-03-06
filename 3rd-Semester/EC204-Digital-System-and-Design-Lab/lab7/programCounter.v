module programCounter(reset, clk, PCload, PCinc, load_in, PC);
parameter n=4;
input reset, clk, PCload, PCinc;
input [n-1:0] load_in;
output reg [n-1:0] PC;

always @(negedge reset, posedge clk)
begin
	if(!reset) PC <= 0;
	else if (PCload) PC <= load_in;
	else if(PCinc) PC <= PC+1;
end
endmodule
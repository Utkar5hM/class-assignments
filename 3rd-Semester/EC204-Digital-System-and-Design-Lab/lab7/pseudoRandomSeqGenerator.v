
module pseudoRandomSeqGenerator( resetn, clk, Q);
parameter n =8;
input resetn, clk;
output reg [n-1:0] Q;

always @(negedge resetn, posedge clk)
begin
	if(!resetn) Q<={1'b1, {n-2{1'b0}}};
	else begin 
		Q <= Q >> 1;
		Q[n-1] <= Q[7] ^ Q[3] ^ Q[2] ^Q[1];
	end
end
endmodule
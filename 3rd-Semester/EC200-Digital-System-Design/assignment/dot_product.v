module dot_product #(parameter N=8)(input clk, resetn, input[N-1:0] X, Y, output reg [N-1:0] Z, output reg done);
reg [N-1:0] Xin, Yin;
integer count;
always @(posedge clk, negedge resetn)
begin	
	done =1'b0;
	if(!resetn) begin  Z=0;  Xin=X; Yin=Y; count=0; end
	else begin
		Z[N-1] = Xin[0]&Yin[0];
		Xin = Xin>>1;
		Yin = Yin>>1;
		Z = Z >> 1;
		count =count+1;
		if(count==N) done=1'b1;
	end
end
endmodule


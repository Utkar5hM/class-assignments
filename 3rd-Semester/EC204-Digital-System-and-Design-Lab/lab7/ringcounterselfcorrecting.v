
module rignCounterSelfCorrecting(input clk,
 input resetn,
 output reg [3:0] Q);

always @(negedge resetn, posedge clk)
begin
	if(!resetn) Q <= 4'b1000;
	else if(Q==4'b1000 || Q==4'b0100 || Q==4'b0010) Q <= Q >> 1;
	else Q<=4'b1000;
end
endmodule
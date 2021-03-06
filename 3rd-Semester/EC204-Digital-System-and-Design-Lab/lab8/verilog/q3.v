
module vendingMachine(input clk, resetn, onein, twoin, fivein, output reg water, output reg change);
localparam [2:0] S0=0, S1=1, S2=2, S3=3, S4=4, S5=5;
reg [1:0] cur_state, nxt_state;
//update state register
always @ (posedge clk or negedge resetn)
begin
	if (!resetn) cur_state <= S0;
	else cur_state <= nxt_state;
end
//Compute next state(NSD)
always @(onein or twoin or fivein or cur_state)
begin
	nxt_state = S0;
	case(cur_state)
	S0: begin
	if(fivein) nxt_state= S3;
	else if (twoin) nxt_state = S2;
	else if (onein) nxt_state = S1;
	else nxt_state = S0;
	end	
	S1: begin
	if(fivein) nxt_state= S4;
	else if (twoin) nxt_state = S0;
	else if (onein) nxt_state = S2;
	else nxt_state = S1;
	end
	S2: begin
	if(fivein) nxt_state= S5;
	else if (twoin) nxt_state = S0;
	else if (onein) nxt_state = S0;
	else nxt_state = S1;
	end
	S3: nxt_state = S0;
	S4: nxt_state = S3;
	S5: nxt_state = S4;
	endcase
end
//compute output (OD)
always @ (onein or twoin or fivein or cur_state)
begin
	water=1'b0; change=1'b0;
	case(cur_state)
	S0: begin
	if(fivein) begin water=1'b1; change=1'b1; end
	else begin water=1'b0; change=1'b0; end
	end
	S1: begin
	if(fivein) begin water=1'b1; change=1'b1; end
	else if(twoin) begin water=1'b1; change=1'b0; end
	else begin water=1'b0; change=1'b0; end
	end
	S2: begin
	if(fivein) begin water=1'b1; change=1'b1; end
	else if(twoin) begin water=1'b1; change=1'b1; end
	else if(onein) begin water=1'b1; change=1'b0; end
	else begin water=1'b0; change=1'b0; end
	end
	S3: begin water=1'b0; change=1'b1; end
	S4: begin water=1'b0; change=1'b1; end
	S5: begin water=1'b0; change=1'b1; end
	endcase
end
endmodule
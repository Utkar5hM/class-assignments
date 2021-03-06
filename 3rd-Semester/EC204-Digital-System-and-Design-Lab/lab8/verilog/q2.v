
module sequenceMealy(input clk, resetn, xin,output reg y, output reg z);
localparam [2:0] S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6, S7=7;
reg [1:0] cur_state, nxt_state;
//update state register
always @ (posedge clk or negedge resetn)
begin
	if (!resetn) cur_state <= S0;
	else cur_state <= nxt_state;
end
//Compute next state(NSD)
always @(xin or cur_state)
begin
	nxt_state = S0;
	case(cur_state)
	S0: if(xin) nxt_state= S1; else nxt_state = S4;
	S1: if(xin) nxt_state= S1; else nxt_state = S2;
	S2: if(xin) nxt_state= S3; else nxt_state = S2;
	S3: if(xin) nxt_state= S5; else nxt_state = S2;
	S4: if(xin) nxt_state= S3; else nxt_state = S4;
	S5: if(xin) nxt_state= S6; else nxt_state = S5;
	S6: if(xin) nxt_state= S7; else nxt_state = S6;
	S7: if(xin) nxt_state= S5; else nxt_state = S6;
	endcase
end
//compute output (OD)
always @ (xin or cur_state)
begin
	y=1'b0; z=1'b0;
	case(cur_state)
	S0: begin y=1'b0; z=1'b0; end
	S1: begin y=1'b0; z=1'b0; end
	S2: begin if(xin) begin y=1'b1; z=1'b0; end else y=1'b0; z=1'b0; end
	S3: begin if(xin) begin y=1'b0; z=1'b1; end else y=1'b0; z=1'b0; end
	S4: begin y=1'b0; z=1'b0; end
	S5: begin y=1'b0; z=1'b0; end
	S6: begin y=1'b0; z=1'b0; end
	S7: begin if(xin) begin y=1'b0; z=1'b1; end else y=1'b0; z=1'b0; end
	endcase
end
endmodule
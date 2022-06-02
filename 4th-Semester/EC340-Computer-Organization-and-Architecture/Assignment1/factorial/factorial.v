module factorial (input [2:0]a, input clock, resetn, output reg [12:0] out, output reg done);
reg [3:0] state, next_state;
reg [2:0] count;
reg [12:0] out_next;

always @(posedge clock, negedge resetn)
begin
	if(!resetn) begin out <=1;state<=0; end
	else begin
	state <= next_state; 
	out <= out_next;
	end
end

always @ (state) begin
	count <=a;
	case(state)
	0: begin
			if(count<=state+1) begin next_state <= 7; end
			else begin next_state <= 1;
			done <=0;
			out_next <= 1*out;
			end
		end
	1: begin
			if(count<=state+1) begin next_state <= 7; end
			else begin next_state <= 2;
			end
			done <=0;
			out_next <= 2*out;
		end
	2: begin
			if(count<=state+1) begin next_state <= 7; end
			else begin next_state <= 3;
			end
			done <=0;
			out_next <= 3*out;
		end
	3: begin
			if(count<=state+1) begin next_state <= 7; end
			else begin next_state <= 4;
			end
			done <=0;
			out_next <= 4*out;
		end
	4: begin
			if(count<=state+1) begin next_state <= 7; end
			else begin next_state <= 5;
			end
			done <=0;
			out_next <= 5*out;
		end
	5: begin
			if(count<=state+1) begin next_state <= 7; end
			else begin next_state <= 6;
			end
			done <=0;
			out_next <= 6*out;
		end
	6: begin
			if(count<=state+1) begin next_state <= 7; end
			else begin next_state <= 7;
			end
			done <=0;
			out_next <= 7*out;
		end
	7: begin
			next_state <= 7;
			done <=1;
		end
	endcase
end
endmodule
module decade_counter (count_up, reset, load, counter_on, clk, data_in, count, TC);
input count_up, reset, load, counter_on, clk;
input [3:0] data_in;
output reg [3:0]count;
output reg TC;

localparam [3:0] s0=4'b0000, s1=4'b0001, s2=4'b0010, s3=4'b0011, s4=4'b0100,s5=4'b0101, s6=4'b0110 , s7=4'b0111, s8=4'b1000, s9=4'b1001;
reg [3:0] state, next_state;
always @ (posedge clk or negedge reset) begin
	if(!reset) begin state<= s0; end
	else if(load) begin
		state <= data_in;
	end else if(counter_on) state<= next_state;
end

always @(state) begin
	case(state)
	s0: begin if(count_up) begin next_state <= s1; TC<=0; end
				else begin next_state <= s9;  TC<=1; end
				count<= 0;
		end
	s1: begin if(count_up)begin next_state <= s2; end else begin next_state <= s0; end count <= 1; TC<=1; end
	s2: begin if(count_up)begin next_state <= s3; end else begin next_state <= s1; end count <= 2; TC<=0; end
	s3: begin if(count_up)begin next_state <= s4; end else begin next_state <= s2; end count <= 3; TC<=0; end
	s4: begin if(count_up)begin next_state <= s5; end else begin next_state <= s3; end count <= 4; TC<=0; end
	s5: begin if(count_up)begin next_state <= s6; end else begin next_state <= s4; end count <= 5; TC<=0; end
	s6: begin if(count_up)begin next_state <= s7; end else begin next_state <= s5; end count <= 6; TC<=0; end
	s7: begin if(count_up)begin next_state <= s8; end else begin next_state <= s6; end count <= 7; TC<=0; end
	s8: begin if(count_up)begin next_state <= s9; end else begin next_state <= s7; end count <= 8; TC<=0; end
	s9: begin if(count_up)begin next_state <= s0; TC<=1; end else begin next_state <= s8; TC<=0; end count <= 9;  end	
	default: begin next_state <=s0; count <=0; TC=0; end
	endcase
end
endmodule
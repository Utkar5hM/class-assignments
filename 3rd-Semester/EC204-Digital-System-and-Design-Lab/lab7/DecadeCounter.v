module decadeCounter(input counter_up,
input load,
input resetn,
input counter_on,
input clk,
input [3:0] data_in,
output reg [3:0] count,
output reg TC);

always@(negedge resetn, posedge clk)
begin
	if(load) count <= data_in;
	else if(!resetn) begin TC<= 0; count <= 0; end
	else if(counter_on) begin
		if(counter_up) begin
		if(count<9) count <= count + 1;
		else count <= 0;
		if(count==9) TC <=1;
		else TC<=0;
		end else begin
		if(count>0) count <= count - 1;
		else count <= 9;
		if(count==0) TC <=1;
		else TC<=0;
		end
	end
end
endmodule

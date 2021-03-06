module signedmultiplier(input clk, resetn, start, input [3:0]A, B, output reg [7:0] P, output reg done);
localparam S0=0, S1=1, S2=2, S3=3, S4=4, S5=5;
reg [2:0] state_d, state_q;
reg [3:0] B_d, B_q;
reg [7:0] A_d, A_q, pdt_d, pdt_q;
assign P = pdt_q;
always @ (posedge clk , negedge resetn)
begin
	if(!resetn) state_q <=S0;
	else begin
	state_q <= state_d;
	pdt_q <=pdt_d;
	A_q <= A_d;
	B_q <= B_d;
	end
end

always @(*) begin
	state_d = state_q;
	done = 1'b0;
	case(state_q)
		S0:if(start) state_d=S1;
		S1: state_d=S2;
		S2: state_d=S3;
		S3: state_d=S4;
		S4: state_d=S5;
		S5: begin
		done= 1'b1;
		if(start)state_d =S1;
		end
		default: state_d=S0;
	endcase
end

always @(*)
begin
pdt_d = pdt_q; A_d = A_q; B_d = B_q;
case (state_q)
S0: begin
pdt_d = {8{1'b0}};
A_d = A;
B_d = B;
end
S1: begin
A_d = A_q << 1;
B_d = B_q >> 1;
if (B_q[0] == 1'b1) begin
	if(A[3] == 1'b1) pdt_d = {4'b1111,A_q[3:0]} +pdt_q; 
	else pdt_d = A_q + pdt_q;
	end
end
S2: begin
A_d = A_q << 1;
B_d = B_q >> 1;
if (B_q[0] == 1'b1) begin
	if(A[3] == 1'b1) pdt_d = {3'b111,A_q[4:1], 1'b0} +pdt_q; 
	else pdt_d = A_q + pdt_q;
	end
end
S3: begin
A_d = A_q << 1;
B_d = B_q >> 1;
if (B_q[0] == 1'b1) begin
	if(A[3] == 1'b1) pdt_d = {2'b11,A_q[5:2], 2'b00} +pdt_q; 
	else pdt_d = A_q + pdt_q;
	end
end
S4: begin
	A_d = A_q << 1;
	B_d = B_q >> 1;
	if (B_q[0] == 1'b1) begin
		if(B[3] == 1'b1) pdt_d = {1'b0, (~A+1'b1),3'b000} +pdt_q; 
		else if(A[3] == 1'b1) pdt_d = {1'b1,A_q[6:3], 3'b000} +pdt_q; 
		else pdt_d = A_q + pdt_q;
	end
end
default: pdt_d = pdt_q;
endcase
end
endmodule
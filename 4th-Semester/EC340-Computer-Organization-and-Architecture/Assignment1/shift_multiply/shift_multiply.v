module shift_multiply(input clk, resetn, start, input [7:0]A, B, output [15:0] P, output reg done);
localparam S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6, S7=7, S8=8, S9=9;
reg [4:0] state_d, state_q;
reg [7:0] B_d, B_q;
reg [15:0] A_d, A_q, pdt_d, pdt_q;
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
		S5: state_d=S6;
		S6: state_d=S7;
		S7: state_d=S8;
		S8: state_d=S9;
		S9: begin
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
pdt_d = {16{1'b0}};
A_d = A;
B_d = B;
end
S1: begin
A_d = A_q << 1;
B_d = B_q >> 1;
if (B_q[0] == 1'b1) begin
	if(A[7] == 1'b1) pdt_d = {8'b11111111,A_q[7:0]} +pdt_q; 
	else pdt_d = A_q + pdt_q;
	end
end
S2: begin
A_d = A_q << 1;
B_d = B_q >> 1;
if (B_q[0] == 1'b1) begin
	if(A[7] == 1'b1) pdt_d = {7'b1111111,A_q[8:1], 1'b0} +pdt_q; 
	else pdt_d = A_q + pdt_q;
	end
end
S3: begin
A_d = A_q << 1;
B_d = B_q >> 1;
if (B_q[0] == 1'b1) begin
	if(A[7] == 1'b1) pdt_d = {6'b111111,A_q[9:2], 2'b00} +pdt_q; 
	else pdt_d = A_q + pdt_q;
	end
end
S4: begin
A_d = A_q << 1;
B_d = B_q >> 1;
if (B_q[0] == 1'b1) begin
	if(A[7] == 1'b1) pdt_d = {5'b11111,A_q[10:3], 3'b000} +pdt_q; 
	else pdt_d = A_q + pdt_q;
	end
end
S5: begin
A_d = A_q << 1;
B_d = B_q >> 1;
if (B_q[0] == 1'b1) begin
	if(A[7] == 1'b1) pdt_d = {4'b1111,A_q[11:4], 4'b0000} +pdt_q; 
	else pdt_d = A_q + pdt_q;
	end
end
S6: begin
A_d = A_q << 1;
B_d = B_q >> 1;
if (B_q[0] == 1'b1) begin
	if(A[7] == 1'b1) pdt_d = {3'b111,A_q[12:5], 5'b00000} +pdt_q; 
	else pdt_d = A_q + pdt_q;
	end
end
S7: begin
A_d = A_q << 1;
B_d = B_q >> 1;
if (B_q[0] == 1'b1) begin
	if(A[7] == 1'b1) pdt_d = {2'b11,A_q[13:6], 6'b000000} +pdt_q; 
	else pdt_d = A_q + pdt_q;
	end
end

S8: begin
	A_d = A_q << 1;
	B_d = B_q >> 1;
	if (B_q[0] == 1'b1) begin
		if(B[3] == 1'b1) pdt_d = {1'b0, (~A+1'b1),7'b0000000} +pdt_q; 
		else if(A[3] == 1'b1) pdt_d = {1'b1,A_q[15:8], 7'b0000000} +pdt_q; 
		else pdt_d = A_q + pdt_q;
	end
end
default: pdt_d = pdt_q;
endcase
end
endmodule
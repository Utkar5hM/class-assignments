module test_bench();
reg clk, resetn, start;
reg [7:0] A, B;
wire [15:0] P;
wire done;
integer i;
shift_multiply ut(.clk(clk), .resetn(resetn), .start(start), .A(A), .B(B), .P(P), .done(done));
initial
begin
	clk=0;resetn=0; 
	#2; clk=1; 
	A=8'b00101011; B= 8'b01001101;
	#2 resetn=1; clk=0; start=1'b1;
	for(i=0; i<=9;i=i+1) begin
	#20 clk =1; #20 clk=0;
	end
end
endmodule
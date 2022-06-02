module testbench_4();
integer i;
reg clk, MRn, Dsr, Dsl;
reg [1:0] S;
reg [3:0] P;
wire [3:0] Q;
shiftRegister74194 ut(MRn, clk, Dsr, Dsl,
  S, P, Q);
initial
begin
	MRn=1;#1; MRn=0; #1; MRn=1;
	P =4'b1000;
	S=2'b01;
	Dsr=1; Dsl=1;
	for( i=0; i<10; i=i+1)begin
	clk =1; #20; clk =0; #20;	
	end
	Dsr=0;
	for( i=0; i<10; i=i+1)begin
	clk =1; #20; clk =0; #20;	
	end
	S=2'b11;
	clk =1; #20; clk =0; #20; S=2'b10;
	for( i=0; i<10; i=i+1)begin
	clk =1; #20; clk =0; #20;	
	end
	Dsl=0;
	for( i=0; i<10; i=i+1)begin
	clk =1; #20; clk =0; #20;	
	end
end
endmodule
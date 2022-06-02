module tb2();
reg a, b, clk, start, resetn;
wire [7:0]sum;
wire done, c;
reg [7:0] testinputx, testinputy;
integer i;
serial_adder ut(.ain(a), .bin(b), .clk(clk), .start(start), .resetn(resetn),.sum(sum),
.done(done), .c(c));
initial
begin
//giving starting default values
a=0; b=0; start=1; clk=0;
//setting teh module at reset.
resetn=1; #1; resetn=0; #1; resetn=1;
//input values for x and y, from left to right.
testinputx = 8'b01010110;
testinputy = 8'b10110010;
//cyclic inputs x and y transversing the above values.
for( i=7; i>=0; i=i-1)begin
a = testinputx[i];
b = testinputy[i];
clk =1; #20;
clk =0; #20;
end
//additional cycles for computing the adder result.
for( i=7; i>=0; i=i-1)begin
clk =1; #20;
clk =0; #20;
end
end
endmodule

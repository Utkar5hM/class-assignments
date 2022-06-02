// sum output is at output reg sum and the carry of the sum is at output reg C.
module serial_adder(
input ain, bin, clk, start, resetn,
output [7:0] sum, output reg done, output  c);
//wires for connecting different modules
wire [7:0] rxQ, ryQ, rsQ;wire fas, fac, dffc;
reg [3:0] count =4'b1111;
reg [7:0] D =0;
reg load = 0;
//connecting wires from modules to output registers.
assign sum = rsQ;
assign c = fac;
shiftreg regX(.D(D), .load(load), .shiftR(!done),.lin(ain), .clk(clk), .Q(rxQ));
shiftreg regY(.D(D), .load(load), .shiftR(!done),.lin(bin), .clk(clk), .Q(ryQ));
shiftreg regSum(.D(D), .load(load), .shiftR(!done),.lin(fas), .clk(clk), .Q(rsQ));
fulladder fa(.a(rxQ[0]), .b(ryQ[0]), .cin(dffc), .sum(fas), .cout(fac));
dflipflop da(.d(fac), .reset(load), .clk(clk), .q(dffc));
//for decrementing counter and making a reset button for entire module.
always @(posedge clk, negedge resetn)
begin
if(!resetn) begin
load<= 1;
count<=15;
done<=0;
end else if(start) begin
load<= 0;
if(count >0) begin done <= 0;
count<= count -1;
	end
else done <=1;
end
end
endmodule
//single bit full adder module required.
module fulladder(input a, b, cin, output sum, cout);
assign sum = cin^(a^b);
assign cout = (a&b) | cin&(a^b);
endmodule
// D flip flop
module dflipflop(input d, reset, clk, output reg q);
always@(posedge clk, posedge reset)
begin
if(reset) q=0;
else begin
q=d;
end
end
endmodule
//8 bit shift register with load support.
module shiftreg (input [7:0]D, input load, shiftR, lin, clk, output reg [7:0]Q);

always @(posedge clk)
begin
if(load) Q<=D;
else if(shiftR) Q <= {lin, Q[7:1]};
end
endmodule
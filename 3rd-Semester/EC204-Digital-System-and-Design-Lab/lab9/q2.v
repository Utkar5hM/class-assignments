// sum output is at output reg sum and the carry of the sum is at output reg C.
module serial_adder(
input ain, bin, clock, start, resetn,
output reg [7:0] sum, output reg done, cout);
//wires for connecting different modules
wire [7:0] regxqwire, regyqwire, regsumqwire;
wire faSumWire, faCarryWire, dFFqCarry;
reg [3:0] counter =4'b1111;
reg [7:0] D =0;
reg load = 0, shiftR =1;
//connecting wires from modules to output registers.
assign sum = regsumqwire;
assign cout = faCarryWire;
assign shiftR = ~done;
shiftreg regX(.D(D), .load(load), .shiftR(shiftR),.lin(ain), .clock(clock), .Q(regxqwire));
shiftreg regY(.D(D), .load(load), .shiftR(shiftR),.lin(bin), .clock(clock), .Q(regyqwire));
shiftreg regSum(.D(D), .load(load), .shiftR(shiftR),.lin(faSumWire), .clock(clock), .Q(regsumqwire));
fulladder fa(.a(regxqwire[0]), .b(regyqwire[0]), .cin(dFFqCarry), .sum(faSumWire), .cout(faCarryWire));
dff da(.d(faCarryWire), .reset(load), .clock(clock), .q(dFFqCarry));
//for decrementing counter and making a reset button for entire module.
always @(posedge clock, negedge resetn)
begin
if(!resetn) begin
load<= 1;
counter<=15;
done<=0;
end else if(start) begin
load<= 0;
if(counter >0) begin done <= 0;
counter<= counter -1; 
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
module dff(input d, reset, clock, output reg q);
always@(posedge clock, posedge reset)
begin
if(reset) q=0;
else begin
q=d;
end
end
endmodule
//8 bit shift register with load support.
module rightshiftreg (input [7:0]D, input load, shiftR, lin, clock, output reg [7:0]Q);
always @(load)
begin
if(load) Q<=D;
end
always @(posedge clock)
begin
if(shiftR) Q <= {lin, Q[7:1]};
end
endmodule

module leftshiftreg (input [7:0]D, input load, shiftL, lin, clock, output reg [7:0]Q);
always @(load)
begin
if(load) Q<=D;
end
always @(posedge clock)
begin
if(shiftR) Q <= {Q[6:0]};
end
endmodule

// sum output is at output reg sum and the carry of the sum is at output reg C.
module serial_adder(
input [7:0]load_a, load_b, input clk, start, resetn,
output [7:0] sum, output reg done, output c);

//wires for connecting different modules
wire [7:0] rxQ, ryQ, rsQ;
wire fas, dffc;
reg [3:0] count =4'b1111;
reg [7:0] D =0;
reg load = 0;
reg ain =0, bin=0;

//connecting wires from modules to output registers.
shiftreg regX(.D(load_a), .load(load), .shiftR(!done),.lin(ain), .clk(clk), .Q(rxQ));
shiftreg regY(.D(load_b), .load(load), .shiftR(!done),.lin(bin), .clk(clk), .Q(ryQ));
shiftreg regSum(.D(D), .load(load), .shiftR(!done),.lin(fas), .clk(clk), .Q(sum));
fulladder fa(.a(rxQ[0]), .b(ryQ[0]), .cin(dffc), .sum(fas), .cout(c));
d_ff da(.d(c), .reset(load), .clk(clk), .q(dffc));

//for decrementing counter and making a reset button for entire module.
always @(posedge clk, negedge resetn)
	begin
	if(!resetn) begin
		load<= 1;
		count<=8;
		done<=0;
	end else if(start) begin
		load<= 0;
		if(count >0) begin done <= 0;
			count<= count -1; 
		end	else done <=1;
	end
end

endmodule


m
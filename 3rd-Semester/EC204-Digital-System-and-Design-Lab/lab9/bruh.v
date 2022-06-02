module serial_adder(input [7:0] load_a, load_b, input start, clock, output [7:0] sum, output reg done, output cout);

reg ain =0, bin =0;
reg [7:0] load_d =0;
wire fa_sum, dff_fa_c;
wire [7:0] a, b;
reg [3:0]state =0;

rshift_reg arsr(.data_in(load_a), .clock(clock), .lin(ain), .resetn(resetn), .Q(a));
rshift_reg brsr(.data_in(load_b), .clock(clock), .lin(bin), .resetn(resetn), .Q(b));
rshift_reg srsr(.data_in(load_d), .clock(clock), .lin(fa_sum), .resetn(resetn), .Q(sum));
d_flipflop d_ff(cout, resetn, clock, dff_fa_c);
full_adder fa(.a(a[0]), .b(b[0]), .cin(dff_fa_c), .s(fa_sum), .cout(cout));

always @(posedge clock, negedge resetn) begin
	if(!resetn) begin
	state <=0;
	done <=0;
	end else if(start)begin
	state <= state+1;
	if (state==7) done<=1;
	end
end
endmodule

module rshift_reg(input [7:0]data_in, input clock, lin, resetn, output reg [7:0] Q);
always @(posedge clock, negedge resetn) begin
	if(!resetn) Q<=data_in;
	else Q<= {lin, Q[7:1]};
end
endmodule

module d_flipflop (input d, resetn, clock, output reg q);
always @(posedge clock, negedge resetn) begin
	if(!resetn) begin
	q<=0;
	end else begin
	q<=d;
	end
end
endmodule

module full_adder(input a, b, cin, output s, cout);
assign {cout, s} = a + b + cin;
endmodule


module tb2();
reg [7:0] a, b;
reg clock, start, resetn;
wire [7:0]sum;
wire done, cout, s, c;
wire [7:0]rega, regb, regsum;
integer i;
serial_adder ut(a, b, start, clock,  sum, done, cout);
assign rega = ut.arsr.Q;
assign regb = ut.brsr.Q;
assign regs = ut.srsr.Q;
assign s = ut.fa.s;
assign c = ut.fa.cout;
initial
begin
//giving starting default values
a = 8'b01010110;
b = 8'b10110010; start=1; clock=1;
//setting teh module at reset.
resetn=1; #1; resetn=0; #1; resetn=1; clock=0; #1;
//additional cycles for computing the adder result.
for( i=0; i<8; i=i+1)begin
clock =1; #20;
clock =0; #20;
end
end
endmodule

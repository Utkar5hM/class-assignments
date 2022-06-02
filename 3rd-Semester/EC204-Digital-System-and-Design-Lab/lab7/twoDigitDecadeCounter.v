module twoDigitDecadeCounter(input counter_up,
input load,
input reset,
input counter_on,
input clk,
input [7:0] data_in,
output [7:0] count,
output TC);
wire n1;
decadeCounter cunit(counter_up,
 load,
 reset,
 counter_on,
 clk,
 data_in[3:0],
 count[3:0],
 n1);
decadeCounter cdigit(counter_up,
 load,
 reset,
 counter_on,
 n1,
 data_in[7:4],
 count[7:4],
 TC);
endmodule
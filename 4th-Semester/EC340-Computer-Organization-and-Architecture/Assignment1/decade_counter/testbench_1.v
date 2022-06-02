module testbench_1();
integer i;
reg clk, counter_on, reset, load, count_up;
reg [3:0] data_in;
wire [3:0] count;
wire TC;
decade_counter dc1(count_up, reset, load, counter_on, clk, data_in, count, TC);
initial
begin
counter_on=1; count_up =1;
reset=1; clk=1; #1; reset=0; #1 reset=1;
load=0; data_in =4'b1000;
for( i=0; i<10; i=i+1)begin
clk =1; #20; clk =0; #20;
end
load =1;
clk =1; #20; clk =0; #20; load =0;
count_up =0;
for( i=0; i<5; i=i+1)begin
clk =1; #20; clk =0; #20;
end
end
endmodule
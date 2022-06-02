module testbench();
reg [7:0] a, b;
reg k;
wire [7:0]  s;
wire cout;
add_sub asc(a, b, k, s, cout);
initial begin
 a=5; b=3; k=0;
#50 a=46; b=100; k=0;
#50 a=150; b=25; k=0;
#50 a=8'b01011100; b=8'b00011011; k=1;
#50 a=20; b=8'b10010000; k=0; #50;
end
endmodule
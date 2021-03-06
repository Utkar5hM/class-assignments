
module factorial_tb();
reg [2:0] x;
wire [15:0] y;
factorial ut (.x(x), .y(y));
initial begin
x = 3'b011; #25;
x = 3'b100; #25;
x = 3'b101; #25;
x = 3'b001; #25;
x = 3'b010; #25;
x = 3'b110; #25;
x = 3'b111; #25;
end
endmodule
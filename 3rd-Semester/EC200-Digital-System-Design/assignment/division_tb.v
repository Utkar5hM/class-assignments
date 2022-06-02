
module division_tb(); 
reg [7:0] X;
reg [7:0] Y;
wire [7:0] Out;
division ut(.X(X),.Y(Y),.Out(Out));
initial begin
X = 45; Y = 20; #25;
X = 80; Y = 64; #25;
X = 45; Y = 23; #25;
X = 77; Y = 3; #25;
X = 45; Y = 5; #25;
X = 90; Y = 120; #25;
end
endmodule
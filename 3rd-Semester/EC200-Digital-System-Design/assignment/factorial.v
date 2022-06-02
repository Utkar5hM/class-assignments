module factorial (input [2:0]x, output reg [15:0] y);
integer i;
always @ (x)
begin
    y = 1;
    i = 0;
    for(i=1;i<=x;i = i + 1) begin
    y = i * y;
    end
end
endmodule

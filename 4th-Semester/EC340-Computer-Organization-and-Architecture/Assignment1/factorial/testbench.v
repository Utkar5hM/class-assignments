module testbench();
reg [2:0] a;
reg clock, resetn;
wire [12:0] out;
wire done;
integer i;
factorial faccalc(a, clock, resetn, out, done);
initial begin
a=5;
resetn=1; clock =1;
#5 resetn=0; #5 resetn=1;
for(i=0; i<10; i=i+1)begin
	clock=1;#50; clock=0; #50;
end

end
endmodule
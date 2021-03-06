module division #(parameter N = 8)(input [N-1:0] X ,Y ,output reg [N-1:0] Out);
reg [N-1:0] ai, bi;
reg [N:0] pi;
integer i;
always@ (X or Y)
begin
ai = X;
bi = Y;
pi = 0;
for(i=0;i < N;i=i+1)
begin
    pi = {pi[N-2:0],ai[N-1]}; 
    ai[N-1:1] = ai[N-2:0]; 
    pi = pi-bi;
    if(pi[N-1] == 1) begin 
        ai[0] = 0;
        pi = pi + bi; end
    else
        ai[0] = 1;
    end
    Out = ai;
end
endmodule

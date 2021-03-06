module shiftRegister74194(input MRn, CP, Dsr, Dsl,
  input [1:0]S, input [3:0] P, output reg [3:0] Q);

always@(negedge MRn, posedge CP)
begin
	if(!MRn) Q <= 0;
	else if(S==2'b01) begin
		if(Dsr) Q<= {1'b1, Q[3:1]};
		else  Q<= {1'b0, Q[3:1]};
	end else if(S==2'b10) begin
		if(Dsl) Q<= {Q[2:0], 1'b1};
		else  Q<= {Q[2:0], 1'b0};
	end else if(S==2'b11) Q <= P;
end
endmodule
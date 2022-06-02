
module comp2gen(
	input X, clk, resetn, 
	output reg Y,output reg [2:0] m1cs, m1ns, m2cs, m2ns);
parameter S0=0, S1=1, S2=2, S3=3, S4=4, S5=5;
reg Y1;// output for the m1 module.

always @(negedge resetn, posedge clk)//for changing states every clock cycle or to reset.
begin
	if(!resetn) begin 
	m1cs<= S0; m2cs<= S4; end
	else begin m1cs <= m1ns; m2cs<= m2ns; end
end

always @(m1cs) // for changing the output for m1 state machine.
begin
	m1ns =m1cs; Y1= 0; //default values for m1ns and output Y1 of the m1 state machine.
	case(m1cs)
	S0: m1ns = S1;
	S1: m1ns = S2;
	S2: m1ns = S3;
	S3: begin
	    m1ns = S0;
	    Y1=1;
	    end
	endcase
end

always @(*) // for changing the output for m2 state machine.
begin
	m2ns=m2cs; Y=0; //default values for m2ns and output Y of the m2 state machine.
	case(m2cs)
	S4: begin
	Y=X;
	if(X&&~Y1) m2ns=S5; else m2ns=S4;
	end
	S5: begin
	Y=~X;
	if(Y1) m2ns=S4; else m2ns=S5;
	end
	default:m2ns=S4;
	endcase	
end
endmodule
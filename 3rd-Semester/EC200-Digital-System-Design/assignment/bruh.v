
module SignedMultiplier#(parameter N=4, NN=8) ( input clock, reset_n, start,
    input [N-1:0] DataA, DataB,
    output reg [NN-1:0] product,
    output reg done);

    localparam S0=2'b00, S1=2'b01, S2=2'b10;
    reg [1:0] cp_fsm_d, cp_fsm_q;
    reg [N-1:0] N_zeros, B_d, B_q;
    reg [NN-1:0] A_d, A_q, pdt_d, pdt_q;

    integer count;
    
    always @(posedge clock or negedge reset_n)
        begin
            if (reset_n == 0) cp_fsm_q <= S0;
            else
                begin
                    cp_fsm_q <= cp_fsm_d;
                    pdt_q <= pdt_d;
                    A_q <= A_d;
                    B_q <= B_d;
                end
        end
    
    always @(*)
        begin
            cp_fsm_d = cp_fsm_q; done = 1'b0;
            case (cp_fsm_q)
                S0: if (start == 1) cp_fsm_d = S1;
                S1: if (B_q == 0) cp_fsm_d = S2;
                S2: begin done = 1'b1; if (start == 0) cp_fsm_d = S0; end
                default: cp_fsm_d = S0;
            endcase
        end
    
    always @(*)
        begin
            pdt_d = pdt_q; A_d = A_q; B_d = B_q;
            case (cp_fsm_q)
                S0: begin
	                    pdt_d = {NN{1'b0}};
	                    A_d = DataA;
									    if (DataA[N-1] == 1'b1)
		                    A_d[NN-1:N] = {(NN-N){1'b1}};
	                    B_d = DataB;
										  count = N-1;
                    end
                S1: begin
	                    A_d = A_q << 1;
	                    B_d = B_q >> 1;
	                    if (count == 0)
												begin
									  	    if (B_q[0] == 1)
														pdt_d = ((~A_q) + 1) + pdt_q;
												end
	                    else if (B_q[0] == 1'b1) 
												pdt_d = A_q + pdt_q;
									    count = count - 1;
								    end
                S2: product = pdt_q;
                default: pdt_d = pdt_q;
            endcase
        end
endmodule
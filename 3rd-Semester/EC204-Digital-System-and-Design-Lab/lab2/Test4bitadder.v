
module Test4bitadder();
/*201ec164*/
	reg  [1:0] ci ; 
	integer ca, cb;/* ca and cb are counts*/
	wire Cout;
	wire [3:0] s;
	reg C;
	reg [3:0] A, B;
	reg [3:0] array[0:15];
	assign array[0] = 4'b0000; assign array[1] = 4'b0001;
	assign array[2] = 4'b0010; assign array[3] = 4'b0011;
	assign array[4] = 4'b0100; assign array[5] = 4'b0101;
	assign array[6] = 4'b0110; assign array[7] = 4'b0111;
	assign array[8] = 4'b1000; assign array[9] = 4'b1001;
	assign array[10] = 4'b1010; assign array[11] = 4'b1011;
	assign array[12] = 4'b1100; assign array[13] = 4'b1101;
	assign array[14] = 4'b1110; assign array[15] = 4'b1111;
	assign C=0;
	FourBitAdder test(.A(A), .B(B), .Ci(C), .S(s), .Co(Cout));
	initial
	begin 	for( ca =0; ca<16; ca=ca+1)
			begin	for(cb=0; cb<16; cb=cb+1)
				begin
				A=array[ca];
				B=array[cb];
				#100;
				end
			end
		end
endmodule
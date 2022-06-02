module add_sub(input [7:0]a, b, input k, output [7:0]s, output cout); 
wire [8:0] c;
genvar i;
assign c[0] = k;
assign cout = c[8];
generate
	for (i=0; i<8; i= i+1) begin: add_sub
		full_adder fa(.a(a[i]), .b(b[i]^k), .cin(c[i]), .s(s[i]), .cout(c[i+1]));
	end
endgenerate
endmodule

module full_adder(input a, b, cin, output s, cout);
	assign {cout, s} = a + b + cin;
endmodule
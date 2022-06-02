module fullAdderdf(input a, b, carryin,output sum, carryout);
	assign sum = carryin^(a^b);
	assign carryout = (a&b) | carryin&(a^b);
endmodule
module halfAdder(input a,input b,output sum,output carry);
	xor xor1(sum, a, b);
	and and1(carry, a, b);

endmodule

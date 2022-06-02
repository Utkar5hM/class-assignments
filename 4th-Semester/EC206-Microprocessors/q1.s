	AREA utk,CODE, READWRITE
	EXPORT Reset_handler
Reset_handler
	LDR R0, = Table; input
	LDR R1, =0x40000000; result
	LDR R2, [R1];
	MOV R4, #0; Sum
	MOV R5, #0; AVG
	MOV R3, #0;iterator
loop CMP R3, #20; loop to get total sum
	BEQ div;
	LDRB R6, [R0], #1;
	LDRB R7, [R0], #1;
	ADD R4, R4, R7; add all scores
	ADD R3, #1;
	B loop
div	CMP R4, #20; dividing by 20 to get avg
	BLT done; using repeated substraction
	SUB R4, R4, #20;
	ADD R5, #1; increment iterator
	B div;
done STRB R5, [R1]; storing the avg
Stop B Stop
Table
	DCB 1
	DCB 43
	DCB 2
	DCB 75
	DCB 3
	DCB 98
	DCB 4
	DCB 76
	DCB 5
	DCB 23
	DCB 6
	DCB 94
	DCB 7
	DCB 32
	DCB 8
	DCB 21
	DCB 9
	DCB 65
	DCB 10
	DCB 86
	DCB 11
	DCB 73
	DCB 12
	DCB 99
	DCB 13
	DCB 94
	DCB 14
	DCB 74
	DCB 15
	DCB 38
	DCB 16
	DCB 84
	DCB 17
	DCB 30
	DCB 18
	DCB 08
	DCB 19
	DCB 65
	DCB 20
	DCB 94
	END
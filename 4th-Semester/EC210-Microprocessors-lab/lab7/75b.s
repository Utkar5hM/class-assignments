
	AREA AllocSpace, DATA,NOINIT,READWRITE
	;Space for storing result
	;Utkarsh && Arnav Lab6
bcd SPACE 4;
;Actual Code
	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	;address to the input number
	LDR R1, =asc;
	LDR R2, =cf;
	;address to the result
	LDR R3, =bcd ;
	MOV R8, #1;
	MOV R7, #0;
	MOV R10, #10;
	LDRB R4, [R1, #3]; load ascii val
	SUB R5, R4, #0x30; bcd = ascii-conv
	ADD R7, R7, R5;
	MUL R9, R8, R10;
	LDRB R4, [R1, #2]; load ascii val
	SUB R5, R4, #0x30; bcd = ascii-conv
	MUL R5, R9, R5;
	ADD R7, R7, R5;
	MUL R8, R9, R10;
	LDRB R4, [R1, #1]; load ascii val
	SUB R5, R4, #0x30; bcd = ascii-conv
	MUL R5, R8, R5;
	ADD R7, R7, R5;
	MUL R9, R8, R10;
	LDRB R4, [R1]; load ascii val
	SUB R5, R4, #0x30; bcd = ascii-conv
	MUL R5, R9, R5;
	ADD R7, R7, R5;
	STR R7, [R3]; storing quotient
stop BAL stop
; input_number
asc	DCB "1212";
cf	DCD 0x30303030;
	END
	
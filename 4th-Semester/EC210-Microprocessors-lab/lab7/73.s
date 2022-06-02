
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
	;address to the result
	LDR R3, =bcd ;
	MOV R8, #1; multiplier for nth digit
	MOV R7, #0;
	MOV R10, #10;
	LDRB R5, [R1, #3]; load digit
	ADD R7, R7, R5;
	MUL R9, R8, R10;
	LDRB R5, [R1, #2]; load digit
	MUL R7, R10, R7;
	ADD R7, R7, R5;
	LDRB R5, [R1, #1]; load digit
	MUL R7, R10, R7;
	ADD R7, R7, R5;
	LDRB R5, [R1]; load digit
	MUL R7, R10, R7;
	ADD R7, R7, R5;
	STR R7, [R3]; storing quotient
stop BAL stop
; input_number
asc	DCB 2, 1, 2, 1;
	END
	
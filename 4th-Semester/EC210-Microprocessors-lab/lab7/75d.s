
	AREA AllocSpace, DATA,NOINIT,READWRITE
	;Space for storing result
	;Utkarsh && Arnav Lab6
asc SPACE 4;
;Actual Code
	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	;address to the input number
	LDR R1, =bcd;
	LDR R2, =cf;
	;address to the result
	LDR R3, =asc ;
	LDR R4, [R1]; load ascii val
	LDR R5, [R2]; load conv factor
	ADD R5, R4, R5;
	AND R6, R5, #0xFF;
	AND R7, R5, #0xFF00;
	AND R8, R5, #0xFF0000;
	AND R9, R5, #0xFF000000;
	LSL R6, #24;
	LSL	R7, #8;
	LSR R8, #8;
	LSR R9, #24;
	MOV R5, R6;
	ADD R5, R7;
	ADD R5, R8;
	ADD R5, R9;
	STR R5, [R3]; storing quotient
stop BAL stop
; input_number
bcd	DCB 2, 1, 2, 1;
cf	DCD 0x30303030;
	END
	
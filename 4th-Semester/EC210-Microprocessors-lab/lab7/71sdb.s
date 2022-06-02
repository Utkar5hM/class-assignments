
	AREA AllocSpace, DATA,NOINIT,READWRITE
	;Space for storing result
	;Utkarsh && Arnav Lab6
c SPACE 8;
;Actual Code
	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	;address to the input number
	LDR R1, =a;
	LDR R2, =bi;
	;address to the result
	LDR R3, =c ;
	LDR R4, [R1]; load a
	LDR R5, [R2]; load b
	MOV R6, #1;
div CMP R5, #0x80000000; 
	CMPCC R5, R4;
	LSLCC R5, R5, #1;
	LSLCC R6, R6, #1;
	BCC div;
	MOV R7, #0;
div2 CMP R4, R5;
	SUBCS R4, R4, R5;
	ADDCS R7, R7, R6;
	LSRS R6, R6, #1;
	LSRNE R5, R5, #1;
	BNE div2;
	STR R7, [R3],#4;
	STR R5, [R3]; 
stop BAL stop
; input_number a=0x703D4444FA124025
; b= 0xFEFF4ED6
a	DCD 0xFA124025, 0x703D4444;
bi	DCD 0xFEFF4ED6;
	END
	
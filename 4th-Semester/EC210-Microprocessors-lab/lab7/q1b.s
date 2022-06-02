
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
	LDR R4, [R1]; load a_low
	LDR R5, [R1, #4]; load a_high
	LDR R6, [R2]; load b
	MOV R7, #0; Q=0;
div CMP R5, #0;div process while a_high>0
	BEQ dlow;
	SUBS R4, R4, R6; R4=R4-R6
	SUBCC R5, R5, #1; Sub borrow(if) from a_high.
	ADD R7, R7, #1; Q = Q+1;
	B	div
dlow CMP R4, R6; Now Normal Subtraction process
	BCC done; for division like before
	SUB R4, R4, R6;  R4=R4-R6
	ADD R7, R7, #1; Q=Q+1
	B	dlow;
done STR R7, [R3]; storing quotient
	STR R4, [R3, #4]; storing remainder
stop BAL stop
; input_number a=0x703D4444FA124025
; b= 0xFEFF4ED6
a	DCD 0xFA124025, 0x703D4444;
bi	DCD 0xFEFF4ED6;
	END
	
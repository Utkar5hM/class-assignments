
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
	MOV R6, #0;
div CMP R4, R5; ? a < b
	BCC done; J if C clear (a<b)
	SUB R4, R4, R5; a=a-b;
	ADD R6, R6, #1; Q = Q+1;
	B	div; J to div for loop
done STR R6, [R3]; storing quotient
	STR R4, [R3, #4]; storing remainder
stop BAL stop
; input_number
a	DCD 0xFA124025;
bi	DCD 0xCF85;
	END
	
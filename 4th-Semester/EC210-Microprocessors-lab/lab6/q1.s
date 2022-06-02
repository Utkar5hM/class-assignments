
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
	UMULL R6, R7, R5, R4; unsigned mult
	STR R6, [R3]; storing low
	STR R7, [R3, #4]; storing high
stop BAL stop
; input_number
a	DCD 0x7A120;
bi	DCD 0xCF850;
	END
	

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
A	LDR R4, [R1]; a
	LDR R5, [R2]; b
	SMULL R6, R7, R5, R4; multiply
	STR R6, [R3]; low
	STR R7, [R3, #4]; high
stop BAL stop
; input_number
a	DCD 0xFF7A0120;
bi	DCD 0xCF850;
	END
	
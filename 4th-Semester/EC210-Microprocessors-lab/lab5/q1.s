	AREA AllocSpace, DATA,NOINIT,READWRITE
	;Space for storing reversed string
result SPACE 1;
;Actual Code
	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	;address to the input number
	LDR R1, =inputnumber ;
	;address to the result
	LDR R2, =result ;
	; load the  input number from memory
	LDR R3, [R1];
	; Getting the last bit
	AND R4, R3, #1;
	; Checking if it is zero
	CMP R4, #0;
	;if not zero-> not divisible.
	MOVNE R4, #0xFF;
	; storing result as 0xFF;
	STRBNE R4, [R2];
	BNE stop
	; if zero ->divisible
	ADD R4, R4, #1;
	; storing result as 1;
	STR R4, [R2]; storing 0 
stop BAL stop
; input_number
inputnumber DCD 0x4FF02ED6;
	NOP
	END
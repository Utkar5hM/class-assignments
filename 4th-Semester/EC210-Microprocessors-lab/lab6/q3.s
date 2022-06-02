
	AREA AllocSpace, DATA,NOINIT,READWRITE
	;Space for storing result
	;Utkarsh 164 && Arnav 109 Lab6
c SPACE 16;
;Actual Code
	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	;address to the input number
	LDR R0, =a;
	LDR R1, =bi;
	; clearing registers used for calculation
	MOV R7, #0;
	MOV R8, #0;
	MOV R9, #0;
	MOV R10, #0;
	;address to the result
	LDR R2, =c ;
	LDR R3, [R0];
	LDR R4, [R0, #4];
	LDR R5, [R1];
	LDR R6, [R1, #4]
	UMULLS R7, R8, R5, R3; a_low * b_low
	UMULL R11, R12, R6, R3; a_high * b_low
	ADCS R8, R11, #0;
	ADCS R9, R12, #0;
	ADC R10, R10, #0;
	UMULLS R11, R12, R5, R4; a_low* b_high
	ADDS R8, R8, R11;
	ADCS R9, R9, R12;
	ADC R10, R10, #0;
	UMULL R11, R12, R6, R4; a_high * b_high
	ADDS R9, R9, R11;
	ADCS R10, R10, R12;
	ADC R10, R10, #0;
	STMIA R2, {R7-R10};
	
stop BAL stop
; input_number
a	DCD 0x7A124AD0, 0x4A35D;
bi	DCD 0xCF850D00, 0x84DE3FF7;
	END
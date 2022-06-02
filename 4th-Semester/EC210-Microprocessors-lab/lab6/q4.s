
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
	UMULL R7, R8, R5, R3; unsigned a_low * b_low
	SMLALS R8, R9, R3, R6; signed a_low * b_high
	ADC R10, R10, #0; adding carry if any.
	SMLALS R8, R9, R4, R5; signed a_high * b_low
	ADC R10, R10, #0; adding carry if any.
	SMLAL R9, R10, R4, R6; signed a_high * b_high
	STMIA R2, {R7-R10};
	
stop BAL stop
; input_number
a	DCD 0x7A124AD0, 0x4A35D; 0x4A35D7A124AD0
bi	DCD 0xCF850D00, 0x84DE3FF7; 0x84DE3FF7CF850D00
	END
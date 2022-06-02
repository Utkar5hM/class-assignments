
	AREA AllocSpace, DATA,NOINIT,READWRITE
	;Space for storing result
	;Utkarsh 164 && Arnav 109 Lab6
c SPACE 8;
;Actual Code
	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	;address to the input number
	LDR R11, =a;
	LDR R12, =bi;
	;address to the result
	LDR R0, =c ;
	LDR R1, [R11];
	LDR R2, [R12];
	LSR R3, R1, #31;
	LSR R4, R2, #31;
comp_1 CMP R3, #1;
	BEQ fn
comp_2 CMP R4, #1;
	BEQ sn
	B mult
fn MVN R5, R5;
	MVN R1, R1;
	ADD R1, R1, #1;
	B comp_2
sn MVN R5, R5;
	MVN R2, R2;
	ADD R2, R2, #1;
mult UMULL R6, R7, R1, R2;
	CMP R5, #0xFFFFFFFF;
	BEQ cs;
	B store;
cs MVN R6, R6;
	ADDS R6, R6, #1;
	MVN R7, R7;
	ADC R7, R7, #0;
store	STR R7, [R0];
	STR R2, [R0, #4];
stop BAL stop;
; input_number
a	DCD 0x7A124AD0; 0x7A124AD0
bi	DCD 0xCF850D00; 0xCF850D00
	END
	AREA Qtwo, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
;Signed 32 bit Utkarsh / Arnav
Start	MOV R1, #0x7FFFFFFF; Value_1
		MVN R2, #0x8FFFFFF3;	Value_2
		ADDS R3, R1, R2; Value_3 = Value_1 + Value_2
		ADC R4, #0; as for previous instruction, 
		;V=1 we will be storing the carry as the additional required bit for Value_3
		SUBS R6, R1, R2; Value_4 = Value_1 - Value_2
		MRS R8, CPSR; as for previous instruction, 
		;V=0 we will be storing the N as the additional required bit for Value_4 
		LSLS R8, #1;
		ADC R7, #0;The additional bit in R7
		SBC R8, R1, R2; Value_5 = Value_1 - Value_2 - !c 
		;we will perform similar subtraction but by using SBC
		;here the calculated value will be reduced by one if prior carry flag was clear.
		MRS R10, CPSR; for previous instruction, V=0 we will be storing 
		;the N as the additional required bit for Value_4 
		LSLS R10, #1;
		ADC R9, #0; The additional bit in R9
		RSBS R10, R1, R2;   Value_6 = Value_2 - Value_1
		MRS R12, CPSR; for previous instruction, V=0 
		;we will be storing the N as the additional required bit for Value_
		LSLS R12, #1;
		ADC R11, #0; The additional bit in R11
Stop B Stop ; Stop program
	END
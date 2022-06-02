	AREA Qtwo, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
; signed 64 Bit Utkarsh / Arnav
Start	MOV R1, #0x0003D000; Value_1_low
		MVN R2, #0x7FFFFFFF; Value_1_high
		MOV R3, #0x0003D000; Value_2_low
		MVN R4, #0x7FFFFFFF; Value_2_high
		ADDS R5, R1, R3; value_3_low = Value_1_low + Value_2_low
		ADCS  R6, R2, R4; value_3_high = Value_1_high + Value_2_high
		ADC R7, #0; additonal 65th bit which will be carry value since V =1.
		SUBS  R8, R3, R1;  value_4_low = Value_2_low - Value_1_low
;		This will set c=0 if it takes a borrow otherwise c=1
		SBCS R9, R4, R2; value_4_high = Value_2_high - Value_1_high - carry_flag
		;carry_flag(indicating borrow as said above) 
		MRS R11, CPSR; for previous instruction,
		;V=0 we will be storing the N as the additional required bit for Value_4 
		LSLS R11, #1;
		ADC R10, #0; The additional bit in R10
		RSBS R11, R3, R1; value_5_low = Value_1_low - Value_2_low 
		;This will set c=0 if it takes a borrow otherwise c=1
		RSCS R12, R4, R2; value_5_high = Value_1_high - Value_2_high - carry_flag
		;carry_flag(indicating borrow as said above) 
		MRS R13, CPSR; for previous instruction, 
		;V=0 we will be storing the N as the additional required bit for Value_4 
		LSLS R13, #1;
		ADC R13, #0; The additional bit in R13
Stop B Stop ; Stop program
	END
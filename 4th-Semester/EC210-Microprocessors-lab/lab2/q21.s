	AREA Qone, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
; 32 bit unsigned Utkarsh / Arnav
Start	MOV R1, #0x0FA00000; Value_1
		MVN R2, #0xC000000F;	Value_2
		ADD R3, R1, R2; Value_3 = Value_1 + Value_2
		ADDS R4, R1, R3; Value_3 = Value_1 + Value_2 but updates CPSR
		SUB  R5, R3, #0x4D00; Value_4 = Value_3 - 0x4000
		SUBS R6, R4, R2; Value_5 = Value_3 -Value_2
		RSB R7, R1, R4; Value_6 = Value_1 - Value_3 
		MVN R8, #0x01; Value_7 = ~Value_3
		ADDS R9, R2, R8; Value_8 = Value_2 + Value_7 & updates CPSR
		ADC R10, R7, #1; Value_9 = Value_6 + 1 + C
		SBC R11, R10, #1; Value_10 = Value_9 - 1 
Stop B Stop ; Stop program
	END
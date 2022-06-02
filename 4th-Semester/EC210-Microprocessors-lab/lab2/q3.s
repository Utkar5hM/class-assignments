	AREA Qtwo, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
; signed 64 Bit Utkarsh / Arnav
Start	MOV R1, #0x0003D000; Value_1_low
		MVN R2, #0x1000000E; Value_1_high
		MOV R3, #0x0003D000; Value_2_low
		MVN R4, #0x0000FF00; Value_2_high
		ADDS R5, R1, R3; value_3_low = Value_1_low + Value_2_low
		ADC  R6, R2, R4; value_3_high = Value_1_high + Value_2_high
		SUBS  R7, R3, R1;  value_4_low = Value_2_low - Value_1_low   This will set c=0 if it takes a borrow otherwise c=1
		SBC R8, R4, R2; value_4_high = Value_2_high - Value_1_high - carry_flag(indicating borrow as said above) 
		RSBS R9, R3, R1; value_5_low = Value_1_low - Value_2_low   This will set c=0 if it takes a borrow otherwise c=1
		RSC R10, R4, R2; value_5_high = Value_1_high - Value_2_high - carry_flag(indicating borrow as said above) 
Stop B Stop ; Stop program
	END
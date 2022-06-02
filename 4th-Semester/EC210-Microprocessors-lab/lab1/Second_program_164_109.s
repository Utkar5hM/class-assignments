
		AREA Qtwo, CODE, READONLY
		EXPORT	Reset_Handler
Reset_Handler
Start	MOV R1, #0xF4;
		LSL R2, R1, #8;
		MVN R3, #0xD3;
		LSR R4, R3, #2;
		MOVS R5, #-200;
		ASR R6, R5, #4;
		ASR R7, R2, #12;
		MOV R1, #0;
		MVNS R0, R5;
		ROR R5, R2, #9;
		RORS R3, R4, #1;
		RRX R7, R3;
Stop B Stop ; Stop program
	END


	AREA hue, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
Start MOV R0, #0x40000000; Address of the memory where the
					; values is present
	LDMIA R0, {R1-R10}; loading the 10 values into register
	ADD R1, #0xFF;
	ADD R2, #0xFF;
	ADD R3, #0xFF;
	ADD R4, #0xFF;
	ADD R5, #0xFF;
	ADD R6, #0xFF;
	ADD R7, #0xFF;
	ADD R8, #0xFF;
	ADD R9, #0xFF;
	ADD R10, #0xFF;
	STMIA R0, {R1-R10}; Storing all the values into memory;
Stop B Stop
	END

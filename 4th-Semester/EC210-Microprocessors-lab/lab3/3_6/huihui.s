	AREA huihui, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler

Start MOV R9, #0x50000000; for loading values into register
	LDMIA R9, {R0-R7}; Loading values into register that are to be swapped.
	MOV R8, #0x40000000; Address of the memory of which
; The values are to be swapped with the registers.
	SWP R0, R0, [R8];
	ADD R8, #4;
	SWP R1, R1, [R8];
	ADD R8, #4;
	SWP R2, R2, [R8];
	ADD R8, #4;
	SWP R3, R3, [R8];
	ADD R8, #4;
	SWP R4, R4, [R8];
	ADD R8, #4;
	SWP R5, R5, [R8];
	ADD R8, #4;
	SWP R6, R6, [R8];
	ADD R8, #4;
	SWP R7, R7, [R8];
Stop B Stop
	END

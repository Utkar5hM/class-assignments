	AREA qthreetwo, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
Start MOV R1, #0x40000000; Address of the memory where the
					; number is present
	MOV R0, #0 ; R0 holds the result
Loop LDR R2, [R1], #4 ; Load the first number & advance ptr
	LDR R3, [R1], #4 ; Load the second number & advance ptr
	ADDS R0, R2, R3 ; Add the numbers
	ADC R4, #0;
	STR R0, [R1], #4 ; store the result in the next memory
	STR R4, [R1], #4 ; store the carry result in the next memory
Stop B Stop
	END


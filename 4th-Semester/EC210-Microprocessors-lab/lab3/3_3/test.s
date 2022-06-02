	AREA qthreetwo, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
Start MOV R1, #0x40000000; Address of the memory where the
					; number is present
	MOV R0, #0 ; R0 holds the result
Loop LDR R2, [R1], #4 ; Load the first number -1 & advance ptr 
	LDR R3, [R1], #4 ; Load the second number -2 & advance ptr
	SUBS R0, R2, R3 ; Add the numbers
	ADC R4, #0;
	MRS R5, CPSR; since for the numbers we considered for addition gives V=0,
	;We will be storing the N as the additional required bit 
	LSLS R5, #1;
	ADC R4, #0;The additional bit.
	STR R0, [R1], #4 ; store the result in the next memory
	STRB R4, [R1], #1 ; store the carry result in the next memory
Stop B Stop
	END

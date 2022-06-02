	AREA qthreetwo, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
Start MOV R1, #0x40000000; Address of the memory where the
					; number is present
	MOV R0, #0 ; R0 holds the result
Loop LDR R2, [R1], #4 ; Load the first number -1 & advance ptr 
	LDR R3, [R1], #4 ; Load the second number -2 & advance ptr
	SUBS R0, R2, R3 ; Add the numbers
	MRSVC R5, CPSR; using N as additional bit if V==0
	LSLSVC R5, #1; otherwise set C as the additional bit
	ADC R4, #0;The additional bit.
	STR R0, [R1], #4 ; store the result in the next memory
	STR R4, [R1], #1 ; store the carry result in the next memory
Stop B Stop
	END

	AREA qthreetwo, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
Start MOV R1, #0x40000000; Address of the memory where the
					; number is present
	MOV R3, #0 ; R3 holds the result
	LDR R0, [R1], #4 ; Load the first number & advance ptr 
	LDR R2, [R1], #4 ; Load the second number  & advance ptr
	CMP R0, R2; compare
	ADDGT R3, #0xFF; add if greater than(signed)
Stop B Stop
	END

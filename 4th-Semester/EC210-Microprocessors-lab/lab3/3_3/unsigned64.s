	AREA qthreetwo, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
Start MOV R1, #0x40000000; Address of the memory where the
					; number is present
	MOV R4, #0 ; R4 and R5, R6 to hold	the result
	MOV R5, #0 ;
	MOV R6, #0 ;
Loop LDR R0, [R1], #4 ; Load the first number's low & advance ptr 
	LDR R1, [R1], #4 ; Load the first number's high & advance ptr
	LDR R2, [R1], #4 ; Load the second number's low & advance ptr 
	LDR R3, [R1], #4 ; Load the second number's high & advance ptr
	SUBS R4, R0, R2 ; subtracting the numbers low
	SBCS R5, R1, R4 ; subtracting high of both numbers with carry from low sub.
	SBC R6, #0;The additional bit.
	STR R4, [R1], #4 ; store the Low result in the next memory
	STR R5, [R1], #4 ; store the High result in the next memory
	STR R6, [R1], #4 ; storing the carry in the next memory
	; We have stored the result in 96bits(64 +32)
Stop B Stop
	END

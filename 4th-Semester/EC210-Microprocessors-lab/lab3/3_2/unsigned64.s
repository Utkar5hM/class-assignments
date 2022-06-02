		AREA qthreetwo, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
Start MOV R1, #0x40000000; Address of the memory where the
					; number is present
	MOV R6, #0 ; R4 and R5, R6 to hold	the result
	MOV R7, #0 ;
	MOV R8, #0 ;
Loop LDR R2, [R1], #4 ; Load the first number's low & advance ptr 
	LDR R3, [R1], #4 ; Load the first number's high & advance ptr
	LDR R4, [R1], #4 ; Load the second number's low & advance ptr 
	LDR R5, [R1], #4 ; Load the second number's high & advance ptr
	ADDS R6, R4, R2 ; Add the numbers low
	ADCS R7, R5, R3 ; Adding high of both numbers with carry from low add.
	ADC R8, #0;The additional bit.
	STR R6, [R1], #4 ; store the Low result in the next memory
	STR R7, [R1], #4 ; store the High result in the next memory
	STR R8, [R1], #4 ; storing the carry in the next memory
	; We have stored the result in 96bits(64 +32)
Stop B Stop
	END

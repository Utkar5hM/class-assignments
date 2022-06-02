	AREA hmm, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
Start MOV R1, #0x40000000; Address of the memory where the
					; values are present			
	MOV R3, #0 ; R3 and R4, R6 to hold	the result
	MOV R4, #0 ;
	LDR R3, [R1]; Load the value_1 in R3 & advance ptr 
	LDR R4, [R1, #4]; Load the value_2 in R4& advance ptr
	EOR R3, R3, R4; R3 = R3 ^ R4
	EOR R4, R3, R4; R4 = R3 ^ R4
	EOR R3, R3, R4;  R3 = R3 ^ R4
	STR R3, [R1]; storing the results back;
	STR R4, [R1, #4]; 
Stop B Stop
	END

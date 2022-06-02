	AREA AllocSpace, DATA,NOINIT,READWRITE
	;Space for storing reversed string
array SPACE 1024;
result SPACE 1024;
;Actual Code
	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	;address to the input number
	LDR R1, =inputnumber ;
	;address for space used in operation
	LDR R2, =array;
	MOV R12, R2;
	;address to the result
	LDR R3, =result ;
	; load the  input number from memory
	LDR R4, [R1];
	LDRB R9, [R2];
	; Getting the last bit
	MOV R5, R4; R5 = R4
	MOV R6, #0;
	MOV R7, #0; for storing no of nos.
	;dividing and finding nth digit.
	;division by the use of subtracting
	; until a remainder is found.
	; where remainder < 10
div	SUB R5, R5, #10; subtracting by 10
	CMP R5, #10; checking if remainder < 10
	;incrementing iterator to store quotient
	ADD R6, R6, #1; 
	; if remainder >=10 then loop to sub further.
	BPL div
	ADD R7, #1; incrementing nos.
	STRB R5, [R2], #1; storing digits
	;comparing quotient and 10.
	CMP R6, #10;
	;if quotient >10 then store quotient in remainder
	MOVPL R5, R6;
	; && reset quotient
	MOVPL R6, #0;
	; && loop again
	BPL div;
	; check if quotient is zero
	CMP R6, #0;
	; increment no of digits counter if no
	ADDNE R7, #1;
	; &&  store it in R2 if no.
	STRBNE R6, [R2]; storing last digit
	; 
	MOV R9, #0; i for  iteration
	MOV R5, #0; for storing result
	MOV R8, #1; for multiple of 10
	MOV R4, #0; for storing digit;
	MOV R6, #0;
	MOV R10, #10;
	;loading ith digit in R4
mult LDRB R4, [R2], #-1;
	; multiplying it with 10^i
	MUL R6, R4, R8;
	; adding it to Result register
	ADD R5, R5, R6;
	;incrementing iterator
	ADD R9, #1;
	; multiplying multiplying register with 10.
	MUL R13, R8, R10;
	; storing it back into multiplkying register
	MOV R8, R13;
	; checking if i< n  (n= no of digits)
	CMP R7, R9;
	; if yes then loop
	BPL mult
	;store final result in [R3] memory.
	STR R5, [R3];
stop BAL stop
; input_number
inputnumber DCD 142534;
	END




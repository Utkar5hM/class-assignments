	AREA AllocSpace, DATA,NOINIT,READWRITE
	;Space for result
array SPACE 1024;
;Actual Code
	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	;address to the input number
	LDR R1, =inputnumber ;
	;address for result
	LDR R2, =array;
	MOV R12, R2;
	; load the  input number from memory
	LDR R4, [R1];
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
stop BAL stop
; input_number
inputnumber DCD 0xFABC;64188
	END
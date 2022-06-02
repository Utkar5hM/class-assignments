	AREA AllocSpace, DATA,NOINIT,READWRITE
	;Space for storing result
result SPACE 1;
;Actual Code
	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	;address to the input number
	LDR R1, =inputnumber ;
	;address to the input digit to cmp
	LDR R2, =inputdigit;
	;address to the result
	LDR R3, =result ;
	; load the  input number from memory
	LDR R4, [R1];
	LDRB R9, [R2];
	; Getting the last bit
	MOV R5, R4; R5 = R4
	MOV R6, #0; for quotient
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
	;least digit stored in R5
	;checking if remainder is equal to the input digit.
	CMP R9, R5;
	;If yes then increment count
	ADDEQ R10, R10, #1;
	;comparing quotient and 10.
	CMP R6, #10;
	;if quotient >10 then store quotient in remainder
	MOVPL R5, R6;
	; && reset quotient
	MOVPL R6, #0;
	; && loop again
	BPL div;
	; the last digit will be in R6
	; so compare that to input again.
	CMP R6, R9; for the last digit
	;if yes increment counter;
	ADDEQ R10, R10, #1;
	; storing result as 1;
	STR R10, [R3]; storing answer
stop BAL stop
; input_number
inputnumber DCD 142534;
inputdigit DCB 4;
	END
	AREA AllocSpace, DATA,NOINIT,READWRITE
;Space for the input string
str_main SPACE 1024

	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	;Pointer to the string
	LDR R1, =str_main ; 
	;Pointer to the input string
	LDR R2, =str_src ; 
	;storing the string's pointer in R8
	ADD R4, R1, #0;
	;storing the input's pointer in R8
	ADD R5, R2, #0;
	;for storing the input String;
	; loading characters from input string.
fill LDRB R3, [R5], #1;
	;storing the character in result space
	STRB R3, [R4], #1; store byte and update the pointer
	;checking if end of line is reached
	CMP R3, #0;
	; if not then loop.
	BNE fill;
	; for storing no of zeroes encountered
	MOV R4, #0;
	; Pointer to the string in R5
	MOV R5, R1;
	;loading character from string
sqz LDRB R3, [R5];
	; checking if its a space
	CMP R3, #32;
	; if its a space then add 1 to R4.
	ADDEQ R4, #1;
	; if not then calculate index to move towards left.
	SUBNE R6, R5, R4;
; and also store the current value towards left at that index.
	STRBNE R3, [R6];
	; update the string's iterator
	ADD R5, #1;
	;check if string ends.
	CMP R3, #0;
	; if not then loop.
	BNE sqz;
	;R0 to change to 1 at the end of the loop.
done MOV R0, #1;
	BAL stop;
stop BAL stop;
str_src DCB "This is a text",0;
	NOP
	END
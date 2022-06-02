	AREA AllocSpace, DATA,NOINIT,READWRITE
	;Space for storing reversed string
str_rev SPACE 1024;
;Actual Code
	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	;Pointer to the input string
	LDR R1, =str_src ;
	;Pointer to the reversed string
	LDR R2, =str_rev ;
	;storing the input's pointer in R8
	ADD R8, R1, #0;
	;Storing the result's pointer in R9
	ADD R9, R2, #0;
	; load a byte from input string and update the pointer
lth	LDRB R3, [R8],#1;
	; counting length (total = length +1)
	ADD R4, #1;
	; Check for End of string
	CMP R3, #0 ; 
	; If not go back to lth to count length
	BNE lth;
	; total = (length +1) - 1
	SUB R4, #1;
	;storing length in R5
	ADD R5, R4, #0;
	; R8 to point to the last value just before the 0 (NULL).
	SUB R8, #2;
	; for iteration count R5 = R5 -1;
res SUB R5, #1;
	; Loading the value in reverse order in R3
	LDRB R3, [R8],#-1 ; load a byte and update the pointer
	; Storing the loaded value;
	STRB R3, [R9],#1 ; store byte and update the pointer
	; checking if R5 is 0. which indicated we are done reversing.
	CMP R5, #0 ; Check for End of string
	; If its not then loop again.
	BNE res
	; storing null in R3
	MOV R3, #0;
	; adding NULL at the end of the reversed string
	STRB R3, [R9];
	;Restoring length in R5
	ADD R5, R4, #0;
	;storing starting addresses of input & reversed string.
	ADD R8, R1, #0;
	ADD R9, R2, #0;
	;checking if the input string is palindrome
	; by comparing same index bits of input and reversed string.
pal LDRB R3, [R8],#1 ; 
	LDRB R4, [R9],#1 ; 
	; checking for end of string
	CMP R3, #0;
	; As once it reaches end means it's a palindome.
	BEQ ipa;
	;comparing bytes.
	CMP R3, R4;
	; if equal -> it can be a palindrome hence looping for next index
	BEQ pal;
	; If not equan then its not a palindrome
	;storing 0 in R0 (output register)
np	MOV R0, #0;
	; jump to stop;
	BAL stop;
	;storing 1 in R0 (output register) if input is a palindrome
ipa	MOV R0, #1;
	BAL stop;
stop BAL stop
; input_string 
str_src DCB "reviver",0;
	NOP
	END
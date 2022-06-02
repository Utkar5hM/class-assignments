	AREA AllocSpace, DATA,NOINIT,READWRITE
;Space for storing the final string
str_rev SPACE 1024

	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	;Pointer to the input string
	LDR R1, =str_src ; 
	;Pointer to the substring
	LDR R2, =sub_str ; 
	;Pointer to result string
	LDR R12, =str_rev ; 
	;Pointer to index
	LDR R11, =sub_index ; 
	;loading index in R10;
	LDRB R10, [R11];
	;storing the input string's pointer in R8
	ADD R8, R1, #0;
	;storing the input substring's pointer in R9
	ADD R9, R2, #0;
	;for iteration till the insertion index
	MOV R7, #0;
	;result's pointer in R12.
	ADD R6, R12, #0;
;storing the prefix part of string in result(before the insertion index)
	;load a byte and update the pointer
pref LDRB R3, [R8],#1 ; 
	;store byte and update the pointer
	STRB R3, [R6], #1; 
	;incrementign R7.
	ADD R7, #1;
	;check if the insertion index is reached.
	CMP R7, R10; 
	; if not then loop. again to pref.
	BNE pref
	; storing the substring in consequent index in result.
	; load a byte and update the pointer
sbst LDRB R3, [R9],#1 ;
	;store byte and update the pointer
	STRB R3, [R6], #1;
	;Check for End of string
	CMP R3, #0 ; 
	; If not, then loop.
	BNE sbst
	; subtract result pointer, so the null value can be rewritten
	SUB R6, #1;
;storing the suffix part, the part that existed at right of insertion index
	;load a byte and update the pointer
sufx LDRB R3, [R8],#1 ; 
	; store byte and update the pointer
	STRB R3, [R6], #1; 
	; Check for End of string
	CMP R3, #0 ; 
	; if not , loop again
	BNE sufx
done MOV R0, #1;
	BAL stop;
stop BAL stop

;input string
str_src DCB "reviver",0;
;input substring
sub_str DCB "abc",0;
;input insertion index
sub_index DCB 2;
	NOP
	END
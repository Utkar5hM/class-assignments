	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	; Pointer to the input string
	LDR R1, =str_src ;
	; Pointer to the input substring
	LDR R2, =sub_str; 
	;storing the input string's pointer in R8
	ADD R8, R1, #0;
	;storing the input substring's pointer in R9
	ADD R9, R2, #0;
	; Loading the first byte(char) of the substring
	LDRB R4, [R9],#1 ; 
	; for storing the index.
	MOV R5, #0;
	;loading the chars of input string.
ind	LDRB R3, [R8],#1 ; 
	; incrementing the index.
	ADD R5, #1;
	; Check for End of string
	CMP R3, #0 ; Check for End of string
	; if it reaches the end of string -> not found
	BEQ nf;
	;comparing 1st char of substring and i'th char of string
	CMP R3, R4;
	;back to iteration if not equal.
	BNE ind;
	; else
	; storing index in R10 for inner loop.
	ADD R10, R8, #0;
	; comparing subsequent characters
ver LDRB R3, [R10],#1 ; load a byte and update the pointer
	LDRB R4, [R9],#1 ; load a byte and update the pointer
	CMP R4, #0 ; Check for End of sub string
	; if entire substring satisfies, we return.
	BEQ iss;
	;Check if char's are equal
	CMP R3, R4 ; 
	;If not equal, point R9 to start of string and reload R4
	ADDNE R9, R2, #0;
	LDRBNE R4, [R9],#1 ; 
	;back to main iteration if not equal.
	BNE ind;
	; if current chars are equal loop further.
	BEQ ver
	;storing -1 if substring not found.
nf	MOV R0, #-1;
	BAL stop;
	; storing index of substring in R0 if substring found.
iss	ADD R0, R5, #-1;
	BAL stop;
stop BAL stop
; input string
str_src DCB "reviver",0;
; input substring
sub_str DCB "vive",0;
	NOP
	END
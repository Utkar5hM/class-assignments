	AREA AllocSpace, DATA,NOINIT,READWRITE
	;Space for storing result
result SPACE 1024;
;Actual Code
	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	;address to the input number
	LDR R1, =inputnumber ;
	;address to the result
	LDR R2, =result ;
	MOV R4, #1; (n-1)th term
	MOV R5, #1; nth term
	; load the  input number from memory
	LDR R3, [R1];
	; base_case if the input number is 0;
	CMP R3, #0;
	MOVEQ R6, #0;
	BEQ dun
	;base_case if the input number is 1;
	CMP R3, #1;
	MOVEQ R6, #1;
	BEQ	dun
	; for input number >1 
	MOV R9, #2; iterator i from 2 to n.
chk	CMP R3, R9; checking if i==n
	BEQ	dun ; jump to store if done.
	ADD R9, #1; increment iterator
	; nth term = (n-1)th + (n-2)th 
	ADD R7, R4, R5;
	; storing nth term in R5
	MOV R4, R5;
	;storing (n-1)th term in R4
	MOV R5, R7;
	; jump to chk to loop till i==n
	BPL chk;
	;store the result in [ R2]
dun	STR R5, [R2];
	
stop BAL stop
; input_number
inputnumber DCD 11;
	END




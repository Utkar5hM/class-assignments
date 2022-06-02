	AREA AllocSpace, DATA,NOINIT,READWRITE
	;Space for storing result
result SPACE 1;
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
	; base case check if input ==0;
	CMP R3, #0;
	; as 0 is a fib no for f(0), store & jump
	MOVEQ R6, #1;
	BEQ dun
	;for other cases n>0;
	;as f(1)==f(2)==1;
	; it doesn't matter in iteration.
	; while comparing.
	;comparing nth fib, initially R5, f(1)=f(2)
chk	CMP R3, R5;
	; storing 1 in result register if it matches any fibb.
	MOVEQ R6, #1;
	; jumping to store result in memory
	BEQ	dun
	; if input > current F(n),
	;We will calculate F(n+1) and store it in R5
	; And Current F(n) in R4;
	ADDPL R7, R4, R5;
	MOVPL R4, R5;
	MOVPL R5, R7;
	; LOOP to check again.
	BPL chk;
	; if input < F(n) then its not a fibonacci number
	; store 0XFF in result register;
	MOV R6, #0xFF; :o
	; store result in memory.
dun	STRB R6, [R2];
	
stop BAL stop
; input_number
inputnumber DCD 65;
	END




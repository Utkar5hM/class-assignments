
	AREA AllocSpace, DATA,NOINIT,READWRITE
	;Utkarsh && Arnav Lab6
	;Space for storing result
z SPACE 9;
;Actual Code
	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	;address to the input number
	LDR R1, =x;
	LDR R2, =y;
	;address to the result
	LDR R3, =z ;
	MOV R0, #0;
	MOV R7, #0; carry_bit xD
loop CMP R0, #8;
	BEQ done; jump if all bits done
	LDRB R4, [R1], #1; load bit, x[i]
	LDRB R5, [R2], #1; load bit, y[i] 
	ADD R6, R4, R5; z[i] =x[i] + y[i]
	ADD R6, R6, R7;  z[i] += c[i-1]
	MOV R7, #0; c[i]=0
	CMP R6, #9; ? z[i]>9
	SUBHI R6, R6, #10; r6-10:-
	MOVHI R7, #1;	r7=1:-
	STRB R6, [R3], #1; z[i] -> mem[i]
	ADD R0, R0, #1; i=i+1;
	B loop; loop
done STRB R7, [R3]; storing carry
stop BAL stop
; input_number
x	DCB 1, 8, 0, 1, 2, 3, 4, 2;
y	DCB 6, 7, 5, 4, 5, 0, 4, 7;
	END
	

	AREA AllocSpace, DATA,NOINIT,READWRITE
	;Space for storing result
	;Utkarsh && Arnav Lab6
bcd SPACE 4;
;Actual Code
	AREA hmm, CODE, READWRITE
	EXPORT Reset_Handler
Reset_Handler
	;address to the input number
	LDR R1, =asc;
	LDR R2, =cf;
	;address to the result
	LDR R3, =bcd ;
	LDR R4, [R1]; load ascii val
	LDR R5, [R2]; load conv factor
	SUB R5, R4, R5;
	STR R5, [R3]; storing quotient
stop BAL stop
; input_number
asc	DCB "1212";
cf	DCD 0x30303030;
	END
	

	AREA Qone, CODE, READONLY
	EXPORT	Reset_Handler
Reset_Handler
Start	MOV R1, #0x0012 ;
		MVN R2, #0x0025 ;
Stop B Stop ; Stop program
	END

MOV{cond}{S} Rd, Operand2


MVN{cond}{S} Rd, Operand2

RRX{S}{cond} Rd, Rm



LSL{S}{
cond
} 
Rd
, 
Rm
, 
Rs
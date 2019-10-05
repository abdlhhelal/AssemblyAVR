

			.INCLUDE <m32def.inc>
			.equ	STACKSTART	= 0x085f
		
			.ORG	0x000
		
			LDI 	R16,HIGH(STACKSTART)
			OUT 	SPH,R16
			LDI 	R16,LOW(STACKSTART)
			OUT 	SPL,R16

			CALL 	Add20times
while1:		RJMP 	while1


Add20times:	CLR 	R20		 	; clear R20
			LDI 	R16,0x03 	; store number 3 in R16
			LDI 	R17,0x1E 	; Store 30 in R17
	
loop:		ADD 	R20,R16 	; 3 added ten times = 3*10 = 30 = 0x1E


check: 		SUB 	R17,R16
			BREQ 	quitloop
			RJMP 	loop

quitloop:	OUT 	PORTD,R20


			RET

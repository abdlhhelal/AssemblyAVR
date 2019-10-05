
	
			.INCLUDE <m32def.inc>
			.equ	STACKSTART	= 0x085f
		
			.ORG	0x000
		
			LDI 	R16,HIGH(STACKSTART)
			OUT 	SPH,R16
			LDI 	R16,LOW(STACKSTART)
			OUT 	SPL,R16

			CALL 	AddTStore
while1:		RJMP 	while1



AddTStore:	LDI 	R16,0xF3
			LDI 	R20,0x82
			ADD		R20,R16 	
			LDI 	R17,0x00 
			ADC 	R20,R17 	
			RET
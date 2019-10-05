		
			.INCLUDE <m32def.inc>
			.ORG 	0x000
			
			LDI 	R16,HIGH(RAMEND)
			OUT		SPH,R16
			
			LDI		R16,LOW(RAMEND)
			OUT		SPL,R16
			
			

lcd_init:	LDI 	R16,0x7F			;Setting PORTC (PC0 to PC7) as output
			OUT		DDRC,R16			;DDRC=0x14
			
			
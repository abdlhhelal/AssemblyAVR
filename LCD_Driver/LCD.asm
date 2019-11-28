		
			.INCLUDE <m32def.inc>
			.ORG 	0x000
			.EQU	DB7 	=	0
			.EQU	DB6		= 	1
			.EQU	DB5		= 	2
			.EQU	DB4		= 	3
			.EQU	E 		= 	4
			.EQU 	RW		= 	5
			.EQU 	RS 		= 	6
			
			LDI 	R16,HIGH(RAMEND)
			OUT		SPH,R16
			
			LDI		R16,LOW(RAMEND)
			OUT		SPL,R16
		


lcd_init:	LDI 	R16,0x7F			;Setting PORTC (PC0 to PC6) as output
			OUT		DDRC,R16		
			
			CALL	delay_50ms			;Give some time to the LCD to start function properly
			
			;FUNCTION SET
			
			
			CALL 	WRINS
			LDI 	R16,0x1C			; D4,D5=1 , E still = 1
			OUT 	PORTC,R16
			SBI		PORTC,E				;Set E
			CALL 	Clear_E 			
			
			CALL 	delay_1ms			;wait for > 37 us
			
			
			;FUNCTION SET
			;Set interface data length to 4 bits, number of display lines to 2 and font to 5x8 dots
			
			CALL 	WRINS
			LDI 	R16,0x14			;D5=1 , E still = 1
			OUT 	PORTC,R16
			SBI		PORTC,E				;Set E
			CALL 	Clear_E
			
			CALL 	WRINS
			LDI 	R16,0x11			;D6=0,D7=1 , E=1
			OUT 	PORTC,R16
			SBI		PORTC,E				;Set E
			CALL 	Clear_E
			
			CALL 	delay_1ms			;wait for > 37 us

			;FUNCTION SET
			;Set interface data length to 4 bits, number of display lines to 2 and font to 5x8 dots
			
			CALL 	WRINS
			LDI 	R16,0x14			;D5=1 , E still = 1
			OUT 	PORTC,R16
			SBI		PORTC,E				;Set E
			CALL 	Clear_E
			
			CALL 	WRINS
			LDI 	R16,0x11			;D6=0,D7=1 , E=1
			OUT 	PORTC,R16
			SBI		PORTC,E				;Set E
			CALL 	Clear_E
			
			CALL 	delay_1ms			;wait for > 37 us
			
			;Display ON/OFF Control
			;Turn Cursor off - Display On - Blink off
			
			CALL 	WRINS
			LDI 	R16,0x10			;E=1 
			OUT 	PORTC,R16
			SBI		PORTC,E				;Set E
			CALL 	Clear_E
			
			CALL 	WRINS
			LDI 	R16,0x13			;D6=1,D7=1 , E=1
			OUT 	PORTC,R16
			SBI		PORTC,E				;Set E
			CALL 	Clear_E
			
			CALL 	delay_1ms			;wait for > 37 us
			
			
			;Display Clear

			CALL 	WRINS
			LDI 	R16,0x10 			;E=1
			OUT 	PORTC,R16
			SBI		PORTC,E				;Set E
			CALL	Clear_E
			
			CALL	WRINS
			LDI 	R16,0x18 			;D4=1 , E=1
			OUT 	PORTC,R16
			SBI		PORTC,E				;Set E
			CALL 	Clear_E
			
			CALL 	delay_5ms 			;Wait time >1.52mS
			
			
			;Entry Mode Set
			
			CALL 	WRINS
			LDI 	R16,0x10 			;E=1
			OUT		PORTC,R16
			SBI		PORTC,E				;Set E
			CALL	Clear_E
			
			CALL	WRINS
			CALL	R16,0x16			;D5=1, D6=1 , E=1
			OUT		PORTC,R16
			SBI		PORTC,E				;Set E
			CALL	Clear_E

			CALL delay_1ms 				;wait for > 37 us







	
			
WRINS:		CBI		PORTC,RS			;Clear RS
			CBI		PORTC,RW			;Clear RW
			RET
			
			
Clear_E: 	CALL 	delay_1us			;Minimum time for Enable Pulse Width Tpw

			CBI 	PORTC,E 			;Clear E
			
			CALL	delay_2us 			;Minimum time between two consecutive EN settings is 1200ns		
			RET
			
			
			
		
			
			
delay_1ms:	LDI		R16,1

loop1:		LDI 	R17,18 

loop2:		LDI 	R18,147 
   

loop3:		DEC		R18    
			BRNE    loop3  

			DEC     R17    
			BRNE    loop2  

			DEC     R16   
			NOP
			NOP
			NOP
			NOP
			NOP 	
			BRNE    loop1  
			RET			
			
			
delay_5ms:	LDI		R16,5

loop1:		LDI 	R17,18 

loop2:		LDI 	R18,147 
   

loop3:		DEC		R18    
			BRNE    loop3  

			DEC     R17    
			BRNE    loop2  

			DEC     R16   
			NOP
			NOP
			NOP
			NOP
			NOP 	
			BRNE    loop1  
			RET
			
			
delay_50ms:	LDI		R16,50

loop1:		LDI 	R17,18 

loop2:		LDI 	R18,147 
   

loop3:		DEC		R18    
			BRNE    loop3  

			DEC     R17    
			BRNE    loop2  

			DEC     R16   
			NOP
			NOP
			NOP
			NOP
			NOP 	
			BRNE    loop1  
			RET
			
			
			
delay_1us:	LDI		R16,1

loop1:		DEC     R16   
			NOP
			NOP
			NOP
			NOP
			NOP	
			BRNE    loop1 
			RET			
		
		
		
		
delay_2us:	LDI		R16,2

loop1:		DEC     R16   
			NOP
			NOP
			NOP
			NOP
			NOP	
			BRNE    loop1 
			RET			
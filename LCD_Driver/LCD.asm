		
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
			
			

lcd_init:	LDI 	R16,0x7F			;Setting PORTC (PC0 to PC7) as output
			OUT		DDRC,R16			;DDRC=0x14
			
			CALL	delay_40ms			;Give some time to the LCD to start function properly
			
			;FUNCTION SET	
			
			LDI		R16,0x0C			;D4,D5 =1 ( PC2,PC3 = 1 )
			IN 		R17,PORTC
			OR 		R17,R16
			OUT		PORTC,R17
			
			CALL	delay_1ms 			;delay according to datasheet 
			
			;FUNCTION SET
			
			
			
			
			
WRINS_ONCE:	CBI		PORTC,RS			;Clear RS
			CBI		PORTC,RW			;Clear RW
			SBI		PORTC,E				;Set E
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
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
			
			
delay_2ms:	LDI		R16,2

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
			
			
delay_40ms:	LDI		R16,40

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
		
		
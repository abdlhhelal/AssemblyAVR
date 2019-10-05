		
		
			.INCLUDE <m32def.inc>
			.equ	STACKSTART	= 0x085f
		
			.ORG	0x000
		
			LDI 	R16,HIGH(STACKSTART)
			OUT 	SPH,R16
			LDI 	R16,LOW(STACKSTART)
			OUT 	SPL,R16

			CALL 	motor_init
			
			
while1:		
			CALL 	delay_1sec
			CALL	on
			CALL 	delay_1sec
			CALL 	off
			
			RJMP 	while1			
			
			

motor_init: LDI		R16,0x09
			OUT		DDRB,R16		; DDRB=0x09  set DB0 and DB3 // Init Motor EN pin and Right pin
			LDI		R16,0x80	 
			OUT		0x31-0x20,R16	; DDRD=0x80 Set DD7  // init Motor LEFT

			LDI		R16,0x01 		; PORTB.0 =1 // Enable Motor Driver
			ORI 	R16,0x08
			OUT 	0x38-0x20,R16   ; PORTB.3 = 1 
			RET
			
		
delay_1sec:	LDI		R16,41	

loop1:		LDI 	R17,253 

loop2:		LDI 	R18,255 
   

loop3:		DEC		R18    
			BRNE    loop3  

			DEC     R17    
			BRNE    loop2  

			DEC     R16     	
			BRNE    loop1  




loop5:		LDI 	R16,43
	
loop6:  	LDI 	R17,255
	
loop7:		DEC		R17
			BRNE	loop7
	
			DEC 	R16
			BRNE 	loop6



loop8:		LDI 	R16,130
	
loop9:		DEC		R16
			BRNE	loop9
			RET
		
on:			LDI 	R16,0x09
			OUT 	0x38-0x20,R16   ; PORTB.3 = 1
			LDI 	R16,0x00
			OUT 	0x32-0x20,R16   ; PORTD.7 = 0
			RET

off:		CBI		0x38-0x20,3		; PORTB.3 = 0 
			CBI 	0x32-0x20,7 	; PORTD.7 = 0 // Turn off
			RET


		

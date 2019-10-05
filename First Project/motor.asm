

			.INCLUDE <m32def.inc>
			.equ	STACKSTART	= 0x085f
		
			.ORG	0x000
		
			LDI 	R16,HIGH(STACKSTART)
			OUT 	SPH,R16
			LDI 	R16,LOW(STACKSTART)
			OUT 	SPL,R16

			CALL 	motor_init
			CALL	but_init

loop:		CALL	check
			
off:		CBI		0x38-0x20,3		; PORTB.3 = 0 
			CBI 	0x32-0x20,7 	; PORTD.7 = 0 // Turn off
			RJMP 	loop
			
			
motor_init: LDI		R16,0x09
			OUT		DDRB,R16		; DDRB=0x09  set DB0 and DB3 // Init Motor EN pin and Right pin
			LDI		R16,0x80	 
			OUT		0x31-0x20,R16	; DDRD=0x80 Set DD7  // init Motor LEFT

			LDI		R16,0x01 		; PORTB.0 =1 // Enable Motor Driver
			OUT 	0x38-0x20,R16   
			RET


   
but_init:	CBI 	0x1A,4 			; PINA.4 INPUT (LEFT) --- |*~{ initialize the buttons pins }~*|
			SBI 	0x1B,4 			; for pull up resistance
			CBI 	0x1A,5 			; PINA.5 INPUT (RIGHT)
			SBI 	0x1B,5 			; for pull up resistance
			RET
			
check:		IN      R16,0x19 	    ; |*~{ Test the button status (left and right)}~*|
			ANDI	R16,0x10
			SUBI    R16,0x10
			BRNE    onleft
			
			IN	    R17,0x19
			ANDI    R17,0x20
			SUBI    R17,0x20
			BRNE    onright
			RET	
	
			
onleft:		LDI		R16,0x09
			OUT	    0x38-0x20,R16 	;PORTB.3 = 1
			LDI	    R16,0x00
			OUT		0x32-0x20,R16 	;PORTD.7 = 0
			RJMP	check
				
				
onright:	LDI		R16,0x01
			OUT		0x38-0x20,R16 	;PORTB.3 = 0 with keeping PORTB.0 = 1
			LDI		R16,0x80
			OUT		0x32-0x20,R16 	;PORTD.7 = 1
			RJMP	check
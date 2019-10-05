

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
			ORI 	R16,0x08
			OUT 	0x38-0x20,R16   ; PORTB.3 = 1 
			RET

but_init:	CBI 	0x1A,0 			; PINA.0 INPUT (Select) --- |*~{ initialize the buttons pins }~*|
			SBI 	0x1B,0 			; for pull up resistance
			CBI 	0x1A,6 			; PINA.6 INPUT (Back)
			SBI 	0x1B,6 			; for pull up resistance
			RET

check:		IN 		R16,0x19 		; |*~{ Testing if "select" and "back" buttons are pressed }~*| 
			ANDI 	R16,0x41
			SUBI 	R16,0x01
			BRBS	2,on
			RET
		

on:			LDI 	R16,0x09
			OUT 	0x38-0x20,R16   ; PORTB.3 = 1
			LDI 	R16,0x00
			OUT 	0x32-0x20,R16   ; PORTD.7 = 0
			RJMP 	loop

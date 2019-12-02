x = 1011 4-bit
 

>>>	1101


1- tmp=(x&0101)
2- y0=(tmp<<1)
3- tmp=(x&1010)
4- y1=(tmp>>1)
5- result = y0|y1

6- tmp=(result&0011) 
7- y0=(tmp<<2)
8- tmp=(result&1100)
9- y1=(tmp>>2)
10- result = y0|y1

rev_bit: ;read 4 bits in lower nibble of R16 and return the reverse in Lower nibble of R24

	push 	R16
	push 	R17
	push 	R18
	
	push 	R16
	
	
	ANDI	R16,0x05
	LSL 	R16
	MOV 		R17,R16   ;y0
	pop 	R16	
	
	ANDI	R16,0x0A
	LSR 	R16
	MOV 	R18,R16 ; y1
	OR	 	R18,R17
	push  	R18
	
	ANDI 	R18,0x03
	LSL 	R18
	LSL 	R18
	MOV		R17,R18 ; y0
	pop 	R18
	
	ANDI 	R18,0x0C
	LSR 	R18
	LSR 	R18 ; y1
	
	OR 		R18,R17 ; result = y0&y1
	MOV 	R24,R18

	pop 	R18
	pop 	R17
	pop 	R16
	
	RET





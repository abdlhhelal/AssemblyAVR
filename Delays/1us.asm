
.ORG 0x000

delay_1us:	LDI		R16,1

loop1:		DEC     R16   
			NOP
			NOP
			NOP
			NOP
			NOP	
			BRNE    loop1 

			RET			
		
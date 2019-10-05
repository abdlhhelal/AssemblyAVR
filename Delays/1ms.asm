

.ORG 0x000

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
		





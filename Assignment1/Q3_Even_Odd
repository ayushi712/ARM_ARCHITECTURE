AREA     appcode, CODE, READONLY
     export __main	 
	 ENTRY 
__main function
		  MOV R0,#0x94	; move the given number to r0	
		  AND R1,R0,#0x01 ; perform AND operation of the given number with 01 and store it in R1
		  CMP R1,#0x0 	; compare the value of R1 with 0
		  ITE EQ 					
		  MOVEQ R2,#0x0	; if R1 = 0, move 0 to R2 which shows that the number is EVEN
		  MOVNE R2,#0x1	; if R1 = 1, move 1 to R2 which shows that the number is ODD
STOP		      B STOP       ; stop program 
        endfunc
end 

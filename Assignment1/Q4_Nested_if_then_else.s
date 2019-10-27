     AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	

	   MOV R1,#0x00000004  
	   MOV R2,#0x0000000C 
	   MOV R3,#0x00000008  
	   MOV R4,#0x0000000F  
	   
       CMP R1, #8
       ITTEE LT
       ITE LT
	   SUBLT R1 , R1, R2 ; 	   
	   MOVGE R1, R3 ;
       MOVGE R1, R4 ; 
	   MOVGE R1, R4 ; 
	   
	   
stop    B stop ; stop program
     ENDFUNC
     END 
		 
; Nested If then else block will not work 
; Getting an error message as -- error: This instruction inside IT block has UNPREDICTABLE results 
; Even if we use ITTEE, we can write two "then" and "else" statements at max but ITE block must have 3 lines of code. So this is not possible.

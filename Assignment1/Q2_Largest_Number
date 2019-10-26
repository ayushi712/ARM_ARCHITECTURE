AREA     appcode, CODE, READONLY
     export __main	 
	 ENTRY 
__main  function
	          MOV R0 , #17   
	          MOV R1 , #44   
              MOV R2 , #13 	    			  
              CMP R0 , R1      ; Compare the two numbers in R0 and R1
              IT HI
              MOVHI R1 , R0 
			  CMP R1 , R2      ; Compare the two numbers in R1 and R2
			  IT HI 
			  MOVHI R2 , R1
			  MOV R3 , R2 
STOP		      B STOP       ; stop program 
        endfunc
end

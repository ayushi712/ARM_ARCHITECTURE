AREA     appcode, CODE, READONLY
     export __main	 
	 ENTRY 
__main  function
	          MOV R0 , #0    
	          MOV R1 , #1    
              MOV R7 , #1	 
              MOV R2 , R7	 ;output will be stored in R2 		  
              CMP R2 , #1
              IT LS 
              BLS STOP				  
			  SUB R3 , R2 ,#1     
LOOP          ADD R4 , R1 , R0  ;R4 to hold  value of f(n-1)+ f(n-2) 
              MOV R0 ,R1
              MOV R1 ,R4
              MOV R2 , R4
              SUB R3 ,#1 
			  CMP R3 ,#0
              BNE LOOP					  
STOP		  B STOP  ; stop program
        endfunc
end

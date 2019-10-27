  AREA     appcode, CODE, READONLY
     export __main	 
	 ENTRY 
__main  function
	          MOV R0 , #10	  ;A=10	
			  MOV R1 , #5    ;B=5
LOOP		  CMP R0 , R1
              IT EQ 
              BEQ STOP	
              ITE HI			  
			  SUBHI R0 , R0 , R1 			  
			  SUBLS R1 , R1 , R0
              B LOOP			  
STOP		      B STOP  ; stop the program
        endfunc
end

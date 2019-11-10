;Exponential Series
 
 PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION

	VMOV.F32 S1, #2;
	MOV R1, #20;Number of iterations 
	MOV R4, #1;
	VMOV.F32 S3, #1;
	VMOV.F32 S4, #1; 
	VMOV.F32 S5, #1; Save the result
	VMOV.F32 S7, #1;
	MOV R8, #1;
Loop 
	 CMP R1, R4;Compare
	 BLT stop; Condition to check to enter inside loop
	 VDIV.F32 S6, S1, S4; 
	 VMUL.F32 S3, S3, S6; 
	 VADD.F32 S5, S5, S3; 
	 VADD.F32 S4, S4, S7;
	 ADD R4, R4, R8; incrementing count
	 B Loop; 
	 
stop B stop ; stop program
	 ENDFUNC
	 END

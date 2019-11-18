; cosine series
     AREA    cosine,CODE,READONLY
     EXPORT __main
     ENTRY
__main  FUNCTION  
        MOV R0,#10 ; Number of iterations 'i'
        MOV R1,#1; counting Variable 'N'
        VLDR.F32 S0,=1;Stores the final value of sum of series elements 'S'
        VLDR.F32 S1,=1;Temporary Variable containing the intermediate series elements 'var'
        VLDR.F32 S2,=30; Value of 'x' (angle) in degrees
	 	VLDR.F32 S7,=0.0174533; value of 1 degree in radians
		VMUL.F32 S2,S2,S7 ; Converting degress into radians 
		VLDR.F32 S8,=1; var=1 for cosine, since cosine series starts from 1
		VLDR.F32 S9,=1; sum=1 for cosine
		
LOOP1   CMP R1,R0;Comparing counting variable'N' and number of iterations 'i'
        BLE LOOP;if N < i goto LOOP
stop    B stop;else goto stop

LOOP  	VMOV.F32 S3,R1; shifting the value of 'N' in fp register
        VCVT.F32.U32 S3,S3; Converting the value of N into 32 bit unsigned fp Number 
		VNMUL.F32 S4,S2,S2; -(x^2)
		MOV R2,#2
		MUL R3,R1,R2; 2N
		;Instructions for cosine series
		SUB R5,R3,#1; 2N-1 for cosine
		MUL R6,R3,R5; 2N*(2N-1) for cosine
		VMOV.F32 S10,R6; moving the value of '2N*(2N-1)' in floating register
		VCVT.F32.U32 S10,S10; Converting the value into 32 bit unsigned fp Number 
		VDIV.F32 S11,S4,S10 ; -(x^2)/2N*(2N-1)
		VMUL.F32 S8,S8,S11; var=var*(-(x^2))/2N*(2N-1)
		VADD.F32 S9,S9,S8;Finally add 'S' to 'var'(S8) and store it in 'S'
		ADD R1,R1,#1; increment the value of N by 1
		B LOOP1;Compare again
		
		endfunc
        end

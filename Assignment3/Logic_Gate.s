    THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 IMPORT printMsg
     IMPORT printMsg4p
	   ENTRY 
__main  FUNCTION

		;for LOGIC_NOT following are the valid combination of input as can be seen in python code 
		;X0->1, X1->0, X2->0 ; we are considering third input X2(deactive) to keep similarity for all logic operations
		;X0->1, X1->1, X2->0
	
		;S0 = W0,S1 = W1, S2 = W2, S3 = (Bias) as provided in the python code
			

LOGIC_AND1	BL printMsg
			VLDR.F32 S0,=-0.1
			VLDR.F32 S1,=0.2
			VLDR.F32 S2,=0.2
			VLDR.F32 S3,=-0.2
			MOV R0,#1; X0
			MOV R1,#0; X1
			MOV R2,#0; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG
			
LOGIC_AND2	VLDR.F32 S0,=-0.1
			VLDR.F32 S1,=0.2
			VLDR.F32 S2,=0.2
			VLDR.F32 S3,=-0.2
			MOV R0,#1; X0
			MOV R1,#0; X1
			MOV R2,#1; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG
			
LOGIC_AND3	VLDR.F32 S0,=-0.1
			VLDR.F32 S1,=0.2
			VLDR.F32 S2,=0.2
			VLDR.F32 S3,=-0.2
			MOV R0,#1; X0
			MOV R1,#1; X1
			MOV R2,#0; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG
			
LOGIC_AND4	VLDR.F32 S0,=-0.1
			VLDR.F32 S1,=0.2
			VLDR.F32 S2,=0.2
			VLDR.F32 S3,=-0.2
			MOV R0,#1; X0
			MOV R1,#1; X1
			MOV R2,#1; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG
			
LOGIC_OR1	BL printMsg
			VLDR.F32 S0,=-0.1
			VLDR.F32 S1,=0.7
			VLDR.F32 S2,=0.7
			VLDR.F32 S3,=-0.1
			MOV R0,#1; X0
			MOV R1,#0; X1
			MOV R2,#0; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG
			
LOGIC_OR2	VLDR.F32 S0,=-0.1
			VLDR.F32 S1,=0.7
			VLDR.F32 S2,=0.7
			VLDR.F32 S3,=-0.1
			MOV R0,#1; X0
			MOV R1,#0; X1
			MOV R2,#1; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG
			
LOGIC_OR3	VLDR.F32 S0,=-0.1
			VLDR.F32 S1,=0.7
			VLDR.F32 S2,=0.7
			VLDR.F32 S3,=-0.1
			MOV R0,#1; X0
			MOV R1,#1; X1
			MOV R2,#0; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG
			
LOGIC_OR4	VLDR.F32 S0,=-0.1
			VLDR.F32 S1,=0.7
			VLDR.F32 S2,=0.7
			VLDR.F32 S3,=-0.1
			MOV R0,#1; X0
			MOV R1,#1; X1
			MOV R2,#1; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG

LOGIC_NOT1	BL printMsg
			VLDR.F32 S0,=0.5
			VLDR.F32 S1,=-0.7
			VLDR.F32 S2,=0
			VLDR.F32 S3,=0.1
			MOV R0,#1; X0
			MOV R1,#0; X1
			MOV R2,#0; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG
			
LOGIC_NOT2	VLDR.F32 S0,=0.5
			VLDR.F32 S1,=-0.7
			VLDR.F32 S2,=0
			VLDR.F32 S3,=0.1
			MOV R0,#1; X0
			MOV R1,#0; X1
			MOV R2,#1; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG

LOGIC_NAND1	BL printMsg
			VLDR.F32 S0,=0.6
			VLDR.F32 S1,=-0.8
			VLDR.F32 S2,=-0.8
			VLDR.F32 S3,=0.3
			MOV R0,#1; X0
			MOV R1,#0; X1
			MOV R2,#0; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG
			
LOGIC_NAND2	VLDR.F32 S0,=0.6
			VLDR.F32 S1,=-0.8
			VLDR.F32 S2,=-0.8
			VLDR.F32 S3,=0.3
			MOV R0,#1; X0
			MOV R1,#0; X1
			MOV R2,#1; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG
			
LOGIC_NAND3	VLDR.F32 S0,=0.6
			VLDR.F32 S1,=-0.8
			VLDR.F32 S2,=-0.8
			VLDR.F32 S3,=0.3
			MOV R0,#1; X0
			MOV R1,#1; X1
			MOV R2,#0; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG
			
LOGIC_NAND4	VLDR.F32 S0,=0.6
			VLDR.F32 S1,=-0.8
			VLDR.F32 S2,=-0.8
			VLDR.F32 S3,=0.3
			MOV R0,#1; X0
			MOV R1,#1; X1
			MOV R2,#1; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG

LOGIC_NOR1	BL printMsg
			VLDR.F32 S0,=0.5
			VLDR.F32 S1,=-0.7
			VLDR.F32 S2,=-0.7
			VLDR.F32 S3,=0.1
			MOV R0,#1; X0
			MOV R1,#0; X1
			MOV R2,#0; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG

LOGIC_NOR2	VLDR.F32 S0,=0.5
			VLDR.F32 S1,=-0.7
			VLDR.F32 S2,=-0.7
			VLDR.F32 S3,=0.1
			MOV R0,#1; X0
			MOV R1,#0; X1
			MOV R2,#1; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG

LOGIC_NOR3	VLDR.F32 S0,=0.5
			VLDR.F32 S1,=-0.7
			VLDR.F32 S2,=-0.7
			VLDR.F32 S3,=0.1
			MOV R0,#1; X0
			MOV R1,#1; X1
			MOV R2,#0; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG

LOGIC_NOR4	VLDR.F32 S0,=0.5
			VLDR.F32 S1,=-0.7
			VLDR.F32 S2,=-0.7
			VLDR.F32 S3,=0.1
			MOV R0,#1; X0
			MOV R1,#1; X1
			MOV R2,#1; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG

LOGIC_XNOR1	BL printMsg
			VLDR.F32 S0,=-5
			VLDR.F32 S1,=20
			VLDR.F32 S2,=10
			VLDR.F32 S3,=1
			MOV R0,#1; X0
			MOV R1,#0; X1
			MOV R2,#0; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG

LOGIC_XNOR2	VLDR.F32 S0,=-5
			VLDR.F32 S1,=20
			VLDR.F32 S2,=10
			VLDR.F32 S3,=1
			MOV R0,#1; X0
			MOV R1,#0; X1
			MOV R2,#1; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG

LOGIC_XNOR3	VLDR.F32 S0,=-5
			VLDR.F32 S1,=20
			VLDR.F32 S2,=10
			VLDR.F32 S3,=1
			MOV R0,#1; X0
			MOV R1,#1; X1
			MOV R2,#0; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG

LOGIC_XNOR4	VLDR.F32 S0,=-5
			VLDR.F32 S1,=20
			VLDR.F32 S2,=10
			VLDR.F32 S3,=1
			MOV R0,#1; X0
			MOV R1,#1; X1
			MOV R2,#1; X2
			VMOV.F32 S9,R0
			VCVT.F32.S32 S9,S9
			VMOV.F32 S10,R1
			VCVT.F32.S32 S10,S10
			VMOV.F32 S11,R2
			VCVT.F32.S32 S11,S11
			B EXPONENT_X_CALCULATION
			LTORG

;S8 will store the final X0*W0 + X1*W1 + X2*W2 + Bias

EXPONENT_X_CALCULATION	VMUL.F32 S15, S0, S9
					VMOV.F32 S8, S15
					VMUL.F32 S16, S1, S10
					VADD.F32 S8, S8, S16
					VMUL.F32 S17, S2, S11
					VADD.F32 S8, S8, S17
					VADD.F32 S8, S8, S3
					B SIGMOID_ROUTINE
							
SIGMOID_ROUTINE	VMOV.F32 S21, S8; x:Number to find e^x
	        VMOV.F32 S22, #30; Number of iterations for e^x expansion
			VMOV.F32 S23, #1;  count
			VMOV.F32 S24, #1;  temp variable
			VMOV.F32 S25, #1;  result initialized to 1
			VMOV.F32 S27, #1;  register to hold 1
			VMOV.F32 S30,#1;

Loop 		VCMP.F32 S22, S23; Comparison done for excuting taylor series expansion of e^x for s2 number of terms
			VMRS.F32 APSR_nzcv,FPSCR; to copy fpscr to apsr
			BLT Loop1;
			VDIV.F32 S26, S21, S23; temp1=x/count
			VMUL.F32 S24, S24, S26; temp=temp*temp1;
			VADD.F32 S25, S25, S24; result=result+temp;
			VADD.F32 S23, S23, S27; count++
			B Loop;
			
Loop1	 	VADD.F32 S28,S25,S30;  (1+e^X)
			VDIV.F32 S29,S25,S28;	  g(X) = 1/(1+e^-X) == (e^X)/(1+e^X)
			B OUTPUT;
	 
OUTPUT 	VLDR.F32 S20,=0.5
		VCMP.F32 S29,S20
		VMRS.F32 APSR_nzcv,FPSCR;Used to copy fpscr to apsr
		ITE HI			; if g(X) > 0.5 , print 1 else print 0
		MOVHI R3,#1
		MOVLS R3,#0		
		BL printMsg4p
		ADD R5,R5,#1;	
		CMP R5,#1
		BEQ LOGIC_AND2
		CMP R5,#2
		BEQ LOGIC_AND3
		CMP R5,#3
		BEQ LOGIC_AND4
		CMP R5,#4
		BEQ LOGIC_OR1
		CMP R5,#5
		BEQ LOGIC_OR2
		CMP R5,#6
		BEQ LOGIC_OR3
		CMP R5,#7
		BEQ LOGIC_OR4
		CMP R5,#8
		BEQ LOGIC_NOT1
		CMP R5,#9
		BEQ LOGIC_NOT2
		CMP R5,#10
		BEQ LOGIC_NAND1
		CMP R5,#11
		BEQ LOGIC_NAND2
		CMP R5,#12
		BEQ LOGIC_NAND3
		CMP R5,#13
		BEQ LOGIC_NAND4
		CMP R5,#14
		BEQ LOGIC_NOR1
		CMP R5,#15
		BEQ LOGIC_NOR2
		CMP R5,#16
		BEQ LOGIC_NOR3
		CMP R5,#17
		BEQ LOGIC_NOR4
		CMP R5,#18
		BEQ LOGIC_XNOR1
		CMP R5,#19
		BEQ LOGIC_XNOR2
		CMP R5,#20
		BEQ LOGIC_XNOR3
		CMP R5,#21
		BEQ LOGIC_XNOR4
		
stop B stop ; stop program
	 ENDFUNC
	 END
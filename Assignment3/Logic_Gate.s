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
		VLDR.F32 S9,=1 ;X0
		VLDR.F32 S10,=1	;X1
		VLDR.F32 S11,=0	;X2
		
		;Storing inputs(changed manually) in general purpose register R0 to R3 to get it printed
		MOV R0,#1
		MOV R1,#1
		MOV R2,#1
		ADR.W  R4, BranchTable_Byte ; generate register relative address according to Branchtable_Byte lable
		
		MOV R5,#4 ; to select one option in switch case (gates)
		;0->LOGIC_AND
		;1->LOGIC_OR
		;2->LOGIC_NOT
		;3->LOGIC_NAND
		;4->LOGIC_NOR
		;5->LOGIC_XOR
		;6->LOGIC_XNOR
		TBB   [R4, R5] ; switch case equivalent in Arm cortex M4 so it will save table with length equivlent to BranchTable_Byte and R5 holds the table pointer
		
		;S0 = W0,S1 = W1, S2 = W2, S3 = (Bias) as provided in the python code

LOGIC_AND	VLDR.F32 S0,=-0.1
			VLDR.F32 S1,=0.2
			VLDR.F32 S2,=0.2
			VLDR.F32 S3,=-0.2
			B EXPONENT_X_CALCULATION

LOGIC_OR	VLDR.F32 S0,=-0.1
			VLDR.F32 S1,=0.7
			VLDR.F32 S2,=0.7
			VLDR.F32 S3,=-0.1
			B EXPONENT_X_CALCULATION

LOGIC_NOT	VLDR.F32 S0,=0.5
			VLDR.F32 S1,=-0.7
			VLDR.F32 S2,=0
			VLDR.F32 S3,=0.1
			B EXPONENT_X_CALCULATION

LOGIC_NAND	VLDR.F32 S0,=0.6
			VLDR.F32 S1,=-0.8
			VLDR.F32 S2,=-0.8
			VLDR.F32 S3,=0.3
			B EXPONENT_X_CALCULATION

LOGIC_NOR	VLDR.F32 S0,=0.5
			VLDR.F32 S1,=-0.7
			VLDR.F32 S2,=-0.7
			VLDR.F32 S3,=0.1
			B EXPONENT_X_CALCULATION

LOGIC_XOR	VLDR.F32 S0,=-5
			VLDR.F32 S1,=20
			VLDR.F32 S2,=10
			VLDR.F32 S3,=1
			B EXPONENT_X_CALCULATION

LOGIC_XNOR	VLDR.F32 S0,=-5
			VLDR.F32 S1,=20
			VLDR.F32 S2,=10
			VLDR.F32 S3,=1
			B EXPONENT_X_CALCULATION

;S8 will store the final X0*W0 + X1*W1 + X2*W2 + Bias

EXPONENT_X_CALCULATION	VMLA.F32 S8, S0, S9
					VMLA.F32 S8, S1, S10
					VMLA.F32 S8, S2, S11
					VADD.F32 S8, S8, S3
					B EXPONENT_ROUTINE

;offset calculation for switch case
BranchTable_Byte	DCB    0
					DCB    ((LOGIC_OR-LOGIC_AND)/2)
					DCB    ((LOGIC_NOT-LOGIC_AND)/2)
					DCB    ((LOGIC_NAND-LOGIC_AND)/2)
					DCB    ((LOGIC_NOR-LOGIC_AND)/2)
					DCB    ((LOGIC_XOR-LOGIC_AND)/2)
					DCB    ((LOGIC_XNOR-LOGIC_AND)/2)

;this program performs e^x,the result will be stored in S2
EXPONENT_ROUTINE	VMOV.F32 S2, #1 ; Sum Variable
			VMOV.F32 S6, #25 ; 'n' variable - sequence size
			VMOV.F32 S3, #1 ; constant

loop		VCMP.F32 S6, #0
			VMRS.F32 APSR_nzcv,FPSCR ; Transfer floating-point flags to the APSR flags
			BEQ SIGMOID_ROUTINE
			VDIV.F32 S4, S2, S6 ; sum/i
			VMUL.F32 S5, S8, S4 ; x*sum/i
			VADD.F32 S2, S3, S5 ; sum = 1 + (x * (sum/i))
			VSUB.F32 S6, S6, S3
			B loop

SIGMOID_ROUTINE	VDIV.F32 S2, S3, S2 ; 1/e^x
			VADD.F32 S2, S3, S2 ; 1 + 1/e^x
			VDIV.F32 S2, S3, S2 ; 1/(1 + 1/e^x)
			B OUTPUT

; S7 will hold 0.5 for comparison to finalise the logical output for a particular gate

OUTPUT	VLDR.F32 S7 ,=0.5 ; threshold value
		VCMP.F32 S2, S7 ; compare the output of sigmoid routine with S7 to decide whether it is a 1 or a 0
		VMRS.F32 APSR_nzcv,FPSCR ; Transfer floating-point flags to the APSR flags
		ITE HI
		MOVHI R3,#1; if S2 > S7
		MOVLS R3,#0; if S2 < S7
		BL printMsg4p	 
	 
stop B stop ; stop program
	 ENDFUNC
	 END


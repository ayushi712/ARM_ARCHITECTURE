     AREA     appcode, CODE, READONLY
     EXPORT __main
	 IMPORT printMsg4p
     ENTRY 
__main  FUNCTION 
		MOV R8,#1; starting value of theta is 1 degree
		
;Changing the origin of circle from (0,0) to the centre of vga screen (239,319)		
		VLDR.F32 S31,=319 ; x origin
		VLDR.F32 S30,=239 ; y origin
		
LOOP1		VLDR.F32 S20,=200  ; Value of radius(pixels)
			MOV R0,#0;
			MOV R1,#0; 
			CMP R8,#360; ending value of theta
			BLE LOOP2 ;
			B stop ;
		
LOOP2		VMOV.F32 S19,R8;
		VCVT.F32.U32 S19,S19;

;Converting angle from degrees to radian
		VLDR.F32 S16, =3.141592 ;Value of Pi. 
		VLDR.F32 S17, =180 ; 
		VDIV.F32 S18,S16,S17 ; Pi/180
		VMUL.F32 S1,S18,S19 ; Angle converting into radian


;Initializing registers for Sine Series

		MOV R10,#1; Storing intermediate result
		MOV R11,#2; temp variable (for factorial calculation)
		MOV R9,#3;  temp variable (for factorial calculation)
		VLDR.F32 S0,=0;
		VLDR.F32 S11, =1;
		VMUL.F32 S2,S1,S1;
		
;Sine series calculation
SINE	VDIV.F32 S1,S1,S11; 
		VADD.F32 S0,S0,S1;  Value of sin x will be stored in S0
		
		VMUL.F32 S1,S2,S1;  Series calculation
		MUL R10,R11,R9;  Factorial calculation
		ADD R11,R11,#2; incrementing the factorial variable by 2
		ADD R9,R9,#2;  incrementing the factorial variable by 2
		
		VNEG.F32 S1,S1;  Negate the value of register S1
		
		VMOV.F32 S11, R10
		VCVT.F32.U32 S11,S11; Floating point to unsigned decimal conversion
		
		ADD R1,R1,#1;  incrementing the counter
		CMP R1,#10;  Comparing the counter value
		BNE SINE 

;Intializing registers for Cosine Series

		MOV R12, #3; starting with 3! for cosine ad +2 will be added 
		MOV R6, #4;
		VLDR.F32 S5, =1;
		VMOV.F32 S15, S2;
		VNEG.F32 S15,S15; x^2 term
		VMOV.F32 S6,S15;
		VLDR.F32 S11, =2;
		MOV R1,#0;
		

;Cosine series calculation				
COSINE	VDIV.F32 S6,S6,S11;  Computing cosx term
		VADD.F32 S5,S5,S6;  Cos series calculation
		VMUL.F32 S6,S6,S2;  Calculating temp variable
		MUL R10,R12,R6;  
		
		VMOV.F32 S11, R10;
		VCVT.F32.U32 S11,S11;
		
		VNEG.F32 S6,S6;   Converting to negative number
		ADD R12,R12,#2;
		ADD R6,R6,#2;
		ADD R1,R1,#1; incrementing the counter
		CMP R1,#10;   Comparing the value of counter variable with n
		BNE COSINE


		
;Calculating X=r.cos(theta) and Y=r.sin(theta)

		VLDR.F32 S21,=1;
		VMUL.F32 S21,S20,S0;  Calculating Y co-ordinate
		VADD.F32 S21,S21,S30;	Adding y offset to Y coordinate	
		VCVT.S32.F32 S21,S21;  Converting floating point to integer value
		VMOV.F32 R0,S21; Moving to general purpose register

		VLDR.F32 S22,=1;
		VMUL.F32 S22,S20,S5;  Calculating X co-ordinate
		VADD.F32 S22,S22,S31; Adding x offset to x coordinate
		VCVT.S32.F32 S22,S22; Converting floating point to integer value	
		VMOV.F32 R1,S22; Moving to general purpose register 
		
		VCVT.S32.F32 S20,S20; Converting floating point to integer value
		VMOV.F32 R3,S20; Moving to general purpose register 
		
		MOV R2,R8; Value of theta (in degrees)
		
		ADD R8,R8,#1 ;
		BL printMsg4p
		B LOOP1
		
;Contents will be stored in respective registers as:		
;X=R1, Y=R0, Theta=R2, Radius=R3

stop    B stop ; stop program
	ENDFUNC
	END


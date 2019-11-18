 THUMB
	  AREA     factorial, CODE, READONLY
	  ;IMPORT printMsg
	  IMPORT printMsg4p
      	  EXPORT __main
      	  ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 
      
      VLDR.F32 s31, =10; interval of theta
      VLDR.F32 s30, =180; ending value of theta	   
      VLDR.F32 s21, =-180; starting value of theta

loop1  BL sinecosine
	VADD.F32 s21,s21,s31; incrementing theta by 10 degrees
	VLDR.F32 s29, =200; value of radius
	VMOV.F32 s1,s29
	
	VMUL.F32 s28,s29,s7; x=r.cos(theta)
	VMUL.F32 s29,s29,s5; y=r.sin(theta)

;changing origin from (0,0) to (239,319)

	VLDR.F32 s27, =239
	VLDR.F32 s26, =319
	
	VADD.F32 s28,s28,s27
	VADD.F32 s29,s29,s26


        VCVT.U32.F32 s28,s28; converting fp to general purpose registers
        VCVT.U32.F32 s25,s25; converting fp to general purpose registers
	VCVT.U32.F32 s1,s1; converting fp to general purpose registers
        VCVT.U32.F32 s29,s29; converting fp to general purpose registers

       VMOV.F32 R2,S1; moving to general purpose register(radius)
       VMOV.F32 R3,S25; moving to general purpose register(theta)
       VMOV.F32 R0,S28; moving to general purpose register(x) 
       VMOV.F32 R1,S29; moving to general purpose register(y)
       BL printMsg4p	 
   
       VCMP.F32 s21,s30
       vmrs APSR_nzcv,FPSCR
       BLE loop1
	
sinecosine 

       VLDR.F32 s22, =3.14159; value of pie
       VLDR.F32 s23, =180
       VDIV.F32 s24,s22,s23; (pi/180)
       VMUL.F32 s0,s24,s21	
       VMOV.F32 s25,s21
		
      MOV R0,#0x00000014; no of iterations
	 
      VLDR.F32 s2, =1; iterations count i
      MOV R7,#0x00000001
      
      VLDR.F32 s3, =1; ;increment i
      MOV R8,#0x00000001
      
      VMOV.F32 s4, s0; Product_sin s4	 
      VMOV.F32 s5, s0; result_sin s5
      
      VLDR.F32 s6, =1; Product_cos s6	 
      VLDR.F32 s7, =1; result_cos s7	  
      
      VMUL.F32 s8,s0,s0; x^2
      VLDR.F32 s9, =2; for calculating 2i

Loop  
; product_sin x * x/ 2i * 2i+1  
; storing it in s13
      VMUL.F32 s10,s2,s9
      VADD.F32 s11,s10,s3
      VMUL.F32 s12,s10,s11
      VDIV.F32 s13,s8,s12
      
      VSUB.F32 s14,s10,s3
      VMUL.F32 s15,s10,s14 ; 2i * 2i-1 
      VDIV.F32 s16,s8,s15      	
      VNMUL.F32 s4,s4,s13; Product_sin s4 
      VNMUL.F32 s6,s6,s16; Product_cos s6 
            
      VADD.F32 s5,s5,s4; sine_result            
      VADD.F32 s7,s7,s6; cos_result

      VADD.F32 s2,s2,s3
      ADD R7,R7,R8
      CMP R7,R0	
      BLT Loop
      BX lr
	
stop    B stop ; stop program
      ENDFUNC
      END 

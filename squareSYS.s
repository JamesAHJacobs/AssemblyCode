; Program to print Mandelbrot art
; Username: psyjaj
; Name: James Jacobs
; Student ID: 4244791

	B main

star	DEFB "*",0
NL	DEFB "\n",0
pwidth	DEFB "Please enter the width for your rectangle: ",0
pheight	DEFB "\nPlease enter the height for your rectangle: ",0
error	DEFB "Value cannot be greater than 80",0
error2	DEFB "Value must be numeric",0
errors1	DEFB "\nPlease enter a value greater than 1\n",0
	
	ALIGN

main	MOV	R1, #0
	MOV	R2, #0
	MOV	R5, #0
	MOV	R6, #0
	MOV	R10, #10

ph	ADR 	R0, pwidth
	SWI 	3

input	ADD	R5, R5, #1
	SWI 	1
	CMP 	R0, #10
	BEQ handle
	CMP 	R0, #47
	BLS errors2
	CMP 	R0, #58
	BHS errors2
	SUB 	R0, R0, #48
	SWI 	4
	MLA	R1, R1, R10, R0
	CMP	R1, #80
	BGT	errors
	B input

handle	CMP R5, #1
	BEQ error1
	BNE pw

handle2	CMP R6, #1
	BEQ error2
	BNE drawr

pw	ADR	R0, pheight
	SWI 3

input2	ADD	R6, R6, #1
	SWI 	1
	CMP 	R0, #10
	BEQ handle2
	CMP 	R0, #47
	BLS errors2
	CMP 	R0, #58
	BHS errors2
	SUB R0, R0, #48
	SWI 4
	MLA	R2, R2, R10, R0
	CMP	R2, #80
	BGT	errors
	B input2

drawr	
	ADRL	R0, NL
	SWI	3
	MOV 	R4, #0
	B loop1

across	
	MOV 	R3, #0
	B loop2

down	
	ADRL 	R0, star
	SWI 	3
	ADD 	R3, R3, #1

loop2	
	CMP 	R3, R1
	BNE down
	ADRL 	R0, NL
	SWI 	3
	ADD 	R4, R4, #1

loop1	CMP 	R2, R4
	BNE across
	ADRL 	R0, NL
	SWI 	3
	B main

errors	ADRL	R0, NL
	SWI	3
	ADRL	R0, error
	SWI	3
	B end

error1	ADRL	R0, NL
	SWI	3
	ADRL 	R0, errors1
	SWI 3
	B main

error2	ADRL	R0, NL
	SWI	3
	ADRL	R0, errors1
	SWI 3
	B pw

end	SWI 2

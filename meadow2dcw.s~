; Program to print 'The Meadow Song'
; Username: psyjaj
; Name: James Jacobs
; Student ID: 4244791

	B main

answer	DEFW 0
first	DEFB " men went to mow\n",0
second 	DEFB "Went to mow a meadow\n",0
third 	DEFB " men, ",0
fourth 	DEFB "1 man and his dog, Spot\n",0
fifth	DEFB "Went to mow a meadow\n\n",0
sixth	DEFB " man went to mow\n",0
seven	DEFB "Please enter how many verses you'd like to print in binary: ",0
elev	DEFB "\n",0
error	DEFB "INVALID INPUT",0


	ALIGN

main	ADRL R0, seven
	MOV R1, #0
	SWI 3

loop	MOV R0, #0
	MOV R8, #2
	SWI 1
	CMP R0, #10
	BEQ calc
	CMP R0, #47
	BLS errors
	CMP R0, #50
	BHS errors
	SUB R0, R0, #48
	SWI 4
	MLA R1, R1, R8, R0
	B loop

calc	ADRL R0, elev
	SWI 3
	MOV R0, R1
	;SWI 4
	STR R0, answer
	LDR R1, answer
	LDR R2, answer
	ADRL R0, elev
	B then

then	MOV R0, R2		;Move, into the address R0, the value R2
	SWI 4			;print the value in R0 (4)
	CMP R0, #1		;compare the value in R0 with the value 1
	BEQ oneman		;branch to the part 'oneman' if the value in R0 is equal to 1
return	ADRL R0, first		
	SWI 3			;print the line 'first'
	ADRL R0, second
	SWI 3			;print the line 'second'
	MOV R1, R2		;move into the address, the value in the address R2

loop1	CMP R1, #1		;compare the value in the address R1 with the value 1
	BEQ last		;if R1 equals 1, branch to the part 'last'
	MOV R0, R1		;move into the address, R0 the value in the address R1
	SWI 4			;print the value in the address R0
	ADRL R0, third
	SWI 3			;print the line 'third'
	SUB R1, R1, #1		;into the address R1, put the value of R1 subtracted by 1

	B loop1			;branch to the part 'loop'

next	ADRL R0, fourth		
	SWI 3			;print the line 'fourth'
	ADRL R0, fifth
	SWI 3			;print the line 'fifth'
	B next			;branch to the part 'next'

last	ADRL R0, fourth		
	SWI 3			;print the line 'fourth'
	ADRL R0, fifth
	SWI 3			;print the line 'fifth'
	SUB R2, R2, #1		;into the address R2, put the value of R2 subtracted by 1
	CMP R2, #0		;compare the value in the address R2 with the value 0
	BNE then		;if the value in R2 is not equal to 0, branch to the part 'then'
	B end			;branch to the part 'end'

oneman	ADRL R0, sixth
	SWI 3			;print the line 'sixth'
	ADRL R0, second
	SWI 3			;print the line 'second'
	ADRL R0, fourth
	SWI 3			;print the line 'fourth'
	ADRL R0, fifth
	SWI 3			;print the line 'fifth'
	B end

errors	ADRL R0, elev
	SWI 3
	ADRL R0, error
	SWI 3
	ADRL R0, elev
	SWI 3
	B main

end	SWI 2			;end

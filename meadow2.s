; Program to print 'The Meadow Song'
; Username: psyjaj
; Name: James Jacobs
; Student ID: 4244791

	B main

verses 	DEFW 4
first	DEFB " men went to mow\n",0
second 	DEFB "Went to mow a meadow\n",0
third 	DEFB " men, ",0
fourth 	DEFB "1 man and his dog, Spot\n",0
fifth	DEFB "Went to mow a meadow\n\n",0
sixth	DEFB " man went to mow\n",0

	ALIGN

main	LDR R1, verses		;sets R1 to the value 4
	LDR R2, verses		;sets R2 to the value 4
	B then			;Branches to the part 'then'

then	MOV R0, R2		;Move, into the address R0, the value R2
	SWI 4			;print the value in R0 (4)
	CMP R0, #1		;compare the value in R0 with the value 1
	BEQ oneman		;branch to the part 'oneman' if the value in R0 is equal to 1
return	ADR R0, first		
	SWI 3			;print the line 'first'
	ADR R0, second
	SWI 3			;print the line 'second'
	MOV R1, R2		;move into the address, the value in the address R2

loop	CMP R1, #1		;compare the value in the address R1 with the value 1
	BEQ last		;if R1 equals 1, branch to the part 'last'
	MOV R0, R1		;move into the address, R0 the value in the address R1
	SWI 4			;print the value in the address R0
	ADR R0, third
	SWI 3			;print the line 'third'
	SUB R1, R1, #1		;into the address R1, put the value of R1 subtracted by 1

	B loop			;branch to the part 'loop'

next	ADR R0, fourth		
	SWI 3			;print the line 'fourth'
	ADR R0, fifth
	SWI 3			;print the line 'fifth'
	B next			;branch to the part 'next'

last	ADR R0, fourth		
	SWI 3			;print the line 'fourth'
	ADR R0, fifth
	SWI 3			;print the line 'fifth'
	SUB R2, R2, #1		;into the address R2, put the value of R2 subtracted by 1
	CMP R2, #0		;compare the value in the address R2 with the value 0
	BNE then		;if the value in R2 is not equal to 0, branch to the part 'then'
	B end			;branch to the part 'end'

oneman	ADR R0, sixth
	SWI 3			;print the line 'sixth'
	ADR R0, second
	SWI 3			;print the line 'second'
	ADR R0, fourth
	SWI 3			;print the line 'fourth'
	ADR R0, fifth
	SWI 3			;print the line 'fifth'

end	SWI 2			;end
	


; Program to print Mandelbrot art
; Username: psyjaj
; Name: James Jacobs
; Student ID: 4244791

	B main

xstart	DEFW	-400
xend	DEFW	400
ystart	DEFW	-265
yend	DEFW	265
star	DEFB	"*",0
space	DEFB	" ",0
NL	DEFB	"\n",0


	ALIGN

main	MOV R6, #0
	MOV R7, #0
	MOV R8, #0
	ADR R0, NL
	SWI 3
	LDR R8, ystart
	B wc2

wl2	LDR R7, xstart
	B wc1

wl1	MOV R1, #4096
	MOV R2, #0
	MOV R3, #0
	MOV R4, #0
	MOV R5, #0

loopdo	SUB R6, R2, R5
	ADD R6, R6, R7
	MUL R4, R4, R3
	MOV R4, R4  LSL #1
	MOV R4, R4, ASR #8
	ADD R4, R4, R8
	MOV R3, R6
	MUL R2, R3, R3
	MOV R2, R2  ASR #8
	MUL R5, R4, R4
	MOV R5, R5 ASR #8
	SUB R1, R1, #1
	ADD R9, R2, R5
	CMP R9, #1024
	BPL loopit
	CMP R1, #0
	BNE loopdo

loopit	CMP R1, #0
	BNE Pstar
	ADR R0, space
	SWI 3
	B next

Pstar	ADR R0, star
	SWI 3

next	ADD R7, R7, #10

wc1	LDR R9, xend
	CMP R7, R9
	BLE wl1
	ADR R0, NL
	SWI 3
	ADD R8, R8, #10

wc2	LDR R9, yend
	CMP R8, R9
	BLE wl2
	ADR R0, NL
	SWI 3
	SWI 2


.org 0x100


.data
	x: .word 2


.text
.global _start
_start:
	
	LDR R1, =x
	LDR R0, [R1]				//R0 = x = 2
	
	MUL R2, R0, R0
	MUL R2, R2, R0			//R2 = x^3
	MOV R8, #4
	MUL R2, R2, R8			//R2 = 4x^3	
	
	MUL R3, R0, R0			//R3 = x^2
	MOV R9, #5
	MUL R3, R3, R9			//R3 = 5x^2
	
	MOV R10, #2
	MUL R4, R0, R10			//R4 = 2x
	
	ADD R5, R2, R3
	ADD R5, R5, #1			//R5 = 4x^3+5x^2+1
	
	SUB R6, R5, R4
	
	
.end

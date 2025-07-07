.org 0x100


.data
	x: .word 0


.text
.global _start
_start:
	
	ldr r1, =x
	ldr r0, [r1]
	
	cmp r0, #0
	bgt isPos
	blt isNeg
	
	mov r8, #10			//Number is 0
	mov r7, #1
	swi 0
	
isPos:
	mov r8, #1			//Number is Positive
	mov r7, #1
	swi 0
	
isNeg:
	mov r8, #0			//Number is Negative
	mov r7, #1
	swi 0
	
.end

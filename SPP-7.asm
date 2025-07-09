.org 0x100


.data
    array: .word 6, 3, 1, 4, 0, 8, 9, 2, 7, 5
	even: .space 44
	 odd: .space 44
	
.text
.global _start

_start:
	ldr r0, =array
	ldr r1, =even
	ldr r2, =odd
	
	mov r8, #0
	
loop:	
	ldr r3, [r0], #4
	
	ands r4, r8, #1
	beq isEven
	bne isOdd

isOdd:
	str r3, [r2], #4

next:
	add r8, #1
	cmp r8, #10
	beq exit
	b loop

isEven:
	str r3, [r1], #4
	b next
	
exit:
	@ Exit the program
    mov r7, #1           @ syscall: exit
    swi 0                @ make the system call
	
	
	
	
	
	
	
	
	
	
	

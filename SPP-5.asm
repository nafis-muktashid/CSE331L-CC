.org 0x100


.data
    arr: .word 1, 2, 3, 4, 5
   arr2: .word 6, 4, 5, 1, 4
    sum: .space 20
	

.text
.global _start


_start:
	
	ldr r3, =arr		
	ldr r0, [r3]
	ldr r2, =arr2
	ldr r1, [r2]
	
	ldr r5, =sum
	
	mov r8, #1			@r8 -> counter

while:
	
	add r4, r0, r1
	str r4, [r5], #4
	
	add r3, r3, #4
	add r2, r2, #4
	ldr r0, [r3]
	ldr r1, [r2]
	
	add r8, r8, #1
	cmp r8, #6
	bne while
	cmp r8, #6
	beq exit
	
	
		
exit:
	@ Exit the program
    mov r7, #1           @ syscall: exit
    swi 0                @ make the system call
	
	
	
	
	
	
	
	
	
	
	

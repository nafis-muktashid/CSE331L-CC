.org 0x100


.data
  x: .word 0
	y: .word 1
	

.text
.global _start


_start:

	ldr r0, =x
	ldr r0, [r0]

	ldr r1, =y
	ldr r1, [r1]

	mov r3, #2

while:
	add r2, r0, r1

	mov r0, r1
	mov r1, r2 
	add r3, #1
	
	cmp r3, #24
	bne while
	cmp r3, #24
	beq exit
	
exit:
	@ Exit the program
    mov r7, #1           @ syscall: exit
    swi 0                @ make the system call
	
	
	
	
	
	
	
	
	
	
	

.org 0x100


.data
    string: .asciz "Hello1234ABCxyz"
	  char: .byte '4'
	
.text
.global _start

_start:
	
	ldr r0, =string
	ldr r2, =char
	ldrb r2, [r2]
	mov r9, #1
	
	mov r1, #0
	
loop:
	cmp r1, #15
	beq exit
	
	ldrb r3, [r0], #1
	add r1, r1, #1
	
	cmp r3, r2
	beq found
	
	b loop
	
	
found:
	mov r8, r1
	mov r9, #0
	
	
exit:
	@ Exit the program
    mov r7, #1           @ syscall: exit
    swi 0                @ make the system call
	

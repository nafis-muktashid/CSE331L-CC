.org 0x100


.data
    arr: .word 3, 6, 7, 9, 12, 32, 76, 43, 21, 4
	

.text
.global _start


_start:
	
	ldr r5, =arr		    @r5 -> arr
	ldr r0, [r5], #4	  @r0 -> current
	
	ldr r1, [r5]		    @r1 -> max
	
	mov r3, #2			    @r3 -> counter

while:
	cmp r0, r1
	bgt r0_big
	
	loop_continue:
	
	ldr r0, [r5, #4]!

	add r3, r3, #1
	cmp r3, #11
	bne while
	cmp r3, #11
	beq exit
	
	
	
r0_big:
	mov r1, r0
	b loop_continue
	
	
exit:
	@ Exit the program
    mov r7, #1           @ syscall: exit
    swi 0                @ make the system call
	
	
	
	

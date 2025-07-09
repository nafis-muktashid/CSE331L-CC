.org 0x100


.data
    string: .asciz "Hello1234ABCxyz"
	 digit: .space 15
	  char: .space 15
	
.text
.global _start

_start:
	
	ldr r0, =string
	mov r8, #0
	mov r9, #0
	mov r3, #0
	
loop:
	cmp r3, #15
	beq exit	
	
	add r3, r3, #1
	ldrb r1, [r0], #1
	
	cmp r1, #'0'
	blt check_caps
	cmp r1, #'9'
	bgt check_caps
	
	add r9, r9, #1
	b loop
	
check_caps:
	cmp r1, #'A'
	blt check_lows
	cmp r1, #'Z'
	ble isCaps
	
check_lows:
	cmp r1, #'a'
	blt loop
	cmp r1, #'z'
	bgt loop


isCaps:
	add r8, r8, #1
	b loop
	
	
	
exit:
	@ Exit the program
    mov r7, #1           @ syscall: exit
    swi 0                @ make the system call
	
	

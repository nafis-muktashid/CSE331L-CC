.org 0x100


.data
    marks: .word 7, 6, 5, 4, 7, 6, 6, 8, 3, 10
	freq: .space 44
	
.text
.global _start

_start:
	
	ldr r1, =freq
	mov r2, #0			@i => freq
	
	outer:
		mov r5, #0		@freq of cur i
		ldr r0, =marks
		mov r4, #10		@marksArraySize
		
		inner:
			ldr r3, [r0], #4
			
			cmp r3, r2
			bne nextIdx
			
			add r5, #1
			
			nextIdx:
				subs r4, #1
				bne inner
				
				@store value
				lsl r6, r2, #2
				add r6, r1
				str r5, [r6]
				
				add r2, #1
				cmp r2, #11
				bne outer
				
	
	
exit:
	@ Exit the program
    mov r7, #1           @ syscall: exit
    swi 0                @ make the system call
	
	
	
	
	
	
	
	
	
	
	

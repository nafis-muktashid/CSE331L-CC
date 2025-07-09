.org 0x100

.data
    input: .asciz "Hel,lowor,ld"
    output: .space 64

.text
.global _start

_start:
    ldr R0, =input
    ldr R1, =output
    mov R2, #0
    mov R8, #0

loop:
    ldrb R3, [R0], #1       
    cmp R8, #12             
    beq exit

    add R8, R8, #1

    cmp R3, #','            
    bne store_char          

    strb R3, [R1], #1       
    mov R5, #' '            
    strb R5, [R1], #1       
    b loop

store_char:
    strb R3, [R1], #1       
    b loop

exit:
    mov r7, #1              @ syscall: exit
    swi 0                   @ make the system call

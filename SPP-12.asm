.org 0x100

.data
    str1:   .asciz "Hello World, "
    str2:   .asciz "this is Assembly Language Programming"
    output: .space 128      @ Enough space for the full result

.text
.global _start

_start:
    LDR R0, =str1       @ R0 = pointer to str1
    LDR R1, =output     @ R1 = destination/output

copy_str1:
    LDRB R2, [R0], #1   @ Load byte from str1
    CMP R2, #0
    BEQ copy_str2       @ If null terminator, go to next string
    STRB R2, [R1], #1   @ Store byte to output
    B copy_str1

copy_str2:
    LDR R0, =str2       @ R0 = pointer to str2

copy_loop2:
    LDRB R2, [R0], #1
    CMP R2, #0
    BEQ finish
    STRB R2, [R1], #1
    B copy_loop2

finish:
    MOV R2, #0
    STRB R2, [R1]       @ Null-terminate output string

exit:
    MOV R7, #1
    SWI 0

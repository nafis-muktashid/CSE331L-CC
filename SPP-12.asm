.org 0x100

.data
    str1:   .asciz "Hello World, "
    str2:   .asciz "this is Assembly Language Programming"
    output: .space 128

.text
.global _start

_start:
    LDR R0, =str1      @ R0 = source 1
    LDR R1, =output    @ R1 = destination

copy1:
    LDRB R2, [R0], #1  @ Load byte from str1
    CMP R2, #0
    BEQ copy2
    STRB R2, [R1], #1  @ Store in output
    B copy1

copy2:
    LDR R0, =str2      @ R0 = source 2

copy_loop2:
    LDRB R2, [R0], #1  @ Load byte from str2
    CMP R2, #0
    BEQ done
    STRB R2, [R1], #1
    B copy_loop2

done:
    MOV R2, #0
    STRB R2, [R1]      @ Null-terminate

exit:
    MOV R7, #1
    SWI 0

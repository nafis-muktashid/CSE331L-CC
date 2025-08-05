.org 0x100

.data
    input:    .asciz "racecar"     @ Try changing this to "hellyeah"
    output:   .space 8             @ To store "Yes" or "No"
    yes:      .asciz "Yes"
    no:       .asciz "No"

.text
.global _start

_start:
    LDR R0, =input         @ R0: base of input
    MOV R1, #0             @ R1: counter to find string length

find_len:
    LDRB R2, [R0, R1]
    CMP R2, #0
    BEQ start_check
    ADD R1, R1, #1
    B find_len

start_check:
    SUB R1, R1, #1         @ R1 = end index (length - 1)
    MOV R2, #0             @ R2 = start index

check_loop:
    CMP R2, R1
    BGE is_palindrome      @ If start >= end, it's a palindrome

    LDRB R3, [R0, R2]      @ char at start
    LDRB R4, [R0, R1]      @ char at end
    CMP R3, R4
    BNE not_palindrome

    ADD R2, R2, #1
    SUB R1, R1, #1
    B check_loop

is_palindrome:
    LDR R5, =yes
    B store_result

not_palindrome:
    LDR R5, =no

store_result:
    LDR R6, =output

copy:
    LDRB R7, [R5], #1
    STRB R7, [R6], #1
    CMP R7, #0
    BNE copy

exit:
    MOV R7, #1
    SWI 0

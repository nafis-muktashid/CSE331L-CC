.org 0x100

.data
    input:    .asciz "madam"     
    output:   .space 8             
    yes_str:  .asciz "Yes"
    no_str:   .asciz "No"

.text
.global _start

_start:
    LDR R0, =input         
    MOV R1, #0             

find_len:
    LDRB R2, [R0, R1]
    CMP R2, #0
    BEQ check_palindrome
    ADD R1, R1, #1
    B find_len

check_palindrome:
    SUB R1, R1, #1         
    MOV R2, #0             
    LDR R3, =input         

compare_loop:
    CMP R2, R1
    BGE is_palindrome

    LDRB R4, [R3, R2]      
    LDRB R5, [R3, R1]      
    CMP R4, R5
    BNE not_palindrome

    ADD R2, R2, #1
    SUB R1, R1, #1
    B compare_loop

is_palindrome:
    LDR R0, =yes_str
    B store_result

not_palindrome:
    LDR R0, =no_str

store_result:
    LDR R1, =output

copy_loop:
    LDRB R2, [R0], #1
    STRB R2, [R1], #1
    CMP R2, #0
    BNE copy_loop

exit:
    MOV R7, #1     
    SWI 0

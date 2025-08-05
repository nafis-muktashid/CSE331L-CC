.org 0x100

.data
    matrix: .space 16     @ 4x4 identity matrix (1 byte per element)

.text
.global _start

_start:
    LDR R0, =matrix       @ R0 = base of matrix
    MOV R1, #0            @ R1 = index from 0 to 15

fill_loop:
    CMP R1, #16
    BEQ done

    MOV R2, R1            @ Pass current index to procedure
    BL check_diagonal     @ R2 will return 1 if diagonal, else 0
    STRB R2, [R0, R1]     @ Store value at matrix[index]

    ADD R1, R1, #1
    B fill_loop

done:
    MOV R7, #1
    SWI 0

@ --------------------------------
@ Procedure: check_diagonal
@ Input : R2 = index
@ Output: R2 = 1 if index % 5 == 0 else 0
@ --------------------------------
check_diagonal:
    MOV R3, R2
    MOV R4, #5

mod_loop:
    CMP R3, R4
    BLT finish_mod
    SUB R3, R3, R4
    B mod_loop

finish_mod:
    CMP R3, #0
    MOVEQ R2, #1      @ If mod == 0 → diagonal
    MOVNE R2, #0
    BX LR

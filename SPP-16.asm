.org 0x100

.data
    @ 4x3 original matrix stored row-wise: 4 rows, 3 cols
    mat4x3: .byte 1, 2, 3,  4, 5, 6,  7, 8, 9,  10, 11, 12
    mat3x4: .space 12   @ transposed matrix (3 rows, 4 cols)

.text
.global _start

_start:
    LDR R0, =mat4x3      @ R0 = pointer to original 4x3
    LDR R1, =mat3x4      @ R1 = pointer to transposed 3x4

    MOV R2, #0           @ row = 0

row_loop:
    CMP R2, #4           @ for 4 rows
    BEQ done

    MOV R3, #0           @ col = 0

col_loop:
    CMP R3, #3           @ for 3 columns
    BEQ next_row

    @ Calculate original index: index = row*3 + col
    MOV R4, R2
	MOV R8, #3
    MUL R4, R4, R8
    ADD R4, R4, R3

    LDRB R5, [R0, R4]    @ Load mat[row][col]

    @ Calculate transpose index: index = col*4 + row
    MOV R6, R3
	MOV R9, #4
    MUL R6, R6, R9
    ADD R6, R6, R2

    STRB R5, [R1, R6]    @ Store in transposed matrix

    ADD R3, R3, #1
    B col_loop

next_row:
    ADD R2, R2, #1
    B row_loop

done:
    MOV R7, #1
    SWI 0

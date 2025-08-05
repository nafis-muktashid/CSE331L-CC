.org 0x100

.data
    input:      .asciz "Final Assignment"
    upper_out:  .space 64
    lower_out:  .space 64

.text
.global _start

@ -------------------------------
@ MACRO: Convert character to UPPERCASE
@ -------------------------------
.macro TO_UPPER rChar, rDest
    CMP \rChar, #'a'
    BLT no_upper
    CMP \rChar, #'z'
    BGT no_upper
    SUB \rChar, \rChar, #32
no_upper:
    STRB \rChar, [\rDest], #1
.endm

@ -------------------------------
@ MACRO: Convert character to LOWERCASE
@ -------------------------------
.macro TO_LOWER rChar, rDest
    CMP \rChar, #'A'
    BLT no_lower
    CMP \rChar, #'Z'
    BGT no_lower
    ADD \rChar, \rChar, #32
no_lower:
    STRB \rChar, [\rDest], #1
.endm

@ ----------- PROGRAM START -----------
_start:

    @ -------- Convert to UPPERCASE --------
    LDR R0, =input         @ R0 = input pointer
    LDR R1, =upper_out     @ R1 = output pointer (uppercase)

loop_upper:
    LDRB R2, [R0], #1
    CMP R2, #0
    BEQ done_upper
    TO_UPPER R2, R1
    B loop_upper

done_upper:
    MOV R2, #0
    STRB R2, [R1]          @ Null terminate

    @ -------- Convert to LOWERCASE --------
    LDR R0, =input         @ reset input pointer
    LDR R1, =lower_out     @ output pointer (lowercase)

loop_lower:
    LDRB R2, [R0], #1
    CMP R2, #0
    BEQ done_lower
    TO_LOWER R2, R1
    B loop_lower

done_lower:
    MOV R2, #0
    STRB R2, [R1]          @ Null terminate

exit:
    MOV R7, #1
    SWI 0

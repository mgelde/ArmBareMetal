.syntax unified
.thumb

.section .vectable
//TODO stack pointer
.long 0x20001000
//plus 1 because of thumb mode
.long _start + 1


.data
.long 0xdeadbeef
.long 0xaaaaaaaa
.long 0xbbbbbbbb

.text
_start:
    LDR R0, =_etext
    LDR R1, =_sidata
    LDR R8, =_sedata
    MOV R3, #0
loop:
    LDR R2, [R0, R3]
    STR R2, [R1, R3]
    ADDS R3, #4
    ADDS R2, R1, R3
    CMP R2, R8
    BEQ end
    b loop
end:
    MOV R4, 0xabababab
forever:
    b forever
.global _start

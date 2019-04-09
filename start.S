.syntax unified
.thumb

.data
.long 0xdeadbeef
.long 0xaaaaaaaa
.long 0xbbbbbbbb

.global main


.global _start

.text
.thumb_func
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
    bl main

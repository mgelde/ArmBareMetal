.syntax unified
.thumb



.text
.long 0x20001000
#plus 1 because of arm weirdness
.long _start + 1
_start:
loop:
    ADD R0, R0, #1
    ADD R1, R1, #2
    b loop
.global _start

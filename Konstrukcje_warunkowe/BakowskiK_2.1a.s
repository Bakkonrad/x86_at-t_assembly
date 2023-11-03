.section .text
.globl _start

_start:
    
    mov $-5, %EDX

__begin:
    cmp $0, %EDX  # porówniane do zera
    jge not_negative # jeśli nieujemna, przeskocz 
    neg %EDX 
    mov %EDX, %EBX
    jmp __end

not_negative:
    mov %EDX, %EBX

__end:
    nop
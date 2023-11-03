.section .text
.globl _start

_start:
    
    mov $3, %ECX
    mov $16, %EDX

__begin:
    sub %EDX, %ECX

    cmp $0, %ECX  # porówniane do zera
    jge not_negative # jeśli nieujemna, przeskocz 
    neg %ECX 
    mov %ECX, %EBX
    jmp __end

not_negative:
    mov %ECX, %EBX

__end:
    nop
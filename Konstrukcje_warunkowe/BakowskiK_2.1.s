.section .text
.globl _start

_start:
    
    mov $5, %ECX
    mov $-5, %EDX

    cmp $0, %EDX  #porówniane do zera
    jge not_negative #jeśli nieujemna, przeskocz 
    neg %EDX 


    not_negative:
        mov %EDX, %EBX


    nop
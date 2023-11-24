.section .text
.globl _start

_start:
    mov $-13, %eax

__begin:
    call absolute_value 

__end:
    nop

absolute_value:
    test %eax, %eax       # Sprawdź, czy wartość jest ujemna (ustawia flagę ZF, jeśli %eax == 0)
    jns positive_value 
    neg %eax   
    ret

positive_value:
    ret   


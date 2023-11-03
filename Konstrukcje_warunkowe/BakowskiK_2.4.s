.section .text
.globl _start

_start:
    
    mov $5, %EBX
__begin:

    cmp $0, %EBX  # porówniane do zera

    je equals_zero
    jg greater_then_zero
    
    mov $-1, %EAX # less then zero
    jmp __end
    
equals_zero:
    mov $0, %EAX
    jmp __end

greater_then_zero:
    mov $1, %EAX

__end:
    nop
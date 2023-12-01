.section .text
.globl _start

_start:
    
    mov $6, %EAX
    mov $7, %EBX
    mov $8, %ECX
    mov $9, %EDX

__begin:
    push %EAX
    push %EBX
    push %ECX
    mov (%ESP), %EAX
    pop %EBX
    push %EDX
    mov 4(%ESP), %EDX
    pop %ECX

__end:
    nop
.section .text
.globl _start

_start:
    
    mov $6, %EAX
    mov $7, %EBX
    mov $8, %ECX
    mov $9, %EDX

__begin:
    push %EAX
    mov %ESP, %EAX
    push %EBX
    call proc
    sub %ESP, %EBX

proc: 
    sub %ESP, %EAX
    mov 4(%ESP), %ECX
    mov 8(%ESP), %EDX
    mov %ESP, %EBX
    ret

__end:
    nop
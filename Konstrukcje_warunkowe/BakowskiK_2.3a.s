.section .text
.globl _start

_start:
    
    mov $3, %EAX
    mov $16, %EBX

__begin:
    cmp %EAX, %EBX

    jge greater_equal
    mov %EBX, %ECX
    jmp __end

greater_equal:
    mov %EAX, %ECX 

__end:
    nop
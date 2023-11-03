.section .text
.globl _start

_start:
    
    mov $30, %EAX
    mov $16, %EBX

__begin:
    cmp %EAX, %EBX

    jge greater_equal
    mov %EAX, %ECX
    jmp __end

greater_equal:
    mov %EBX, %ECX

__end:
    nop
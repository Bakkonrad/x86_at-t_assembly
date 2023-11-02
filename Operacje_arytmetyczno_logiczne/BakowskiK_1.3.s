
.section .text
.globl _start

_start:
    mov $24, %esi
    mov $10, %ebx
    mov $0, %edx

    mov %esi, %eax
    div %ebx
    add %edx, %eax

    nop
    
# Wynik w EAX
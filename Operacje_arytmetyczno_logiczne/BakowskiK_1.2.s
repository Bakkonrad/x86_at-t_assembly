
.section .text
.globl _start

_start:
    mov $6, %esi
    mov $2, %edi
    mov $0, %edx

    mov %esi, %eax
    div %edi
    mov %edx, %eax

    nop
    

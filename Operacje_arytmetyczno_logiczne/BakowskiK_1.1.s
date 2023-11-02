.section .text
.globl _start

_start:
    mov $0, %eax 
    mov $5, %ebx
    mov $3, %ecx 

    mov %ebx, %eax
    mul %ebx
    mov %eax, %ebx

    mov %ecx, %eax
    mul %ecx

    mov %eax, %edx
    add %ebx, %edx

    nop




    # BakowskiK_1_5.s
    # mail : [Asm] zd.1.5
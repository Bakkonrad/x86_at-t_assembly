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


# Napisać program do wyznaczania w rejestrze EDX sumy kwardratów wartości umieszczonych
# w rejestrach EBX i ECX:
# EDX ← EBX^2 + ECX^2
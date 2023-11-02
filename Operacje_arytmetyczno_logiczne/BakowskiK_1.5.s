.section .text
.globl _start

_start:
    mov $7, %eax      
    mov $3, %ebx      
    mov $5, %edx       

    mov %edx, %ecx

    # Kwadrat wartości w %eax
    mul %eax

    # Dodaj EBX
    add %ebx, %eax

    # Podziel przez EDX
    mov $0, %edx
    div %ecx

    mov %eax, %ecx

    nop

# Napisać program realizujący następujące działanie:
# ECX ← (EAX^2+EBX)/EDX 





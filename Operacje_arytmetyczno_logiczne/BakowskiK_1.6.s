
.section .text
.globl _start

_start:
    mov $3, %eax 
    mov $2, %ebx 
    mov $5, %ecx   
    mov $2, %edx   

    # Obliczenia: (EAX * ECX - EDX^2) / -EBX

    mov %edx, %edi

    mul %ecx           # EAX * ECX
    mov %eax, %ecx
    mov %edi, %eax
    mul %edi
    sub %eax, %ecx

    mov %ecx, %eax
    mov $0, %edx  

    neg %ebx
    idiv %ebx

    mov %eax, %ecx

    nop

    # xor %DX, %DX

# Napisać program realizujący następujące działanie:
# ECX ← (EAX*ECX-EDX^2)/-EBX 
.section .text
.global _start

_start:
    mov $12, %esi
    mov $10, %ebx
    xor %dx, %dx

    mov %esi, %eax
    div %ebx

    mov %edx, %ecx
    mul %eax

    xor %dx, %dx
    mov %eax, %edi
    mov %ecx, %eax

    mul %eax
    add %edi, %eax


    nop

# Napisać program do wyznaczania w rejestrze EAX sumy kwadratów cyfr w reprezentacji
# dziesiętnej warto±ci umieszczonej w rejestrze EDI, zakładając, że wartość ta (w reprezentacji
# dziesiętnej) jest co najwy»ej 2-cyfrowa.
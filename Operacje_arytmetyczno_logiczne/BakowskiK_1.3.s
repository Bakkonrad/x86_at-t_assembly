
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
    
#  Napisać program do wyznaczania w rejestrze EAX sumy cyfr w reprezentacji dziesiętnej wartości umieszczonej w rejestrze ESI, zakładając, że wartość ta (w reprezentacji dziesiętnej) jest
# co najwyżej 2-cyfrowa.
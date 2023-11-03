.section .text
.globl _start

_start:
    
    mov $5, %EBX
    mov $5, %ECX
    mov $1, %EAX #inicjalizacja wyniku

__begin:
    cmp $0, %ECX  # sprawdzanie czy wykladnik nie jest zerem
    je move_to_edx

    mul %EBX
    dec %ECX

    jmp __begin

move_to_edx:
    mov %EAX, %EDX
    
__end:
    nop
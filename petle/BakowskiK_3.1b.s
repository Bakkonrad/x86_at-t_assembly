.section .text
.globl _start

_start:
    
    mov $8, %EBX
    mov $1, %ECX

__begin:
    cmp $1, %EBX  # sprawdzanie czy wartosc w EBX to 1
    jle move_to_edx

    mov %ECX, %EAX
    mul %EBX
    mov %EAX, %ECX
    dec %EBX

    jmp __begin

move_to_edx:
    mov %EAX, %EDX

__end:
    nop
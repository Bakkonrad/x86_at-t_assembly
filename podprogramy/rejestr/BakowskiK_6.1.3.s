.section .text
.globl _start

_start:
    mov $15, %eax
    mov $9, %ebx

__begin:
    call max_value 

__end:
    nop

max_value:
    cmp %eax, %ebx        # Porównaj wartości w rejestrach %eax i %ebx
    jge skip_swap         # Jeśli %ebx >= %eax, przejdź do etykiety skip_swap

    xchg %eax, %ebx       # Zamień wartości w %eax i %ebx

skip_swap:
    ret                   # Zakończ funkcję              


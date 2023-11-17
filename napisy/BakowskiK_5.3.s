.section .bss
    buffer: .space 10     # Przykładowy bufor do przechowywania binarnej reprezentacji liczby

.section .data
    n1:
     .asciz "2358"

.section .text
.globl _start

_start:
    mov $0, %eax           # Inicjalizacja wyniku w rejestrze EAX
    mov $10, %edi          # Inicjalizacja dzielnika (10)
    lea n1, %esi 

    
__begin:
    
read_digit:
    movb (%esi), %cl   
    cmpb $0, %cl            # Sprawdź, czy to koniec napisu
    je done_conversion

    subb $'0', %cl          # Konwersja znaku cyfry do wartości liczbowej ('0' ma wartość ASCII 48)
    mul %edi                # Pomnóż aktualny wynik przez 10
    add %ecx, %eax          # Dodaj wartość cyfry do wyniku

    inc %esi
    jmp read_digit

done_conversion:
    # W rezultacie liczba binarna znajduje się w %eax


__end:
    nop
    
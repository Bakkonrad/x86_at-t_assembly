.section .bss
    buffer: .space 10     # Bufor do przechowywania tekstowej reprezentacji liczby
    reversed_buffer: .space 10  # Bufor do odwrócenia napisu

.section .text
.globl _start

_start:
    mov $buffer, %edi           # Wskaźnik do bufora
    mov $10, %ecx               # Długość bufora (10 cyfr)
    mov $10, %esi               # Dzielnik
    mov $0, %ebx                # Przesunięcie w buforze
    mov $2358, %eax             # Wartość do skonwertowania

__begin:

convert_to_text:
    xor %edx, %edx              # Wyzeruj dzielnik (dzielnik = 0)
    div %esi                    # Dzielenie EAX przez 10, wynik w EDX, reszta w EAX

    add $'0', %dl               # Konwersja reszty (cyfry) do wartości ASCII
    dec %ecx
    mov %dl, (%edi, %ebx, 1)   

    inc %ebx 
    test %eax, %eax  
    jnz convert_to_text

    mov $10, %ecx               # Przywróć długość bufora
    movb $0, (%edi, %ebx, 1) 
    dec %ebx
    mov $reversed_buffer, %ecx    # Wskaźnik do odwróconego bufora

reverse_buffer:
    
    mov (%edi, %ebx, 1), %dl    # Odczytaj cyfrę z bufora
    mov %dl, (%ecx)    # Zapisz cyfrę do odwróconego bufora

    dec %ebx
    inc %ecx
    and %ebx, %ebx                # Sprawdź, czy to koniec bufora
    jge reverse_buffer          # Jeśli nie, kontynuuj odwracanie

__end:
    nop

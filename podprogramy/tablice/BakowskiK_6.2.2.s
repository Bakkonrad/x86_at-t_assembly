.section .bss
fibonacci_array: .space 40

.section .text
.globl _start

_start:
__begin:
    lea fibonacci_array, %edi   # Wskaźnik na początek tablicy
    mov $10, %ecx               # Ilość wyrazów do wygenerowania
    call generate_fibonacci

__end:
    nop

generate_fibonacci:
    movl $0, (%edi)           # Pierwszy wyraz ciągu
    movl $1, 4(%edi)          # Drugi wyraz ciągu

    xor %ebx, %ebx           # Inicjalizacja licznika
    mov %ecx, %edx           # Ilość pozostałych wyrazów do wygenerowania

generate_loop:
    cmp $2, %edx             # Sprawdź, ]czy mamy co najmniej 2 pozostałe wyrazy
    jl generate_end

    movl (%edi, %ebx, 4), %eax  # Pobierz poprzedni wyraz
    addl 4(%edi, %ebx, 4), %eax  # Dodaj poprzedni wyraz do przedpoprzedniego
    movl %eax, 8(%edi, %ebx, 4)  # Zapisz wynik jako kolejny wyraz

    inc %ebx                 # Przejdź do następnego indeksu w tablicy
    dec %edx                 # Zmniejsz licznik
    jmp generate_loop        # Powtórz pętlę

generate_end:
    ret

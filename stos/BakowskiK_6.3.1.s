.section .data
array: .int 1, 2, 3, 4, 5  # Przykładowa tablica liczb całkowitych
array_size: .int 5           # Rozmiar tablicy

.section .text
.globl _start

_start:
    mov $array, %edi         # Wskaźnik na początek tablicy
    mov $array_size, %ecx     # Rozmiar tablicy
    call sum_array           # Wywołanie funkcji sum_array

    # Teraz w rejestrze EAX znajduje się suma wartości tablicy

    # Możesz teraz użyć wartości w EAX do dalszych działań lub wyświetlenia, np. przez system call

    # Dodatkowe operacje tutaj...

    jmp __end

sum_array:
    xor %eax, %eax            # Zeruj rejestr sumy
    xor %edx, %edx            # Zeruj rejestr indeksu

sum_loop:
    cmp %edx, (%ecx)            # Porównaj indeks z rozmiarem tablicy
    je sum_end                # Jeśli indeks równy rozmiarowi, zakończ pętlę

    add (%edi, %edx, 4), %eax # Dodaj aktualny element tablicy do sumy
    inc %edx                  # Inkrementuj indeks
    jmp sum_loop              # Powtórz pętlę

sum_end:
    ret                       # Zakończ funkcję

__end:
    nop
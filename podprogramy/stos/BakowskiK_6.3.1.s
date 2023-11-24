.section .data
array: .int 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
end_array:

.equ tab_size, (end_array - array)/4 

.section .text
.globl _start

_start:
    lea array, %edi    # Przekazanie adresu początkowego tablicy do %edi
    mov $tab_size, %ecx # Przekazanie rozmiaru tablicy do %ecx

    push %ecx          # Zapamiętanie rozmiaru tablicy na stosie
    push %edi          # Zapamiętanie adresu początkowego tablicy na stosie
    call calculate_sum # Wywołanie funkcji obliczającej sumę

    # Wynik (suma) teraz znajduje się w rejestrze %eax

    add $8, %esp       # Usunięcie dwóch wartości ze stosu (rozmiar i adres tablicy)

__end:
    nop

calculate_sum:
    xor %eax, %eax     # Zerowanie %eax (suma)

    mov 4(%esp), %ecx           # Pobranie adresu początkowego tablicy ze stosu
    mov 8(%esp), %edx           # Pobranie rozmiaru tablicy ze stosu

__begin:
    cmp $0, %edx
    jle end_loop       # Jeśli rozmiar tablicy jest zero lub ujemny, zakończ pętlę
    add -4(%ecx, %edx, 4), %eax
    dec %edx      # Zmniejszenie rozmiaru tablicy
    jmp __begin

end_loop:
    ret

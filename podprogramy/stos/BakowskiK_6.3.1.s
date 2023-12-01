.section .data
array: .int 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
end_array:

.equ tab_size, (end_array - array)/4 

.section .text
.globl _start

_start:
__begin:
    lea array, %edi
    mov $tab_size, %ecx 

    push %ecx          # Zapamiętanie rozmiaru tablicy na stosie
    push %edi          # Zapamiętanie adresu początkowego tablicy na stosie
    call calculate_sum 

    # Wynik w %eax

    add $8, %esp       # Usunięcie dwóch wartości ze stosu (rozmiar i adres tablicy)

__end:
    nop

calculate_sum:
    xor %eax, %eax     # Zerowanie %eax (suma)

    mov 4(%esp), %ecx           # Pobranie adresu początkowego tablicy ze stosu
    mov 8(%esp), %edx           # Pobranie rozmiaru tablicy ze stosu

_loop:
    cmp $0, %edx
    jle end_loop    
    add -4(%ecx, %edx, 4), %eax
    dec %edx     
    jmp _loop

end_loop:
    ret

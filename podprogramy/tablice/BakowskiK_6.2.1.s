.section .data
array: .int 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
end_array: # następny adres jest końcem tablicy

.equ tab_size, (end_array - array)/4 

.section .text
.globl _start

_start:
    
    mov $0, %EAX # inicjalizacja sumy
    mov $0, %EDX # inicjalizacja licznika pętli
    
__begin:
    
    cmp $tab_size, %EDX
    jge end_loop
    
    mov array(, %EDX, 4), %EBX # pobranie elementu tablicy
    add %EBX, %EAX # dodanie elementu do sumy
    inc %EDX # zwiększenie licznika pętli
    jmp __begin # powrót do początku pętli


end_loop:
    mov $tab_size, %ESI
    xor %EDX, %EDX
    div %ESI # podzielenie sumy przez długość tablicy

__end:
    nop

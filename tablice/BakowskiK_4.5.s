# Napisać program do wyznaczania w rejestrze EAX liczby elementów o wartości większej od 0
# w tablicy liczb całkowitych.

.section .data
array: .int 1, 2, 3, 4, 0, 16, 0, 8, 9, 10
end_array: 

.equ tab_size, (end_array - array)/4 

.section .text
.globl _start

_start:
    mov $0, %EAX # najwieksza wartosc
    mov $0, %EBX # adres nawiekszej wartosci
    mov $0, %EDX # licznik petli

__begin:
    cmp $tab_size, %EDX
    jge __end
    mov array(, %EDX, 4), %ECX 
    cmp %EAX, %ECX
    jle skip_update
    
    mov %ECX, %EAX # zapisywanie najwiekszej wartosci
    inc %EDX
    lea array(, %EDX, 4), %EBX # zapisywanie adresu najwiekszej wartosci
    jmp __begin 

skip_update:
    inc %EDX
    jmp __begin

__end:
    nop
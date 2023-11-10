# Napisać program do wyznaczania w rejestrze EAX liczby elementów o wartości większej od 0
# w tablicy liczb całkowitych.

.section .data
array: .int 1, 2, 3, 4, 0, -6, 0, 8, 9, 10
end_array: 

.equ tab_size, (end_array - array)/4 

.section .text
.globl _start

_start:
    mov $0, %EAX
    mov $0, %EDX
    mov $0, %ESI # licznik elementow wiekszych od zera

__begin:
    cmp $tab_size, %EDX
    jge calculate_result
    mov array(, %EDX, 4), %EBX 
    cmp $0, %EBX
    jle skip_increment
    add %EBX, %EAX
    inc %EDX
    inc %ESI # inkrementacja licznika elementow wiekszych od zera
    jmp __begin 

    
skip_increment:
    inc %EDX
    jmp __begin

calculate_result:
    # oblicz srednia artyetyczna z elementow wiekszych od zera
    mov $0, %EDX
    div %ESI

__end:
    nop
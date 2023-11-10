# Napisać program do wyznaczania w rejestrze EAX liczby elementów o wartości większej od 0
# w tablicy liczb całkowitych.

.section .data
array: .int 1, 2, 3, -2, 0, 6, 0, 8, 9, 10
end_array: 

.equ tab_size, (end_array - array)/4 

.section .text
.globl _start

_start:
    mov $0, %EAX
    mov $0, %EDX

__begin:
    cmp $tab_size, %EDX
    jge __end
    mov array(, %EDX, 4), %EBX 
    cmp $0, %EBX
    jle skip_increment
    inc %EAX
    inc %EDX
    jmp __begin # powrót do początku pętli

    
skip_increment:
    inc %EDX
    jmp __begin


__end:
    nop
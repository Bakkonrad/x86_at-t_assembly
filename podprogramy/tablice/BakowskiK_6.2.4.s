.section .data
input_string:   .asciz "male litery"

.section .text
.globl _start

_start:
__begin:
    lea input_string, %edi  # Wskaźnik na początek napisu
    call convert_to_upper

__end:
    nop

convert_to_upper:
    xor %ecx, %ecx          # Inicjalizacja licznika
    mov $'a', %al          # 'a' w ASCII
    mov $'z', %ah          # 'z' w ASCII

convert_loop:
    cmpb $0, (%edi, %ecx)   # Sprawdź, czy dotarliśmy do końca napisu
    je convert_end

    cmpb %al, (%edi, %ecx)  # Porównaj aktualny znak z 'a'
    jl convert_next_char

    cmpb %ah, (%edi, %ecx)  # Porównaj aktualny znak z 'z'
    jg convert_next_char

    subb $32, (%edi, %ecx)  # Konwersja na wielką literę

convert_next_char:
    inc %ecx
    jmp convert_loop

convert_end:
    ret

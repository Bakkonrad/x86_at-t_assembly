.section .data
    n1:
     .asciz "ALA MA 2 KOTY"

.section .text
.globl _start

_start:
    mov $0, %eax
    mov $0, %ecx
    mov $0, %edx
    lea n1, %ebx 

    
__begin:


convert_to_lowercase:
    movb (%ebx, %edx), %al
    testb %al, %al
    je __end

    cmpb $'A', %al
    jl skip_conversion

    cmpb $'Z', %al
    jg skip_conversion

    addb $32, %al

    movb %al, (%ebx, %edx)

skip_conversion:
    incl %edx                # Przejdź do następnego znaku w napisie
    jmp convert_to_lowercase

__end:
    nop
    
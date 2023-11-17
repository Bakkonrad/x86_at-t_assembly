.section .data
    n1:
     .asciz "Ala ma kota"

.section .text
.globl _start

_start:
    mov $0, %eax
    mov $0, %ecx           # Inicjalizacja licznika małych liter na 0
    lea n1, %ebx 

    
__begin:


count_lowercase:
    
    movb (%ebx), %al
    testb %al, %al    
    je move_to_eax         

    cmpb $'a', %al
    jl skip_lowercase

    cmpb $'z', %al 
    jg skip_lowercase

    inc %ecx    

skip_lowercase:
    inc %ebx            
    jmp count_lowercase

move_to_eax:
    mov %ecx, %eax

__end:
    nop

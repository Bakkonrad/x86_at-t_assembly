.section .data
    n1:
     .asciz "Ala ma 2 koty"

.section .text
.globl _start

_start:
    mov $0, %eax
    mov $0, %ecx           # Inicjalizacja licznika małych liter na 0
    lea n1, %ebx 

    
__begin:


convert_to_uppercase:
    movb (%ebx), %al  
    testb %al, %al     
    je __end       

    cmpb $'a', %al  
    jl skip_conversion 

    cmpb $'z', %al      
    jg skip_conversion 

    subb $32, %al            # Zamień na dużą literę (odejmij 32 od kodu ASCII)

    movb %al, (%ebx)       

skip_conversion:
    inc %ebx               
    jmp convert_to_uppercase

__end:
    nop
    
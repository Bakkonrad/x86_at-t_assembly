.section .text
.globl _start

_start:
    mov $2, %ebx

__begin:
    call sign_value 

    jmp __end

sign_value:
    test %ebx, %ebx 
    jg positive_value     # Jeśli wartość dodatnia
    jl negative_value     # Jeśli wartość ujemna
    je zero_value         # Jeśli wartość równa 0            

positive_value:
    mov $1, %eax 
    ret  

negative_value:
    mov $-1, %eax         
    ret   

zero_value:
    mov $0, %eax
    ret                

__end:
    nop

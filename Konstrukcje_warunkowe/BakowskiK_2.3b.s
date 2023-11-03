.section .text
.globl _start

_start:
    
    mov $30, %EBX
    mov $32, %ECX
    mov $34, %EDX

__begin:
    cmp %ECX, %EBX
    jle check_ebx_edx 
    
    cmp %ECX, %EDX
    jle min_ebx
    mov %ECX, %EAX # ECX najmniejszy
    jmp __end

check_ebx_edx:
    cmp %EDX, %EBX
    jle min_ebx
    
    mov %EDX, %EAX # EBX najwiekszy
    jmp __end

min_ebx:
    mov %EBX, %EAX # EDX najwiekszy


__end:
    nop
.section .text
.globl _start

_start:
    
    mov $30, %EBX
    mov $32, %ECX
    mov $28, %EDX

__begin:
    cmp %ECX, %EBX
    jge check_edx_ebx 
    
    cmp %ECX, %EDX
    jge max_edx
    mov %ECX, %EAX # ECX najwiekszy
    jmp __end

check_edx_ebx:
    cmp %EBX, %EDX
    jge max_edx
    
    mov %EBX, %EAX # EBX najwiekszy
    jmp __end

max_edx:
    mov %EDX, %EAX # EDX najwiekszy


__end:
    nop
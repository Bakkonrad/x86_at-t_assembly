.section .text
.globl _start

_start:
    
    mov $5, %EBX

    cmp $0, %EBX  #porówniane do zera

    je equals_zero
    jg greater_then_zero
    
    mov $-1, %EAX
    jmp done
    
    
equals_zero:
    mov $0, %EAX
    jmp done

greater_then_zero:
    mov $1, %EAX
    jmp done

done:
    nop
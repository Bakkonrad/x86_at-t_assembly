.section .text
.globl _start

_start:
    mov $2, %ebx
    mov $2, %ecx
    mov $7, %edx
__begin:
    call is_triangle

__end:
    nop # koniec programu

is_triangle:
    mov %ebx, %eax        # bok a
    add %ecx, %eax        #bok b
    cmp %edx, %eax        # Porównanie z długością boku C
    jle not_triangle

    mov %ecx, %eax        # bok b
    add %edx, %eax        # bok c
    cmp %ebx, %eax        # Porównanie z długością boku A
    jle not_triangle

    mov %edx, %eax        # bok c
    add %ebx, %eax        # bok a
    cmp %ecx, %eax        # Porównanie z długością boku B
    jle not_triangle

    mov $1, %al
    ret

not_triangle:
    mov $0, %al
    ret

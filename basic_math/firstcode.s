
# as --32 -g prog.s -o prog.o   jesli chcemy 32bitowy kod najpierw zrodlowy a potem docelowy, -g to opcje dla debuggera
# ld -melf_i386 prog.o     -melf mowi ze chcemy na maszyne 32 bit
# gdb a.out

# globl _start moze byc tu lub w sekcji tekst

.text
    .global _start

_start:
    mov $2, %EAX
    mov $5, %EBX
    mov $6, %ECX
    # dane dodawac przed operacjami

    add %EAX, %EBX
    sub %EAX, %ECX

    mov $1, %EAX # exit
    int $0x80
    nop # nooperation - glupia operacja do estowania, debugowania (pulapka dla debugera)




section .bss
        ;variables that may change 

section .data ;constants
    hello: db "Hello World!", 10 ; string to print
    helloLen: equ $-hello ;length of string

section .text
    global _start   ;entry point for linker

_start:
    mov rax,1           ; sys_write
    mov rdi,1           ; stdout
    mov rsi,hello       ; message to write
    mov rdx,helloLen    ;message length
    syscall

    ;end program
    mov rax,60          ; sys_exit
    mov rdi,0           ; erroe code 0 (success)
    syscall             ; call kernal


; how to build the program

; nasm -felf64 helloworld.asm
; ld helloworld.o -o helloworld
; ./helloworld

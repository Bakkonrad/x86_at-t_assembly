
.section .text
.globl _start

_start:
    mov $6, %esi
    mov $2, %edi
    mov $0, %edx

    mov %esi, %eax
    div %edi
    mov %edx, %eax

    nop
    

#  Napisa¢ program do sprawdzania, czy wartość umieszczona w rejestrze ESI jest podzielnikiem wartości umieszczonej w rejestrze EDI. Wyniki - 0, jeśli jest podzielnikiem lub wartość
#  niezerowa w przeciwnym przypadku. Wynik ma być w EAX.

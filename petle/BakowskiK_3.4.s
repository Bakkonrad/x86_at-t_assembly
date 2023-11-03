.section .text
.globl _start

_start:
    mov $48, %eax       # Przykładowa wartość w %eax (może być zmieniona)
    mov $36, %ebx       # Przykładowa wartość w %ebx (może być zmieniona)

__begin:
    # Inicjalizacja rejestru ECX na mniejszą z dwóch liczb
    mov %eax, %ecx
    cmp %ebx, %ecx
    jge start_division
    xchg %eax, %ebx
    xchg %ecx, %eax

start_division:
    cmp $0, %ebx          # Sprawdzenie, czy druga liczba jest zerem
    je done               # Jeśli tak, zakończ (NWD to pierwsza liczba)

division_loop:
    xor %edx, %edx        # Wyzeruj %edx
    idiv %ebx             # Podziel %eax przez %ebx
    mov %ebx, %ecx        # Skopiuj %ebx do %ecx
    mov %edx, %ebx        # Skopiuj resztę z dzielenia do %ebx
    cmp $0, %ebx          # Sprawdzenie, czy reszta jest zerem
    je done               # Jeśli tak, to NWD jest w %ecx

    # W przeciwnym razie kontynuuj dzielenie
    jmp division_loop

done:
    mov %ecx, %eax        # NWD znajduje się w %ecx

__end:
    nop
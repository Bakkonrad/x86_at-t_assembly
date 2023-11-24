.section .text
.globl _start

_start:
    mov $3, %ebx         # Przykładowa wartość dla boku A
    mov $4, %ecx         # Przykładowa wartość dla boku B
    mov $5, %edx         # Przykładowa wartość dla boku C

    call is_triangle    # Wywołanie funkcji sprawdzającej, czy to trójkąt

    # Wynik teraz znajduje się w rejestrze %al

    # Możesz teraz użyć wyniku do dalszych działań lub wyświetlenia, np. przez system call

    # Dodatkowe operacje tutaj...

    # Wyjście z programu
    mov $1, %eax          # Kod wyjścia (1)
    int $0x80

is_triangle:
    mov %ebx, %eax        # Przeniesienie wartości boku A do %eax
    add %ecx, %eax        # Dodanie wartości boku B
    cmp %edx, %eax        # Porównanie z długością boku C
    jle not_triangle      # Jeśli suma długości boków A i B nie jest większa niż długość boku C, to nie jest trójkąt

    mov %ecx, %eax        # Przeniesienie wartości boku B do %eax
    add %edx, %eax        # Dodanie wartości boku C
    cmp %ebx, %eax        # Porównanie z długością boku A
    jle not_triangle      # Jeśli suma długości boków B i C nie jest większa niż długość boku A, to nie jest trójkąt

    mov %edx, %eax        # Przeniesienie wartości boku C do %eax
    add %ebx, %eax        # Dodanie wartości boku A
    cmp %ecx, %eax        # Porównanie z długością boku B
    jle not_triangle      # Jeśli suma długości boków C i A nie jest większa niż długość boku B, to nie jest trójkąt

    mov $1, %al           # Jeśli doszliśmy do tego miejsca, to są to długości boków trójkąta
    ret

not_triangle:
    mov $0, %al           # Jeśli doszliśmy do tego miejsca, to nie są to długości boków trójkąta
    ret

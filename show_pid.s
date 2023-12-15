.section .data
pid_str: .space 10        # Bufor do przechowywania PID jako stringa
newline: .byte 10        # Znak nowej linii

.section .text
.globl _start
_start:
    mov $20, %eax          # Wywołanie systemowe getpid
    int $0x80
    mov %eax, %ebx         # Przenieś PID do rejestru ebx

    # Konwersja PID na string
    lea pid_str+9, %edi    # Pobierz adres końca bufora
    mov $10, %ecx          # Ustaw dzielnik na 10
convert_loop:
    xor %edx, %edx
    div %ecx
    add $0x30, %edx        # Zamień resztę z dzielenia na znak ASCII
    mov %dl, (%edi)        # Przechowaj znak w pid_str
    dec %edi               # Przejdź do kolejnego znaku w pid_str
    test %eax, %eax        # Sprawdź, czy podzielono już wszystkie cyfry
    jnz convert_loop

    # Odwróć string
    lea pid_str, %esi      # Pobierz adres pid_str
reverse_loop:
    cmp %esi, %edi         # Sprawdź, czy jesteśmy na środku stringa
    jge end_reverse
    mov (%esi), %al        # Zamień znaki w %esi i %edi
    mov (%edi), %ah
    mov %ah, (%esi)
    mov %al, (%edi)
    inc %esi               # Przejdź do kolejnego znaku w pid_str
    dec %edi
    jmp reverse_loop       # Powtórz pętlę

end_reverse:
     # Wyświetl PID
    mov $4, %eax           # Numer systemowego wywołania dla write
    mov $1, %ebx           # Deskryptor pliku dla stdout
    lea pid_str, %ecx      # Pobierz adres pid_str
    inc %edi               # Wskaż pierwszy znak PID w buforze
    sub %edi, %ecx         # Oblicz długość ciągu znaków PID
    neg %ecx               # Przekształć długość na liczbę dodatnią
    mov %ecx, %edx         # Ustaw długość ciągu znaków PID
    mov %edi, %ecx         # Ustaw bufor na początek ciągu znaków PID
    int $0x80

    # Wyświetl nową linię
    mov $4, %eax           # Numer systemowego wywołania dla write
    mov $1, %ebx           # Deskryptor pliku dla stdout
    lea newline, %ecx      # Adres znaku nowej linii
    mov $1, %edx           # Długość znaku nowej linii
    int $0x80
    

    # Zakończ
    mov $1, %eax
    mov $0, %ebx
    int $0x80             

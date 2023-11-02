.text
    .global _secondway

# 8 + 4 - 2 + 3 = 13 (0xD in hex)
_start:
    mov $8, %EAX
    mov $4, %EBX
    mov $2, %ECX
    mov $3, %EDX
    # dane dodawac przed operacjami

    add %EAX, %EBX 
    sub %ECX, %EBX
    add %EBX, %EDX

    mov $1, %EAX # exit
    int $0x80
    nop

_secondway: #more optimal way
    mov $8, %EAX
    add $4, %EAX
    sub $2, %EAX
    add $3, %EAX

# 0x2b
# B x 1 = 11
# 2 x 16(bit) = 32
# 11 + 32 = 43


# 0x5BCA
# A x 1 = 10
# C(13) x 16 = 192
# B(11) x 16 x 16 = 2816
# 5 x 16 x 16 x 16 = 20480

# 10 + 192 + 2816 + 20480 = 23498
.global _start
.data
    # ------
    # arrays
    # ------

.text
_start:
    mov $3, %ECX
#------------------------
    neg %ECX
    mov %ECX, %EBX
    nop

#+-----+-------+---------+
#| reg | input |  output |
#+-----+-------+---------+
#| EAX |   0   |    0    |
#| EBX |   0   |   -3    |
#| ECX |   3   |   -3    |
#| EDX |   0   |    0    |
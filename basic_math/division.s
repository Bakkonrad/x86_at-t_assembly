.global _start
.data
	# ------
	# arrays
	# ------

.text
_start:
    mov $12, %EBX
    mov $3, %EDX
#--------------------------
    mov %EBX, %EAX
    mov %EDX, %EBX
    mov $0, %EDX
    div %EBX
    mov %EAX, %ECX
    nop

#+-----+-------+---------+
#| reg | input |  output |
#+-----+-------+---------+
#| EAX |   0   |    4    |
#| EBX |  12   |    3    |
#| ECX |   0   |    4    |
#| EDX |   3   |    0    |
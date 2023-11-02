.global _start
.data
	# ------
	# arrays
	# ------

.text
_start:
    mov $3, %EBX
    mov $4, %EDX
#-----------------------
    mov %EDX, %EAX
    mul %EBX
    mov %EAX, %ECX
    nop

#+-----+-------+---------+
#| reg | input |  output |
#+-----+-------+---------+
#| EAX |   0   |   12    |
#| EBX |   3   |    3    |
#| ECX |   0   |   12    |
#| EDX |   4   |    0    |
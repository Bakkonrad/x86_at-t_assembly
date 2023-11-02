.global _start
.data
	# ------
	# arrays
	# ------

.text
_start:
    mov $3, %ECX
#-------------------------
    mov %ECX, %EAX
    mul %ECX
    mov %EAX, %EBX
    nop

#+-----+-------+---------+
#| reg | input |  output |
#+-----+-------+---------+
#| EAX |   0   |    9    |
#| EBX |   0   |    9    |
#| ECX |   3   |    3    |
#| EDX |   0   |    0    |
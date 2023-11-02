.global _start
.data
	# ------
	# arrays
	# ------

.text
_start:
    mov $2, %EBX
    mov $1, %EDX
    mov $10, %ECX
#---------------------------
    add %EDX, %EBX
    sub %EBX, %ECX
    mov %ECX, %EAX
    nop

#+-----+-------+---------+
#| reg | input |  output |
#+-----+-------+---------+
#| EAX |   0   |    7    |
#| EBX |   2   |    3    |
#| ECX |  10   |    7    |
#| EDX |   1   |    1    |
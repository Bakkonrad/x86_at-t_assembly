.section .data
array: .ascii "Hello World!\n"
end:

.section .text
.globl _start

_start:
__begin:
mov $4, %eax
mov $1, %ebx
mov $array, %ecx
mov $end - array, %edx
int $0x80

mov $1, %eax
mov $0, %ebx
int $0x80


.section .data
array: .int 1, 2, 3, 0, 5, 6, 7, 8, 0, 0
end_array:

.equ tab_size, (end_array - array)/4 

.section .text
.globl _start

_start:
__begin:
    lea array, %edi
    mov $tab_size, %ecx 

    push %ecx          # Save the size of the array on the stack
    push %edi          # Save the start address of the array on the stack
    call calculate_sum 

    # The result is in %eax

    add $8, %esp       # Remove two values from the stack (size and address of the array)

__end:
    nop

calculate_sum:
    xor %eax, %eax     # Zero %eax (sum)
    xor %ebx, %ebx     # Zero %ebx (counter)

    mov 4(%esp), %ecx           # Get the start address of the array from the stack
    mov 8(%esp), %edx           # Get the size of the array from the stack

_loop:
    cmp $0, %edx
    jle end_loop
    mov (%ecx, %ebx, 4), %edi   # Move the current element to %edi
    cmp $0, %edi                # Compare the current element with 0
    je end_loop                 # If the current element is 0, end the loop
    add %edi, %eax              # Add the current element to the sum
    inc %ebx                    # Increment the counter
    dec %edx                    # Decrement the size
    jmp _loop

end_loop:
    ret

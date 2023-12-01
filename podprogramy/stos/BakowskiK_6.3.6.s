.section .data
array: .int 1, 2, 3, 6, 5, 0, 5, 2, 0, 10
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
    call find_zero 

    # The result is in %eax

    add $8, %esp       # Remove two values from the stack (size and address of the array)

__end:
    nop

find_zero:
    xor %eax, %eax     # Zero %eax (counter)

    mov 4(%esp), %ecx           # Get the start address of the array from the stack
    mov 8(%esp), %edx           # Get the size of the array from the stack

_loop:
    cmp $0, %edx
    jle end_loop
    mov (%ecx, %eax, 4), %edi   # Move the current element to %edi
    cmp $0, %edi                # Compare the current element with 0
    je end_loop                 # If the current element is 0, end the loop
    inc %eax                    # Increment the counter
    dec %edx     
    jmp _loop

end_loop:
    inc %eax                    # Increment the counter (the result is in %eax) 
    ret

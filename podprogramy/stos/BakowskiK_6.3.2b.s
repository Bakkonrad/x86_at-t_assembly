.section .data
array: .int 1, 2, 3, 4, 5, 6, 7, 8, 9, 8
end_array:

.equ tab_size, (end_array - array)/4 

.section .text
.globl _start

_start:
__begin:
    lea array, %edi
    mov $tab_size, %ecx 

    push %ecx 
    push %edi
    call calculate_mean 

    # The result is in %eax

    add $8, %esp       # Remove two values from the stack (size and address of the array)

__end:
    nop

calculate_mean:
    xor %eax, %eax     # Zero %eax (sum)
    xor %ebx, %ebx     # Zero %ebx (counter)

    mov 4(%esp), %ecx           # Get the start address of the array from the stack
    mov 8(%esp), %edx           # Get the size of the array from the stack

_loop:
    cmp $0, %edx
    jle end_loop
    add (%ecx, %ebx, 4), %eax   # Add the current element to the sum
    inc %ebx                    # Increment the counter
    dec %edx                    # Decrement the size
    jmp _loop

end_loop:
    cdq                         # Sign extend eax into edx:eax
    idiv %ebx                   # Divide the sum by the number of elements

    cmp $5, %edx                # Compare the remainder with 5
    jge increment_eax            # If the remainder is less than 5, jump to increment_eax
    jmp _ret                     # If the remainder is 5 or greater, jump to end

increment_eax:
    inc %eax   

_ret:
    ret

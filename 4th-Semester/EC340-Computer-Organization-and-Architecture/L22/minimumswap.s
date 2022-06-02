
        .data
#  storing required data into memory
array:  .word 67 43 3 7 2 35 9 62 4 8

        .text
        .globl main
main:   

        li      $t1, 0              # i (index) = 0
        la      $s0, array          # fetch base address
        # initializing minimum =  storing a[0] value in minimum
        lw      $t0, 0($s0)         
        li      $t7, 0              # index of minimum
        # j (index) = 0 for printing updated array
        li      $t9, 0              

loop:   slti    $t3, $t1, 10         # if i == 10 goto done
        beq     $t3, $zero, swapmin
        sll     $t6, $t1, 2         # offset = index * 4
        add     $t5, $s0, $t6       # address = base_address + offset;
        lw      $t4, 0($t5)         # t4= arr[i]
        slt     $t2, $t4, $t0       # setting less than in t2
        # switching to min branch if a[i]<current_min
        bne     $t2, $zero, min     
# label b_loop for returning after min has been updated
b_loop: addi    $t1, $t1, 1         # i++
        j       loop
# min updates the minimum value and the index containing it
min:    add     $t0, $zero, $t4     # updating minimum value
        # updating index of minimum so that we can swap values letter
        add     $t7, $zero, $t1     
        j      b_loop

# for printing the updated array
printl: slti    $t3, $t9, 10         # if i == 10 goto done
        beq     $t3, $zero, done     # jumping to done if all elements are printed
        sll     $t6, $t9, 2         # offset = index * 4
        add     $t2, $s0, $t6       # address = base_address + offset;
        lw      $t4, 0($t2)        # t4 = arr[i] 

        li      $v0, 1              # for printing 
        move    $a0, $t4            # print arr[i]
        syscall

        li      $v0, 11             # print space character
        li      $a0, 32
        syscall

        addi    $t9, $t9, 1         # i++
        # jump back to printl to print all values of 2nd array
        j       printl              

# for swapping the minimum and last array
swapmin:   
        lw      $t4,  36($s0)     # saving the last value of the array
        sll     $t6, $t7, 2        # offset = min_index *4
        sw      $t0, 36($s0)        # storing min value in last position
        add     $t5, $s0, $t6       # min_address = base + offset
        # storing the value of last element in the position of minimum value
        sw      $t4, 0($t5)         
        j       printl          # to print the updated array


done:
        jr $ra                      # return from main
        
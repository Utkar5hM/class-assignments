        .data
#  storing required data into memory
firstarray:  .word 65 12 56 145 41 311 425 601 48 895264
secondarray:  .word 4 0 0 0 3 0 0 0 0 5

        .text
        .globl main
main:
        li      $t1, 0              # i (index) = 0
        li      $t7, 0              # j (index) = 0 for print
        la      $s0, firstarray     # fetch base address
        # initializing minimum =  storing a[0] value in minimum
        la      $t0, secondarray    

# label for looping throughtout the array and copying to second array
loop:   slti    $t3, $t1, 10         # if i == 10 goto done
        # after completition, jump to printl to print 2nd array
        beq     $t3, $zero, printl   
        sll     $t6, $t1, 2         # offset = index * 4
        add     $t5, $s0, $t6       # address_1 = base_address + offset;
        lw      $t4, 0($t5)         # t4= memory[address_1]  /// t4 = arr_1[i]
        add     $t2, $t0, $t6       # address_2 = base_address + offset;
        sw      $t4, 0($t2)        # memory[address_2] = t4 /// arr_2[i]= t4
        addi    $t1, $t1, 1         # i++
        j       loop
# for printing the second array
printl: slti    $t3, $t7, 10         # if i == 10 goto done
        beq     $t3, $zero, done
        sll     $t6, $t7, 2         # offset = index * 4
        add     $t2, $t0, $t6       # address_2 = base_address + offset;
        lw      $t4, 0($t2)        # t4 = arr_2[i] 

        li      $v0, 1              # for printing 
        move    $a0, $t4            # print arr_2[i]
        syscall

        li      $v0, 11             # print space character
        li      $a0, 32
        syscall

        addi    $t7, $t7, 1         # i++
        # jump back to printl to print all values of 2nd array
        j       printl              
done:   
        jr      $ra               # return from main
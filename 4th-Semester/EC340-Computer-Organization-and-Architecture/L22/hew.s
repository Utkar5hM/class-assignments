        .data

rgb:  .word 0xbf49ac 0x68dba6 0x41a8a1 0x06c012 0x1428e5 0x1ec2b2 0x5e7386 0xae770f 0x286dd0 0x8b10b6
gray:  .word 4 0 0 0 3 0 0 0 0 5

trgb:   .asciiz "RGB: "

tgray:  .asciiz " GRAY: "
        .text
        .globl main
main:
        li      $t1, 0              # i (index) = 0
        la      $s0, rgb     # fetch base address
        la      $s1, gray    # initializing minimum =  storing a[0] value in minimum
        li      $t8, 3
        li      $t9, 0
loop:   slti    $t3, $t1, 10         # if i == 10 goto done
        beq     $t3, $zero, rgb2gray
        sll     $t2, $t1, 2         # offset = index * 4
        add     $t4, $s0, $t2       # address_1 = base_address + offset;
        lw      $t5, 0($t4)         # t4= memory[address_1]  /// t4 = arr_1[i]
        andi    $t6, $t5, 0xFF
        srl     $t5, $t5, 8
        andi    $t7, $t5, 0xFF
        add     $t6, $t7, $t6
        srl     $t5, $t5, 8
        andi    $t7, $t5, 0xFF
        add     $t6, $t7, $t6
        divu    $t6, $t6, $t8
        add     $t4, $s1, $t2
        sw      $t6, 0($t4) 
        addi    $t1, $t1, 1         # i++
        j       loop
rgb2gray: slti    $t3, $t9, 10         # if i == 10 goto done
        beq     $t3, $zero, done
        sll     $t6, $t9, 2         # offset = index * 4

        add     $t2, $s0, $t6       # address_2 = base_address + offset;
        lw      $t4, 0($t2)        # t4 = arr_2[i] 

        li      $v0, 4
        la      $a0, trgb
        syscall

        li      $v0, 1              # for printing 
        move    $a0, $t4            # print rgb[i]
        syscall

        li      $v0, 4
        la      $a0, tgray
        syscall
        
        add     $t2, $s1, $t6       # address_2 = base_address + offset;
        lw      $t4, 0($t2)        # t4 = arr_2[i] 

        li      $v0, 1              # for printing 
        move    $a0, $t4            # print gray[i]
        syscall

        li      $v0, 11             # print newline character
        li      $a0, 0x0a
        syscall


        addi    $t9, $t9, 1         # i++
        j       printl              # jump back to printl to print all values of 2nd array
done:   
        jr      $ra               # return from main
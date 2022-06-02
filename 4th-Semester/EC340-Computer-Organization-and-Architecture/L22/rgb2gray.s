
        .data
#  storing required data into memory
rgb:  .word 0xbf49ac 0x68dba6 0xFF0A5D 0x06c012 0x1428e5 0x1ec2b2 0x5e7386 0xae770f 0x286dd0 0x8b10b6
gray:  .word 4 0 0 0 3 0 0 0 0 5
#  storing strings required to print at the end
trgb:   .asciiz "RGB: "

tgray:  .asciiz " GRAY: "
        .text
        .globl main
main:
        li      $a2, 0              # i (index) = 0
        la      $s0, rgb     # fetch base address
        # initializing minimum =  storing a[0] value in minimum
        la      $s1, gray    
        li      $s3, 3       # to store 3 to divide later
        li      $a3, 0       # j index =0 for printing
        addi    $sp, $sp, -4 # allocating space on stack
        sw      $ra, 0($sp)  # storing main's return address
        jal     rgb2gray     # jumping (with link) to rgb2gray function
        lw      $ra, 0($sp)  # loading back main's return address
        addi    $sp, $sp, 4  # deallocating space on stack
        jr      $ra          # returning from main. END OF PROGRAM

# procedure(Function) rgb2gray
rgb2gray:   slti    $t3, $a2, 10         # if i == 10 goto done
        beq     $t3, $zero, printl
        sll     $t2, $a2, 2         # offset = index (i) * 4
        # address_1 = base_address + offset;
        add     $t4, $s0, $t2       
        # t5= memory[address_1]  /// t5 = rgb[i]
        lw      $t5, 0($t4)         
        # t6 = rgb[i][7:0] = blue value  // last 7 bits by using AND 
        andi    $t6, $t5, 0xFF      
        # right shift t5 by a byte so GREEN comes at lowest significant byte.
        srl     $t5, $t5, 8         
        # t7 = rgb[i][7:0] = green value  // last 7 bits by using AND 
        andi    $t7, $t5, 0xFF      
        # t6 = t7 + t6 // t6 = blue + green
        add     $t6, $t7, $t6       
        # right shift t5 by a byte so RED comes at lowest significant byte.
        srl     $t5, $t5, 8         
        # t7 = t5[i][7:0] = green value  // last 7 bits by using AND 
        andi    $t7, $t5, 0xFF       
        # t6 = t7 + t6 // t6 = blue + green + red
        add     $t6, $t7, $t6       
        # t6 = t6 / t8 = (blue + green + red) /3
        divu    $t6, $t6, $s3       
        # address_2 = base_address + offset;
        add     $t4, $s1, $t2       
        #  memory[address_1]= t6  /// gray[i] = t6 = (r+g+b)/3 
        sw      $t6, 0($t4)         
        addi    $a2, $a2, 1         # i++
        j       rgb2gray

# for printing RGB values and its respective Gray values
printl: slti    $t3, $a3, 10         # if i == 10 goto done
        beq     $t3, $zero, done
        sll     $t6, $a3, 2         # offset = index * 4
        # rgb_address = base_rgb_address + offset;
        add     $t2, $s0, $t6       
        lw      $t4, 0($t2)        # t4 = rgb[i] 
        li      $v0, 4
        la      $a0, trgb            # printing string "RGB: "
        syscall
        li      $v0, 1              # for printing 
        move    $a0, $t4            # print rgb[i]
        syscall
        li      $v0, 4
        la      $a0, tgray           # printing string " GRAY: "
        syscall
        # gray_address = base_gray_address + offset;
        add     $t2, $s1, $t6       
        lw      $t4, 0($t2)        # t4 = gray[i] 
        li      $v0, 1              # for printing 
        move    $a0, $t4            # print gray[i]
        syscall
        li      $v0, 11             # print newline character
        li      $a0, 0x0a
        syscall
        addi    $a3, $a3, 1         # i++
        # jump back to printl to print all values of 2nd array  
        j       printl               
done:   
        jr      $ra   # return from rgb2gray to main

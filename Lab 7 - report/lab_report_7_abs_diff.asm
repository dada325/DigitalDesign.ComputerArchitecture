abs_diff_color:

    addi $sp, $sp, -0x10     #make space on stack to store two registers

    sw $s3, 0xC($sp)           #save $s3 on stack
    sw $s2, 8($sp)            #save $s2 on stack
    sw $s1, 4($sp)               #save $s1 on stack
    sw $s0, 0($sp)            #save $s0 on stack


    sub $t1, $a0, $a1        # a0, a1 as arguments
    sra $t2,$t1,31
    xor $t1,$t1,$t2
    sub $s1,$t1,$t2            # s1 as the first color diff

    sub $t3, $a2, $a3        # a2, a3 as arguments
    sra $t4,$t3,31
    xor $t3,$t3,$t4
    sub $s2,$t3,$t4            # s2 as the second color diff

    sub $t5, $t7, $t0        # t7, t0 as arguments , need to addi arrguments to t7, t0
    sra $t6,$t5,31
    xor $t5,$t5,$t6
    sub $s3,$t5,$t6            # s3 as the third color diff


    add $s0, $s1, $s2
    add $v0, $s0, $s3        # v0 to sum up all of the diffs, s1,s2,s3



    lw $s0, 0($sp)        #load back all stacks back to reg 
    lw $s1, 4($sp)
    lw $s2, 8($sp)
    lw $s3, 0xC($sp)
    addi $sp, $sp, 0x10     #make space on stack to store two registers


    jr $ra

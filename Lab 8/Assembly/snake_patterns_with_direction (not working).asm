### Aanjhan Ranganathan <raanjhan@inf.ethz.ch>
### For Lab 8 Digital Technik 
### 2014

###   I/O addresses Reference
###  compatible to the compact modelling
###  0x00007FF0   LED output

.data
pattern: .word 0x00200000,0x00004000,0x00000080,0x00000001,0x00000002,0x00000004,0x00000008,0x00000400,0x00020000,0x01000000,0x02000000,0x04000000
loopcnt: .word 0x001e8484

.text

direction:      
   lw $t7 0x00007FF8 ($0) # loading the value of the direction switch 
   
   beq $t7,1,backward 
     
   
   lw $t3, loopcnt    # initialize a  large loopcounter (so that the snake does not crawl SUPERFAST)
   addi $t5,$0,48       # initialize the length of the display pattern (in bytes)

restart:   
   addi $t4,$0,0
   
   lw $t1 0x00007FF4 ($0) # loading the values of the speed switches
   
forward:
   beq $t5,$t4, direction
   lw $t0,0($t4)
   sw  $t0, 0x7ff0($0) # send the value to the display
   
   addi $t4, $t4, 4 # increment to the next address
   addi $t2, $0, 0 # clear $t2 counter

wait0:
   
   slt $t6,$t2,$t3
   beq $t6,0, forward	
   addi  $t2, $t2, 1     # increment counter
      

   j wait0  
   
backward:

   lw $t3, loopcnt    # initialize a  large loopcounter (so that the snake does not crawl SUPERFAST)
   addi $t5,$0,0       # initialize the length of the display pattern (in bytes)

restart_2:   
   addi $t4,$0,48
   
   lw $t1 0x00007FF4 ($0) # loading the values of the speed switches
   
forward_2:
   beq $t5,$t4, direction
   lw $t0,0($t4)
   sw  $t0, 0x7ff0($0) # send the value to the display
  
   addi $t4, $t4, -4 # increment to the next address
   addi $t2, $0, 0 # clear $t2 counter

wait0_2:
   
   slt $t6,$t2,$t3
   beq $t6,0, forward_2	
   addi  $t2, $t2, 1     # increment counter
      
   j wait0_2
 
   

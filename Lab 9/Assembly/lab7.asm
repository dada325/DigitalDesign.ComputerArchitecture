#
# Calculate sum from A to B.
#
# Authors: 
#	X Y, Z Q 
#
# Group: ...
#

.text
main:
	#A gets stored in t0 (starts at 0), B gets stored in t1.
	
	addi $t0, $0, 0  #A
	
	addi $t1, $0, 200  #B
	
	addi $t1, $t1, 1
	
	#Loop to store sum in t2.
	slt $t3, $t0, $t1
	beq $t3, $0, zerosum
	
	
	loop: 
	beq $t0, $t1, done
	add $t2, $t2, $t0
	addi $t0, $t0, 1
	
	j loop
	
	
	zerosum: 
	addi $t2, $0, 0
	
	done:
	

	# Put your sum S into register $t2
end:	
	j	end	# Infinite loop at the end of the program. 

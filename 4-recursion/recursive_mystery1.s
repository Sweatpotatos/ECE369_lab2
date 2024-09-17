# Exercise 3
# Max Score: 12 points
# Students: Yaolei Bian, Allen Leinberger, Mohammed Alrkhayes
.data	
list1:		.word		3, 9, 1, 2, 6, 3, -4, -7, -8, 4, -2,  8, 7, 6
.text 		# list1 is an array of integers storing the given sequence of values	 
.globl	tomato
tomato: 
addi	$sp, $sp, -8       
addi	$t0, $a0, -1       
sw  	$t0, 0($sp)        
sw  	$ra, 4($sp)        
bne 	$a0, $zero, orange   
li  	$v0, 0             
addi	$sp, $sp, 8        
jr 	$ra                  
orange:   
move  $a0, $t0            
jal   	tomato 
lw    	$t0, 0($sp)  
sll	$t1, $t0, 2  
add   	$t1, $t1, $a1     
lw    	$t2, 0($t1)       
add   	$v0, $v0, $t2     
lw    	$ra, 4($sp)                
addi 	$sp, $sp, 8        
jr 	$ra                  
# main function starts here                                            						
.globl main
main:	
    addi	$sp, $sp, -4	# Make space on stack
	sw	$ra, 0($sp)	# Save return address
	la	$a1, list1	# a1 has the base address pointing to the first 
# element of the “list1” array declared in .data section above
	li	$a0, 9		# loads the immediate value into the destination register
	jal	tomato	
return:	
li	$v0, 0			# Return value
	lw	$ra, 0($sp)		# Restore return address
	addi	$sp, $sp, 4		# Restore stack pointer
	jr 	$ra			# Return
# Step through this code in your simulator and monitor the register values. 
# What does the tomato function do?   
# Write your answer HERE_ _ _ _ _ _ _ _ _  #The tomato function recursively sums the first 9 elements of the array list1 (from list1[8] to list1[0]). It starts with an index of 9 (which accesses list1[8] due to 0 based indexing) and continues recursively until the base case ($a0 == 0) is reached, summing all the elements along the way. The final sum is stored in $v0 and returned to the caller.
         

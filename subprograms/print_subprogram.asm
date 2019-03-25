# This program shows off the basics of sub-programs in MIPS
# By: Nick from CoffeeBeforeArch

.text
main:
	# Read an integer A from the user
	li $v0,4
	la $a0,prompt1
	syscall
	
	li $v0,5
	syscall
	move $s0,$v0
	
	# Read an integer B from the user
	li $v0,4
	la $a0,prompt2
	syscall
	
	li $v0,5
	syscall
	move $s1,$v0
	
	# Perform some arithmetic
	addi $s0,$s0,5
	mul $s0,$s0,$s1
	
	# Print out the result using a subprogram
	la $a0,result
	move $a1,$s0
	jal print_result
	
	# Terminate the program
	li $v0,10
	syscall
	 
# Sub-program print_result
# Takes
#	$a0: Address of string to print
#	$a1: Result of computation
# Effects
#	Prints a string and integer to the console
print_result:
	# Note: The strings address is already in $a0
	li $v0,4
	syscall
	
	# Move integer argument to $a0 to print to console
	move $a0,$a1
	li $v0,1
	syscall
	
	# Return to the place the program was called from
	jr $ra

.data
prompt1: .asciiz "Enter an integer A: "
prompt2: .asciiz "Enter an integer B: "
result: .asciiz "The result is: "

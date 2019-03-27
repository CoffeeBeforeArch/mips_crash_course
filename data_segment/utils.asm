# This file contains some common utility functions
# By: Nick from CoffeeBeforeArch

# Sub-program print_int
# Prints a string and int to the console
# Arguments
#	$a0: Address of string
#	$a1: Integer to print
.text
print_int:
	# Print string
	li $v0,4
	syscall
	
	# Print integer
	move $a0,$a1
	li $v0,1
	syscall
	
	# Return to caller
	jr $ra
	
# Sub-program prompt_int
# Prints a string reads an int to the console
# Arguments
#	$a0: Address of string
# Returns
#	$v0: Integer read in
.text
prompt_int:
	# Print string
	li $v0,4
	syscall
	
	# Read integer
	li $v0,5
	syscall
	
	# Return
	jr $ra

# Sub-program terminate
# Prints a string reads an int to the console
.text
terminate:
	li $v0,10
	syscall
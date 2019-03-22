# This program prompts the user for an integer and prints it out
# By: Nick from CoffeeBeforeArch

.text
main:
	# Prompt the user for an input
	li $v0,4
	la $a0,prompt
	syscall
	
	# Read an integer from the user
	li $v0,5
	syscall
	# $v0 is overwritten with the input
	move $s0,$v0
	
	# Print output
	li $v0,4
	la $a0,output
	syscall
	
	# Print number
	li $v0,1
	move $a0, $s0
	syscall
	
	# Terminate the program
	li $v0,10
	syscall
	
.data
prompt: .asciiz "Please enter an integer: "
output: .asciiz "You typed the number "

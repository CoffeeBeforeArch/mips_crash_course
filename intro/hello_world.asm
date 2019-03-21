# This program prints prints "Hello, World!" to the console
# By: Nick from CoffeeBeforeArch

# Directive that means instructions that follow are
# part of the program
.text
# Label (not necessary)
main:
	# Load immediate into register $v0
	# $v0 is used for print syscall
	# Service depends on value (4 = print string)
	# $vX typically used for return values
	li $v0,4
	
	# Load from the address of label "greeting" into $a0
	# $aX typically used for arguments
	la $a0,greeting
	
	# We've set up a print string syscall in the past
	# two steps, so now actually execute it
	syscall
	
	# Nothing left to do, so load $v0 with 10
	# Sycall sevice for code 10 = program termination
	li $v0,10
	
	# Terminate the program
	syscall

# Directive that means what follows is stored in the static
# data region of memory
.data
# Create a label for convenience
# .asciiz directive tells the assembler to treat what follows
# as a string, and give it a null terminator
greeting: .asciiz "Hello, World!"

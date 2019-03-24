# This program shows off basic arithmetic in MIPS using SAXPY
# By: Nick from CoffeeBeforeArch

.text
main:
	# Ask the user for value (Y)
	addi $v0,$zero,4
	la $a0,prompt1
	syscall

	# Setup read of floating point value into $f0
	# Floating point operations use even # registers	
	addi $v0,$zero,6
	syscall
	mov.s $f2,$f0

	# Ask the user for value (X)
	addi $v0,$zero,4
	la $a0,prompt2
	syscall
	
	# Read value and move to next even regiser
	addi $v0,$zero,6
	syscall
	mov.s $f1,$f0

	# Ask the user for scaling factor (A)
	addi $v0,$zero,4
	la $a0,prompt3
	syscall

	# Read last value and move to next even regiser
	addi $v0,$zero,6
	syscall
	
	# Do scaled X part of SAXPY
	mul.s $f0,$f0,$f1
	# Do plus Y part of SAXPY
	add.s $f0,$f0,$f2
	
	# Print the result
	addi $v0,$zero,4
	la $a0,prompt4
	syscall

	# Set up printing of float result
	addi $v0,$zero,2
	mov.s $f12,$f0
	syscall
	
	# Terminate the program
	addi $v0,$zero,10
	syscall
	
.data
prompt1: .asciiz "Enter a Y value: "
prompt2: .asciiz "Enter an X value: "
prompt3: .asciiz "Enter an A value: "
prompt4: .asciiz "SAXPY result = "
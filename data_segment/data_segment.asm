# This program shows off different methods of accessing
# memory to implement the pseudo-code below
#	// Calculate a quadratic function at a point
#	main(){
#		static volatile int a = #
#		static volatile int b = #
#		static volatile int c = #
#		int x = input("Enter an value for 'x' ")
#		int y = a*x*x + b*x + c
#		print("The result is " + y)
#	}
#
# By: Nick from CoffeeBeforeArch

.text
main:
	# Read in an integer from the user
	la,$a0,prompt1
	jal,prompt_int

	# Store value of "x" in memory until we need it
	sw $v0,x

	# Direct register access
	# Violates the "volatile" keyword (no memory access)
	li $t0, 5
	li $t1, 3
	li $t2, 1
	
	# Load word directly if we have the address using labels
	lw $t0,mem_a
	lw $t1,mem_b
	lw $t2,mem_c
	
	# Indirectly access memory through registers
	# Registers store addresses, not values, so maintains "volatile"
	# property
	# Data segment begins at 0x10010000
	lui $t3,0x1001
	# Load value stored at 0x10010000
	lw $t0,0($t3)
	# Each constant takes up 4 bytes (so inc. by 4)
	addi $t3,$t3,4
	# Load value stored at 0x10010004
	lw $t1,0($t3)
	addi $t3,$t3,4
	# Load value stored at 0x10010008
	lw $t2,0($t3)
	
	# Access memory through register offset
	# Register holds a base address, and incremented by immediate value
	# First get new "constants" address just after mem_c
	addi $t3,$t3,4
	# Load in the base address from the "constants" label
	lw $t4,0($t3)
	# Load in the constants
	lw $t0,0($t4)
	lw $t1,4($t4)
	lw $t2,8($t4)

	# Computer a value for "y"
	# Load x into register $s0
	lw $s0,x
	# x^2
	mul $t5,$s0,$s0
	# ax^2
	mul $t5,$t5,$t0
	# bx
	mul $t6,$s0,$t1
	# ax^2 + bx
	add $t5,$t5,$t6
	#ax^2 +bx + c
	add $s1,$t5,$t2
	
	# Print the result
	la $a0,prompt2
	move $a1,$s1
	jal print_int 
	
	# Terminate the program
	jal terminate
	
.data
# Store some constants in memory using labels
mem_a: .word 5
mem_b: .word 3
mem_c: .word 1
	
# Stores address of "constants" label
.word constants

# Some space to store the result for "x"
x: .word 0

# Other constants for the program accessed via a label and offset
constants:
	alt_a: .word 2
	alt_b: .word 4
	alt_c: .word 6
	
prompt1: .asciiz "Enter a value for x: "
prompt2: .asciiz "Computed value is: "

# Include some utility sub-programs
.include "utils.asm"

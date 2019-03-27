# This program shows off different methods of accessing
# memory to implement the pseudo-code below
#	// Calculate a quadratic function at a point
#	main(){
#		static volatile int a = 5
#		static volatile int b = 3
#		static volatile int c = 1
#		int x = input("Enter an value for 'x' ")
#		int y = a*x*x + b*x + c
#		print("The result is " + y)
#	}
#
# By: Nick from CoffeeBeforeArch

.text
main:
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
	lui $t4,0x1001
	lw $t0,0($t4)
	lw $t1,4($t4)
	lw $t2,8($t4)
	
	# Terminate the program
	li $v0,10
	syscall
.data
	mem_a: .word 5
	mem_b: .word 3
	mem_c: .word 1

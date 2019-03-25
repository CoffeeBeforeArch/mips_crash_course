# This program shows off the basics of sub-programs in MIPS
# By: Nick from CoffeeBeforeArch

.text
main:
	
# Sub-program print_result
# Takes
#	$a0: Address of string to print
#	$a1: Result of computation
# Effects
#	Prints a string and integer to the console
print_result:
	

.data
prompt1: .asciiz "Enter an integer A: "
prompt2: .asciiz "Enter an integer B: "
result: .asciiz "The result is: "

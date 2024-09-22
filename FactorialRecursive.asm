# factorial of N
.data
N: .word 5
rez: .word 0

.text
lw $a0,N
jal factorial #factorial($a0)

sw $v0,rez

move $a0,$v0
li $v0,1
syscall #syscall 1: print $a0

li $v0,10
syscall

factorial:
	beqz $a0,BaseCase
	
	RecursiveCase:
		subi $sp,$sp,8 
		sw $ra,0($sp)
		sw $a0,4($sp)
		
		sub $a0,$a0,1
		jal factorial
		
		lw $a0,4($sp)
		lw $ra,0($sp)
		addi $sp,$sp,8
		
		mul $v0,$v0,$a0
	
		jr $ra
	
	BaseCase:
		li $v0,1
		jr $ra
	

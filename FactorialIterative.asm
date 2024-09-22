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
	subi $sp,$sp,4
	sw $a0,0($sp)

	li $v0,1
	while:
		beqz $a0,endwhile
		mul $v0,$v0,$a0
		subi $a0,$a0,1
		j while
	endwhile:
		lw $a0,0($sp)
		addi $sp,$sp,4
		jr $ra

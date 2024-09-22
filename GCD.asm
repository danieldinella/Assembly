.globl main

.data
x: .word 105
y: .word 120

.text
main:
	lw $a0, x
	lw $a1, y
	
	jal gcd
	move $a0, $v0
	
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
	
gcd:
	subi $sp, $sp, 12
	sw $ra, 8($sp)
	sw $a1, 4($sp)
	sw $a0, 0($sp)
	
	beq $a0, $a1, rez
	blt $a0, $a1, zero
	j uno
	
	zero:
		sub $a1, $a1, $a0
		j gcd
	
	uno:
		sub $a0, $a0, $a1
		j gcd
	
	rez:
		add $v0, $a0, $zero
	
	lw $a0, 0($sp)
	lw $a1, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	
	jr $ra
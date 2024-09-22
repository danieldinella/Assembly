
.data
	Vector: .word 4, -1, 5, 500, 0, 10000, -256
	N: .word 6
	Somme: .word 0, 0

.text
main:
	lw $t0, N
	lw $t4, Somme($zero)
	lw $t5, Somme($4)
	li $t1, 0
for:
	bge $t1, $t0, endfor
	sll $t2, $t1, 2
	lw $t3, Vector($t2)
	add $t4, $t4, $t3
	addi $t1, $t1, 1
	bge $t1, $t0, endfor
	sll $t2, $t1, 2
	lw $t3, Vector($t2)
	add $t5, $t5, $t3
	addi $t1, $t1, 1
	j for
endfor:
	sw $t4, Somme($zero)
	sw $t5, Somme($4)
	

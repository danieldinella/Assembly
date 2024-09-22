##########################################
# INSERIRE I PROPRI DATI QUI
# Nome: Daniel
# Cognome: Di Nella
# Matricola: 1997273
##########################################

# NON MODIFICARE QUESTA PARTE
.data
    buffer: .space 20

.text

main:
    li $v0, 8       # Codice per input stringa
    la $a0, buffer  # Carica indirizzo base in $a0
    li $a1, 20      # Alloca al massimo 20 caratteri
    syscall         # $a0 contiene l'indirizzo base della stringa


##########################################
## INSERIRE IL CODICE QUI 
    
    
    jal contaOccorrenze
    
    move $a0, $v0
    li $v0, 1
    syscall
    
    la $a0, 0xA
    li $v0, 11
    syscall
    
    move $a0, $v1
    li $v0, 1
    syscall

	li $v0, 10
	syscall
	
contaOccorrenze:
	li $v0, 0
	li $v1, 0

cycle:	
	lb $t0, ($a0)
	beq $t0, 0xA, end
	beq $t0, 0x30, isZero
	j isOne

isZero:
	addi $v0, $v0, 1
	addi $a0, $a0, 1
	j cycle

isOne:
	addi $v1, $v1, 1
	addi $a0, $a0, 1
	j cycle
  
end:
	jr $ra
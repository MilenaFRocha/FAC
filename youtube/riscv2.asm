.data

.text

# valor de n
li a7, 5 # fun��o de input
ecall # coloca o valor de entrada em a0
mv s1, a0 # coloca o valor contido em a0 em s1


ecall
mv s2, a0

while:
	addi s1, s1, -1 # quantidade de loop -1 (primeira intera�nao ja foi)
	beq s1, zero, count
	li a7, 5 # fun��o de input
	ecall # coloca o valor de entrada em a0
	
	slt t1, s2, a0
	beq t1, zero, while
	mv s2, a0
	j while
	
	
count:
	li a7, 1
	mv a0, s2
	ecall
	
	li a7, 11 #prox funcao a ser feita
 	li a0, 10 #quebra de linha, tabela ascii
 	ecall 
 
 	li a7, 10
 	ecall
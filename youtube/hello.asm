.data		# aqui defino minhas vari�veis globais
	hello: .asciz "Ola Mundo\n"	#variavel hello recebe string do ascii com \0 no final

.text		# tipo o main

li a7, 4	# (load immediate) carrega o imediato 4 que indica que ser� printado uma string.
		# cada fun��o de ntrada e saida existe um n�mero e normalmente � alocado no a7
		
la a0, hello	# (load adress) carrega para a0 o endere�o de hello
ecall 		# aciono o kernel do sistema operacional
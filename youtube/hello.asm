.data		# aqui defino minhas variáveis globais
	hello: .asciz "Ola Mundo\n"	#variavel hello recebe string do ascii com \0 no final

.text		# tipo o main

li a7, 4	# (load immediate) carrega o imediato 4 que indica que será printado uma string.
		# cada função de ntrada e saida existe um número e normalmente é alocado no a7
		
la a0, hello	# (load adress) carrega para a0 o endereço de hello
ecall 		# aciono o kernel do sistema operacional
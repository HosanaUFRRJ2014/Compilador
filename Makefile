all:
	flex reconhecerNumeros.l
	
	gcc -o reconhecerNumeros lex.yy.c -lfl

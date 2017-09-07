all:
	flex reconhecerNumeros.l
	
	gcc -o reconhecerNumeros lex.yy.c -lfl


#Este é o makeFile!

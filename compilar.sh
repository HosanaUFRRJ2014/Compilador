#!/bin/sh

#Executando o shell: ./NOME_SHELL.sh NOME_CODIGO_C.c NOME_CODIGO_SAIDA



#NOME_CODIGO_FLEX=$1
#NOME_EXECUTAVEL_SAIDA=$2


echo "Código compilado!\nPara executar, basta digitar no terminal:	"	 
echo "./$2"

flex $1
gcc -o $2 lex.yy.c -lfl

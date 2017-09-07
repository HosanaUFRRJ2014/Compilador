%{
#include <stdio.h>
#include <stdlib.h>

#define classeInteiro	1
#define classeFlutuante	2
#define classeOctal		3
#define classeHexaD		4
#define classeId		5
#define classeComando	6
#define classeBinario	7
#define classeBoolean	8
#define classeOperador	9
#define QTDCLASSES		9
%}

/*constantes e alfabetos*/
zero			[0]
d 				[0-9]
dMais 			[1-9]
letras			[a-z]
LETRAS 			[A-Z]
Letras 			[a-zA-Z]
simbolos		"-"|"_"
hx 				[A-F0-9]
hxMais			[A-F1-9]
constHx			"0x"
constOct		[0]

/*tipos*/
boolean			"true"|"false"
inteiro			{dMais}({d}*)
inteiroNegativo	"-"{inteiro}
real			({zero}|{inteiro})"."{inteiro}
realCientifico	{real}"E"({inteiroNegativo}|{inteiro})
octal			{constOct}{inteiro}
hexadecimal		{constHx}{hxMais}({hx}*)
binario			"bin"(0|1)*
valor			{binario}|{hexadecimal}|{octal}|{realCientifico}|{real}|{inteiroNegativo}|{inteiro}|{zero}|{boolean}|{id}

/*palavras*/
comandos		"if"|"else"|"int"|"float"|"double"|"for"|"while"|"break"|"continue"|"return"
id				{Letras}({Letras}|{simbolos}|{d})*

/*operadores*/
opAritmetico	"+"|"-"|"*"|"**"|"/"|"("|")"|"["|"]"|"{"|"}"
opLogico		">"|"<"|"<="|">="|"=="|"==="|"!"|"&&"|"||"
opAcoes			"="|">>"|"<<"|","|"."|"{"|"}"|"("|")"|"["|"]"
opsGenerico		{opAritmetico}|{opLogico}|{opAcoes}
/*adcionar expressao*/
/*apenas para um teste de algo mais extenso
atribuicao		({id})(" "*)"="(" "*)({valor})(" "*)({opAritmetico})(" "*)({valor})(" "*)(";")
^{atribuicao}$		return 30;*/
%%


^{opsGenerico}$		return classeOperador;
^{boolean}$			return classeBoolean;
^{comandos}" "*$	return classeComando;
^{binario}$			return classeBinario;
^{id}" "*$			return classeId;
^{hexadecimal}$		return classeHexaD;
^{octal}$			return classeOctal;
^{realCientifico}$	return classeFlutuante;
^{real}$			return classeFlutuante;
^{inteiroNegativo}$	return classeInteiro;
^{inteiro}$			return classeInteiro;
^{zero}$			return classeInteiro;



%%

void main()
{

	int val[QTDCLASSES+1];
	int i;
	for(i=0;i<=QTDCLASSES;i++)
		val[i] = 0;
	int leitura = 0;
	while ( (leitura = yylex()) > 0 ) {
		printf("%d", leitura);
		val[leitura] += 1;
	}

	for(i=0;i<=QTDCLASSES;i++)
		printf("classe %d = %d\n", i, val[i]);
}

%{
#include "calculadora.tab.h"  /* Arquivo gerado pelo Bison */
%}

%option noyywrap

%%
[ \t]    ; /* Ignora espaços e tabs */
[0-9]+   { yylval = atoi(yytext); return NUMERO; }
"+"      { return MAIS; }
"-"      { return MENOS; }
"*"      { return MULTIPLICACAO; }
"/"      { return DIVISAO; }
"("      { return ABRE_PARENTESE; }
")"      { return FECHA_PARENTESE; }
\n       { return NOVA_LINHA; }
"ret2pol"    { return RET2POL; }
"pol2ret"    { return POL2RET; }
","          { return VIRGULA; }
.        { printf("Caractere inválido: %s\n", yytext); } /*Precisa ficar por ultimo pela sequencia*/
%%
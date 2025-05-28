%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void yyerror(const char *s);
int yylex();
%}

%token NUMERO MAIS MENOS MULTIPLICACAO DIVISAO ABRE_PARENTESE FECHA_PARENTESE NOVA_LINHA VIRGULA
%token RET2POL POL2RET

%left MAIS MENOS
%left MULTIPLICACAO DIVISAO
%left UMINUS

%%

entrada:
    expressao NOVA_LINHA   { printf("Resultado = %.2f\n", $1); }
    ;

expressao:
    expressao MAIS expressao                { $$ = $1 + $3; }
    | expressao MENOS expressao             { $$ = $1 - $3; }
    | expressao MULTIPLICACAO expressao     { $$ = $1 * $3; }
    | expressao DIVISAO expressao           
        {
            if ($3 == 0) {
                fprintf(stderr, "Erro: divisão por zero!\n");
                $$ = 0;
            } else {
                $$ = $1 / $3;
            }
        }
    | ABRE_PARENTESE expressao FECHA_PARENTESE { $$ = $2; }
    | MENOS expressao %prec UMINUS              { $$ = -$2; }
    | NUMERO                                    { $$ = $1; }

    /* Conversão Retangular -> Polar */
    | RET2POL ABRE_PARENTESE expressao VIRGULA expressao FECHA_PARENTESE
        {
            double a = $3;
            double b = $5;
            double r = sqrt(a * a + b * b);
            double theta_rad = atan2(b, a);
            double theta_deg = theta_rad * (180.0 / M_PI);
            printf("Forma Polar: %.2f ∠ %.2f graus\n", r, theta_deg);
            $$ = r;
        }

    /* Conversão Polar -> Retangular */
    | POL2RET ABRE_PARENTESE expressao VIRGULA expressao FECHA_PARENTESE
        {
            double r = $3;
            double theta_deg = $5;
            double theta_rad = theta_deg * (M_PI / 180.0); /*O que antes estava me retornando em radianos vai me retornar em graus*/
            double a = r * cos(theta_rad);
            double b = r * sin(theta_rad);
            printf("Forma Retangular: %.2f + %.2fi\n", a, b);
            $$ = a;
        }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Erro: %s\n", s);
}

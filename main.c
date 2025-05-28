#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "calculadora.tab.h"

extern int yyparse();
extern void yy_scan_string(const char* str);

int main() {
    char expressao[100];

        printf("=========== CALCULADORA ===========\n");
        printf("Operações básicas:\n");
        printf("    -> Soma:            2 + 3\n");
        printf("    -> Subtração:       5 - 2\n");
        printf("    -> Multiplicação:   4 * 3\n");
        printf("    -> Divisão:         10 / 2\n");
        printf("\n");

        printf("Conversões:\n");
        printf("    -> Retangular para Polar:\n");
        printf("       ret2pol(x, y)\n");
        printf("       Exemplo: ret2pol(3, 4)\n");
        printf("       Resultado esperado: Forma Polar: 5.00 ∠ 0.93 rad\n");
        printf("\n");

        printf("    -> Polar para Retangular:\n");
        printf("       pol2ret(r, θ)\n");
        printf("       Exemplo: pol2ret(5, 0.93)\n");
        printf("       Resultado esperado: Forma Retangular: 3.00 + 4.00i\n");
        printf("\n");

        printf("====================================\n");
        printf("Digite sua expressão:\n");


    while (1) {
        printf("> ");
        if (fgets(expressao, sizeof(expressao), stdin) == NULL)
            break;

        // Remove a quebra de linha do fgets
        expressao[strcspn(expressao, "\n")] = '\0';

        if (strlen(expressao) == 0)
            continue;

        // Cria nova string com \n no fim
        char entrada_com_nova_linha[110];
        snprintf(entrada_com_nova_linha, sizeof(entrada_com_nova_linha), "%s\n", expressao);

        // Passa para o Flex
        yy_scan_string(entrada_com_nova_linha);
        yyparse();
    }

    return 0;
}

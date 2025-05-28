# Compiladores
Projeto para criar uma biblioteca que implementa um compilador próprio, definindo regras léxicas e sintáticas do zero.
# Como rodar
Documentação para Rodar o Projeto com MSYS2, Bison, Flex e GCC
1. Instalar o MSYS2
Baixe em https://www.msys2.org/

Instale e abra o terminal MSYS2 (msys2.exe)

2. Atualizar o MSYS2  
No terminal, rode:  
bash  
Copiar  
Editar  
  pacman -Syu
Fecha o terminal quando pedir.  
Abre de novo e roda:  
bash  
Copiar    
Editar  
pacman -Su  
3. Instalar as ferramentas necessárias  
bash  
Copiar  
Editar  
  pacman -S bison flex gcc make
4. Rodar os arquivos .y e .l  
Navegue até a pasta com os arquivos .y e .l  
Gere os arquivos com:  
bash  
Copiar  
Editar  
  bison -d arquivo.y    # gera arquivo.tab.c e arquivo.tab.h
  flex arquivo.l        # gera lex.yy.c
5. Compilar com GCC  
Compile o main.c junto com os arquivos gerados pelo bison e flex:  
bash  
Copiar  
Editar
gcc main.c arquivo.tab.c lex.yy.c -o programa  
7. Rodar o programa  
bash  
Copiar  
Editar  
./programa  

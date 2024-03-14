%{
#include <stdio.h>
FILE *file;
%}
letter [A-Za-z]

%%

"boolean"   fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"class"     fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"extends"   fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"public"    fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"static"    fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"void"      fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"main"      fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"String"    fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"return"    fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"int"       fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"if"        fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"else"      fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"while"     fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"lenght"    fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"true"      fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"false"     fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"this"      fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"new"       fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"null"      fprintf(file, "Palavra_Reservada\t| %s\n", yytext);
"System.out.println"    fprintf(file, "Palavra_Reservada\t| %s\n", yytext);

{letter}({letter}|[0-9]|"_")*       fprintf(file, "Identificador\t\t| %s\n", yytext);
_("_"|{letter}|[0-9])*              fprintf(file, "ERRO LEXICO\t\t\t| %s\n", yytext);
[0-9]+({letter}|"_")+               fprintf(file, "ERRO LEXICO\t\t\t| %s\n", yytext);              

[0-9]+      fprintf(file, "Numerais\t\t\t| %s\n", yytext);
\.[0-9]+    fprintf(file, "ERRO LEXICO\t\t\t| %s\n", yytext);

"="         fprintf(file, "Operadores\t\t\t| %s\n", yytext);
"<"         fprintf(file, "Operadores\t\t\t| %s\n", yytext);
"=="        fprintf(file, "Operadores\t\t\t| %s\n", yytext);
"!="        fprintf(file, "Operadores\t\t\t| %s\n", yytext);
"+"         fprintf(file, "Operadores\t\t\t| %s\n", yytext);
"-"         fprintf(file, "Operadores\t\t\t| %s\n", yytext);
"*"         fprintf(file, "Operadores\t\t\t| %s\n", yytext);
"&&"        fprintf(file, "Operadores\t\t\t| %s\n", yytext);
"!"         fprintf(file, "Operadores\t\t\t| %s\n", yytext);

"("         fprintf(file, "Pontuacao\t\t\t| %s\n", yytext);
")"         fprintf(file, "Pontuacao\t\t\t| %s\n", yytext);
"["         fprintf(file, "Pontuacao\t\t\t| %s\n", yytext);
"]"         fprintf(file, "Pontuacao\t\t\t| %s\n", yytext);
"{"         fprintf(file, "Pontuacao\t\t\t| %s\n", yytext);
"}"         fprintf(file, "Pontuacao\t\t\t| %s\n", yytext);
";"         fprintf(file, "Pontuacao\t\t\t| %s\n", yytext);
"."         fprintf(file, "Pontuacao\t\t\t| %s\n", yytext);
","         fprintf(file, "Pontuacao\t\t\t| %s\n", yytext);

[[:space:]]+          ;

.           fprintf(file, "ERRO LEXICO\t\t\t| %s\n", yytext);

%%

int yywrap() {}

int main() {
    file = fopen("output.txt", "w");
    yylex();
    fclose(file);
    return 0;
}

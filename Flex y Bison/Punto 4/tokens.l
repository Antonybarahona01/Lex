%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

[0-9]+\.[0-9]+    { printf("TOKEN: NUMBER VALOR: %s\n", yytext); }
[0-9]+            { printf("TOKEN: NUMBER VALOR: %s\n", yytext); }
\+                { printf("TOKEN: ADD   VALOR: %s\n", yytext); }
\-                { printf("TOKEN: SUB   VALOR: %s\n", yytext); }
\*                { printf("TOKEN: MUL   VALOR: %s\n", yytext); }
\/                { printf("TOKEN: DIV   VALOR: %s\n", yytext); }
\^                { printf("TOKEN: EXP   VALOR: %s\n", yytext); }
\%                { printf("TOKEN: MOD   VALOR: %s\n", yytext); }
\(                { printf("TOKEN: PARENTESIS (izq) VALOR: %s\n", yytext); }
\)                { printf("TOKEN: PARENTESIS (der) VALOR: %s\n", yytext); }
\n                { printf("TOKEN: EOL   VALOR: \n"); }
[ \t]+            { /* Ignorar espacios en blanco */ }
.                 { printf("TOKEN: UNKNOWN VALOR: %s\n", yytext); }

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Error opening file");
            return 1;
        }
        yyin = file;
    }
    yylex();
    if (argc > 1) {
        fclose(yyin);
    }
    return 0;
}

int yywrap() {
    return 1;
}

%{
#include <stdio.h>
#include <stdlib.h>

// Función que clasifica un número complejo según sus partes real e imaginaria
void clasificar_complejo(double real, double imag) {
    if (real == 0 && imag == 0) {
        printf("Cero\n");
    } else if (real != 0 && imag == 0) {
        printf("Real\n");
    } else if (real == 0 && imag != 0) {
        printf("Imaginario\n");
    } else {
        printf("Complejo\n");
    }
}
%}

%%

[ \t]*([+-]?[0-9]+(\.[0-9]*)?|\.[0-9]+)[ \t]*[+-][ \t]*([0-9]+(\.[0-9]*)?|\.[0-9]+)[iI] {
    // Para expresiones completas como "10 + 5i"
    double real, imag;
    sscanf(yytext, "%lf %lf", &real, &imag);
    clasificar_complejo(real, imag);
}

[ \t]*([+-]?[0-9]+(\.[0-9]*)?|\.[0-9]+)[iI] {
    // Para números imaginarios como "5i", "-0.5i"
    clasificar_complejo(0, atof(yytext));
}

[ \t]*([+-]?[0-9]+(\.[0-9]*)?|\.[0-9]+) {
    // Para números reales como "3.14159"
    clasificar_complejo(atof(yytext), 0);
}

[ \t]*[+-]?[iI] {
    // Para "+i" o "-i"
    clasificar_complejo(0, yytext[0] == '-' ? -1 : 1);
}

[ \t]*\n {
    /* Ignorar líneas vacías */
}

%%

int yywrap(void) {
    return 1;
}

int main(int argc, char **argv) {
    FILE *archivo;

    if (argc > 1) {
        archivo = fopen(argv[1], "r");
        if (!archivo) {
            perror("No se pudo abrir el archivo");
            return 1;
        }
        yyin = archivo;
    } else {
        printf("Por favor, proporcione un archivo .txt como entrada.\n");
        return 1;
    }

    yylex();

    if (archivo) {
        fclose(archivo);
    }

    return 0;
}

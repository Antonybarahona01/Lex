%{
#include <stdio.h>
#include <locale.h>

int num_lines = 0;   // Contador para el número de líneas
int num_words = 0;   // Contador para el número de palabras
int num_chars = 0;   // Contador para el número de caracteres

%}

%%

\n          { num_lines++; num_chars++; }          // Incrementa el contador de líneas y caracteres para cada salto de línea (\n).
[ \t]+      { num_chars += yyleng; }               // Incrementa el contador de caracteres para espacios y tabulaciones.
[A-Za-zÀ-ÿ]+ { num_words++; num_chars += yyleng; } // Incrementa el contador de palabras y caracteres para palabras alfanuméricas y caracteres acentuados.
.           { num_chars++; }                       // Incrementa el contador de caracteres para cualquier otro carácter.

%%

int main(int argc, char *argv[]) {
    setlocale(LC_ALL, "");  // Establece la localización para manejar caracteres multibyte

    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");  // Abre el archivo para lectura
        if (!file) {  // Si no se puede abrir el archivo, muestra un mensaje de error y termina el programa
            printf("Error: No se puede abrir el archivo %s\n", argv[1]);
            return 1;  // Termina el programa con un código de error
        }
        yyin = file;  // Asigna el archivo abierto a la variable yyin para que Flex lo procese
    } else {
        printf("Error: No se especificó un archivo\n");
        return 1;
    }

    yylex();  // Inicia el análisis léxico del archivo de entrada

    // Asegura que la última línea se cuente si no termina con un salto de línea
    if (num_chars > 0 && (num_lines == 0 || num_chars > num_lines)) {
        num_lines++;
    }

    // Imprime los resultados del conteo
    printf("Número de líneas: %d\n", num_lines);
    printf("Número de palabras: %d\n", num_words);
    printf("Número de caracteres: %d\n", num_chars);

    return 0;  // Termina el programa exitosamente
}

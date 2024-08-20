%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Definición de traducciones
struct Translation {
    char *english;
    char *spanish;
};

// Tabla de traducciones (agrega más pares según sea necesario)
struct Translation translations[] = {
    {"hello", "hola"},
    {"world", "mundo"},
    {"cat", "gato"},
    {"cats", "gatos"},
    {"dog", "perro"},
    {"dogs", "perros"},
    {"apple", "manzana"},
    {"books", "libros"},
    {"book", "libro"},
    {"computer", "computador"},
    {"house", "casa"},
    {"friend", "amigo"},
    {"friends", "amigos"},
    {"food", "comida"},
    {"The", "la"},
    {"the", "el"},
    {"a", "un"},
    {"I", "yo"},
    {"have", "tengo"},
    {"and", "y"},
    {"is", "esta"},
    {"on", "sobre"},
    {"My", "Mi"},
    {"has", "tiene"},
    {"two", "dos"},
    {"three", "tres"},
    {"table", "mesa"},
    {"is", "es"},
    {"very", "muy"},
    {"interesting", "interesante"},
};

// Número total de traducciones
#define NUM_TRANSLATIONS (sizeof(translations) / sizeof(translations[0]))

// Función para traducir una palabra del inglés al español
char *translate(char *word) {
    // Verifica si la palabra termina en 's' y trata de encontrar la forma singular
    char singular[strlen(word) + 1];
    strcpy(singular, word);
    if (strlen(singular) > 1 && singular[strlen(singular) - 1] == 's') {
        singular[strlen(singular) - 1] = '\0';
        for (int i = 0; i < NUM_TRANSLATIONS; i++) {
            if (strcmp(singular, translations[i].english) == 0) {
                return translations[i].spanish;
            }
        }
    }

    // Busca la traducción para la palabra en su forma original
    for (int i = 0; i < NUM_TRANSLATIONS; i++) {
        if (strcmp(word, translations[i].english) == 0) {
            return translations[i].spanish;
        }
    }

    // Retorna la palabra original si no se encuentra la traducción
    return word;
}
%}

%%

\n                  { printf("\n"); } // Imprime un salto de línea
[ \t]+              { /* Ignorar espacios y tabulaciones */ }
[a-zA-Z]+           { char *translation = translate(yytext); printf("%s ", translation); } // Traduce y muestra la palabra
.                   { putchar(yytext[0]); } // Imprimir otros caracteres (como puntuación)

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Error opening file");
            return 1;
        }
        yyin = file;
    } else {
        yyin = stdin; // Lee desde la entrada estándar si no se proporciona un archivo
    }

    yylex(); // Inicia el análisis léxico

    if (argc > 1) {
        fclose(yyin);
    }

    return 0;
}

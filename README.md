# Integrantes
1. David Martinez
2. Franco Comas
3. Antony Barahona

# Flex
Este repositorio contiene la solución para cinco tareas desarrolladas en Flex, relacionadas con el procesamiento de texto y el reconocimiento de tokens.

## Antes de Empezar
1. **Verificar la Instalación de Flex o Lex:**
   - Abrir una terminal en Kali Linux utilizando el atajo `Ctrl + Alt + T`.
   - En la terminal, ingresar el comando `flex --version`. Esto mostrará la versión de Flex instalada (en este caso, se espera la versión 2.6.4).

2. **Instalar Flex o Lex:**
   - Si Flex o Lex no está instalado, abrir una terminal con `Ctrl + T`.
   - Ingresar el comando `sudo apt-get install flex` y presionar Enter. Esto instalará Flex en el sistema.

## Desarrollo de Tareas

### Tarea 1: Contador de Líneas, Palabras y Caracteres
Desarrollar un programa en LEX que cuente el número de líneas, palabras y caracteres en un archivo de texto.

#### Guía para la Creación del Archivo `Contador.l`
1. Abrir una nueva terminal presionando `Ctrl + Alt + T`.
2. Ingresar el comando `nano contador.l` y presionar Enter para abrir el editor de texto Nano.
3. Copiar el código del archivo `contador.l` (disponible en el repositorio, carpeta Punto 1) y pegarlo en el editor de texto.
   - Si los comandos `Ctrl + C` y `Ctrl + V` no funcionan para copiar y pegar, seleccionar el código con el botón izquierdo del mouse, copiar el contenido haciendo clic derecho y eligiendo "Copiar".
4. Con el código copiado al portapapeles, volver a la terminal y pegar el código presionando clic derecho y seleccionando "Pegar".
5. Para guardar el archivo en el editor, presionar `Ctrl + O`. Confirmar el nombre del archivo en la parte inferior y presionar Enter.
6. La terminal mostrará una confirmación del número de líneas escritas en el archivo. Después de verificar, presionar `Ctrl + X` para salir del editor de texto.
7. El archivo `contador.l` estará ahora creado.
8. En la misma terminal, utilizar los comandos `flex contador.l` y luego `gcc lex.yy.c -o contador -lfl` para generar un ejecutable llamado `contador`.

#### Guía para la Creación del Archivo `ejemplo1.txt` (Archivo de Argumento)
1. Abrir una nueva terminal presionando `Ctrl + Alt + T`.
2. Ingresar el comando `nano ejemplo1.txt` y presionar Enter para abrir el editor de texto Nano.
3. Copiar el contenido del archivo `ejemplo1.txt` (o cualquier ejemplo disponible en el repositorio, carpeta Punto 1) y pegarlo en el editor de texto.
   - Si los comandos `Ctrl + C` y `Ctrl + V` no funcionan, seleccionar el contenido con el botón izquierdo del mouse, copiarlo haciendo clic derecho y eligiendo "Copiar".
4. Con el contenido copiado al portapapeles, volver a la terminal y pegar el contenido presionando clic derecho y seleccionando "Pegar".
5. Para guardar el archivo en el editor, presionar `Ctrl + O`. Confirmar el nombre del archivo en la parte inferior y presionar Enter.
6. La terminal mostrará una confirmación del número de líneas escritas en el archivo. Después de verificar, presionar `Ctrl + X` para salir del editor de texto.
7. El archivo `ejemplo1.txt` estará ahora creado y listo para su uso.

#### Consideraciones Adicionales
1. Se recomienda ubicar el archivo de ejemplo en la carpeta personal y abrirlo para verificar que no se haya creado una línea adicional al final del documento, ya que esto puede causar errores en el conteo de líneas.
2. Si se genera una nueva línea al guardar el documento, seguir estos pasos para corregirlo:
   1. Hacer clic derecho sobre el documento y seleccionar "Abrir con".
   2. Seleccionar el programa "mousepad".
   3. En el menú superior de mousepad, seleccionar la opción "Editar".
   4. Dentro de "Editar", hacer clic en "Preferencias".
   5. En la ventana de "Preferencias de mousepad", ir a la opción "Archivo".
   6. Desmarcar la casilla "Asegúrese de que haya una nueva línea al final del archivo".
   7. Cerrar la ventana de preferencias.
   8. El editor de texto estará ahora configurado para no añadir líneas automáticamente.

#### Aclaraciones
1. El programa está diseñado para contar los caracteres con tilde como dos caracteres. Si se encuentran inconsistencias en los resultados, se recomienda verificar las tildes en el documento.
2. Se ha utilizado la página [Contador de Caracteres](https://www.contadordecaracteres.com/) para verificar los resultados obtenidos con el programa.

## Ejecución de la Tarea
Una vez creados todos los archivos, la carpeta personal debería contener los siguientes documentos:
1. Un archivo llamado `contador` (el ejecutable).
2. Un archivo llamado `contador.l`.
3. Un archivo llamado `lex.yy.c`.
4. Un archivo llamado `ejemplo1.txt`.

Para ejecutar el programa:
1. Abrir una nueva terminal con el comando `Ctrl + T`.
2. En la terminal, ingresar `./contador ejemplo1.txt` y presionar Enter.
3. Verificar los resultados proporcionados por el programa.

### Tarea 2: Traductor de Ingles a Español
Desarrollar un programa en LEX que traduzca palabras o frases sencillas de ingles a español.

#### Guía para la Creación del Archivo `Traductor.l`
1. Abrir una nueva terminal presionando `Ctrl + Alt + T`.
2. Ingresar el comando `nano traductor.l` y presionar Enter para abrir el editor de texto Nano.
3. Copiar el código del archivo `traductor.l` (disponible en el repositorio, carpeta Punto 2) y pegarlo en el editor de texto.
   - Si los comandos `Ctrl + C` y `Ctrl + V` no funcionan para copiar y pegar, seleccionar el código con el botón izquierdo del mouse, copiar el contenido haciendo clic derecho y eligiendo "Copiar".
4. Con el código copiado al portapapeles, volver a la terminal y pegar el código presionando clic derecho y seleccionando "Pegar".
5. Para guardar el archivo en el editor, presionar `Ctrl + O`. Confirmar el nombre del archivo en la parte inferior y presionar Enter.
6. La terminal mostrará una confirmación del número de líneas escritas en el archivo. Después de verificar, presionar `Ctrl + X` para salir del editor de texto.
7. El archivo `traductor.l` estará ahora creado.
8. En la misma terminal, utilizar los comandos `flex traductor.l` y luego `gcc lex.yy.c -o traductor -lfl` para generar un ejecutable llamado `traductor`.

#### Guía para la Creación del Archivo `ejemplo1.txt` (Archivo de Argumento)
1. Abrir una nueva terminal presionando `Ctrl + Alt + T`.
2. Ingresar el comando `nano ejemplo1.txt` y presionar Enter para abrir el editor de texto Nano.
3. Copiar el contenido del archivo `ejemplo1.txt` (o cualquier ejemplo disponible en el repositorio, carpeta Punto 1) y pegarlo en el editor de texto.
   - Si los comandos `Ctrl + C` y `Ctrl + V` no funcionan, seleccionar el contenido con el botón izquierdo del mouse, copiarlo haciendo clic derecho y eligiendo "Copiar".
4. Con el contenido copiado al portapapeles, volver a la terminal y pegar el contenido presionando clic derecho y seleccionando "Pegar".
5. Para guardar el archivo en el editor, presionar `Ctrl + O`. Confirmar el nombre del archivo en la parte inferior y presionar Enter.
6. La terminal mostrará una confirmación del número de líneas escritas en el archivo. Después de verificar, presionar `Ctrl + X` para salir del editor de texto.
7. El archivo `ejemplo1.txt` estará ahora creado y listo para su uso.

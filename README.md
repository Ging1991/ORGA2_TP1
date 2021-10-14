# Trabajo práctico para organización del computador II

## Objetivos
El objetivo base del TP es crear un programa en ensamblador NASM que calcule las raíces de una función cuadrática utilizando la fórmula resolvente. Esta función debe ser llamada desde código en C, y ambos archivos deben enlazarse para generar un único ejecutable.

Para ver en detalle los puntos del TP puede leer el siguiente [PDF](https://github.com/Ging1991/ORGA2_TP1/blob/master/TP%20I%20-%20Formula%20resolvente.pdf)
## Ficha técnica
Sistema Operativo: Linux 32 bits

Ensamblador: NASM

Otros lenguajes: C

## Para ejecutar en casa
Puede probarlo en Linux parandose en una terminal dentro de la carpeta del proyecto y ejecutando los siguientes comandos:
```bash
nasm -f elf32 raiz.asm -o raiz.o;
gcc -m32 -o raiz raiz.o raiz.c;
./raiz;
```
O simplemente llamando al archivo compilacion.sh
```bash
./compilacion.sh;
```
## Ejemplo de uso

## Contribuciones
No se aceptan pull request. Este es un trabajo para entregar a la facultad, una vez termine el periodo de pruebas ya no se no le hará mantenimiento.

Eventualmente, si todo sale bien, crearé algunos ejemplos funcionales en ensamblador, y entre ellos estará este trabajo, pero será un proyecto a parte con otros objetivos.
## Licencia
[Sin licencia](https://choosealicense.com/licenses/unlicense/)

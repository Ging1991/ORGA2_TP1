# Trabajo práctico para organización del computador II

## Objetivos
El objetivo base del TP es crear un programa en ensamblador **NASM** que calcule las raíces de una función cuadrática utilizando la fórmula resolvente. Esta función debe ser llamada desde código en C, y ambos archivos deben enlazarse para generar un único ejecutable.

Para ver en detalle los puntos del TP puede leer el siguiente [PDF](https://github.com/Ging1991/ORGA2_TP1/blob/master/TP%20I%20-%20Formula%20resolvente.pdf)
## Ficha técnica
- Sistema Operativo: Linux 32 bits

- Ensamblador: NASM

- Otros lenguajes: C

## Para ejecutar en casa
Desde Linux de 32 bits abrir una terminal en la carpeta de su preferencia y clonar el proyecto con GIT
```bash
git clone https://github.com/Ging1991/ORGA2_TP1.git
```
Luego ir dentro de la carpeta de proyecto creada y ejecutar los siguientes comandos:
```bash
nasm -f elf32 raiz.asm -o raiz.o;
gcc -m32 -o raiz raiz.o raiz.c;
./raiz;
```
O simplemente llamando al archivo _compilacion.sh_
```bash
./compilacion.sh;
```
Podrá ver **por consola** el resultado de calcular las raíces puestas por defecto. _Notar que queda pendiente la funcionalidad de recibir los coeficientes A,B y C por parámetro._
## Ejemplo de uso
Luego de haber clonado el proyecto, abro una terminal en la carpeta raíz donde se ven los siguientes archivos:

![Captura 1](/imagenes/tp_captura_1.png)

Ejecuto el comando de compilación y veo por consola los resultados, en este caso las raíces son 1/2 y -4.

![Captura 2](/imagenes/tp_captura_2.png)

- Notar que los coeficientes por defecto son:
1. Coeficiente A -> 1
2. Coeficiente B -> 7/2
3. Coeficiente A -> -2
- Notar también que se creó el archivo raíz, sin extensión, que antes no existía. Ese archivo es el resultado de unir los códigos en ensamblador y C.
## Contribuciones
No se aceptan **pull request**. Este es un trabajo para entregar a la facultad. Una vez termine el periodo de pruebas ya no se no le hará mantenimiento.

Eventualmente, si todo sale bien, crearé algunos ejemplos funcionales en ensamblador, y entre ellos estará este trabajo, pero será un proyecto a parte con otros objetivos.
## Licencia
[Sin licencia](https://choosealicense.com/licenses/unlicense/)
## Enlaces útiles
[Ver perfil GitHub](https://github.com/Ging1991)

[Canal de Youtube](https://www.youtube.com/channel/UCsdNi2EY87x7vPVA9nNtyvA)
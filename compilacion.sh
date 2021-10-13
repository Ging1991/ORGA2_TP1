nasm -f elf32 raiz.asm -o raiz.o;
gcc -m32 -o raiz raiz.o raiz.c;
./raiz;
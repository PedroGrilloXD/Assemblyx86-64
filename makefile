calculadora: calculadora.o
	gcc -o calculadora calculadora.o -no-pie

calculadora.o: calculadora.asm
	nasm -f elf64 -g -F dwarf calculadora.asm -l calculadora.lst

zad1: zad1.o
	ld -melf_i386 -o zad1 zad1.o

zad1.o: zad1.s
	as --32 -g zad1.s -o zad1.o

all: zad1

clean:
	rm -f zad1 zad1.o




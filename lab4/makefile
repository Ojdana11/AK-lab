lab1: zad1.o sin.o
	ld -melf_i386 zad1.o -o zad1
	ld -melf_i386 sin.o -o sin

lab1.o: zad1.s sin.s
	as --32 zad1.s -o zad1.o
	as --32 sin.s -o sin.o

all: zad1 sin

clean:
	rm -f zad1 zad1.o
	rm -f sin sin.o



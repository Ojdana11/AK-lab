zad1: zad1.o zad2.o
	ld -melf_i386 zad1.o -o zad1
	ld -melf_i386 zad2.o -o zad2

zad1.o: zad1.s zad2.s
	as --32 -g zad1.s -o zad1.o
	as --32 -g zad2.s -o zad2.o

all: zad1 zad2

clean:
	rm -f zad1 zad1.o
	rm -f zad2 zad2.o




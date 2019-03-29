zad1: zad1.o zad2.o test.o
	ld -melf_i386 zad1.o -o zad1
	ld -melf_i386 zad2.o -o zad2
	ld -melf_i386 test.o -o test

zad1.o: zad1.s zad2.s test.s
	as --32 -g zad1.s -o zad1.o
	as --32 -g zad2.s -o zad2.o
	as --32 -g test.s -o test.o

all: zad1 zad2 test

clean:
	rm -f zad1 zad1.o
	rm -f zad2 zad2.o
	rm -f test test.o




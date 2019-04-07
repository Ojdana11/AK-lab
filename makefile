zad1: zad1.o zad2.o test.o zad2sub.o zad4.o zad4hex.o
	ld -melf_i386 zad1.o -o zad1
	ld -melf_i386 zad2.o -o zad2
	ld -melf_i386 test.o -o test
	ld -melf_i386 zad2sub.o -o zad2sub
	ld -melf_i386 zad4.o -o zad4
	ld -melf_i386 zad4hex.o -o zad4hex

zad1.o: zad1.s zad2.s test.s zad2sub.s zad4.s zad4hex.s
	as --32 -g zad1.s -o zad1.o
	as --32 -g zad2.s -o zad2.o
	as --32 -g test.s -o test.o
	as --32 -g zad2sub.s -o zad2sub.o
	as --32 -g zad4.s -o zad4.o
	as --32 -g zad4hex.s -o zad4hex.o



all: zad1 zad2 test zad2sub zad4 zad4hex 

clean:
	rm -f zad1 zad1.o
	rm -f zad2 zad2.o
	rm -f test test.o
	rm -f zad2sub zad2sub.o
	rm -f zad4 zad4.o
	rm -f zad4hex zad4hex.o




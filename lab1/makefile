lab1: lab1.o linijka.o balwan.o line.o
	ld -melf_i386 lab1.o -o lab1
	ld -melf_i386 linijka.o -o linijka
	ld -melf_i386 balwan.o -o balwan 
	ld -melf_i386 line.o -o line 

lab1.o: lab1.s linijka.s balwan.s line.s
	as --32 -g lab1.s -o lab1.o
	as --32 -g linijka.s -o linijka.o
	as --32 -g balwan.s -o balwan.o
	as --32 -g line.s -o line.o

all: lab1 linijka balwan line

clean:
	rm -f lab1 lab1.o
	rm -f linijka linijka.o
	rm -f balwan balwan.o
	rm -f line line.o



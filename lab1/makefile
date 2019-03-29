lab1: hello.o linijka.o balwan.o linijka2.o
	ld -melf_i386 hello.o -o hello
	ld -melf_i386 linijka.o -o linijka
	ld -melf_i386 balwan.o -o balwan 
	ld -melf_i386 linijka2.o -o linijka2 


lab1.o: hello.s linijka.s balwan.s linijka2.s
	as -32 hello.s -o hello.o
	as -32 linijka.s -o linijka.o
	as -32 balwan.s -o balwan.o
	as -32 linijka2.s -o linijka2.o


all: hello linijka balwan linijka2


clean:
	rm -f hello hello.o
	rm -f linijka linijka.o
	rm -f balwan balwan.o
	rm -f linijka2 linijka2.o




#http://www.plantation-productions.com/Webster/www.artofasm.com/DOS/ch05/CH05-2.html


.data

napisGlowny: .ascii "Funkcja glowna\n"
napisGlowny_len = . - napisGlowny
array:  .int 1,1,1,1,1
	.int 1,1,1,1,1

.global _start
_start:

mov $0, %edi
start_fill:

cmpl $10, %edi
je end_fill

inc %edi
mov $0, %eax
mov %eax, array(,%edi,4)

jmp start_fill

end_fill:

mov $1, %eax
mov $0, %ebx
int $0x80




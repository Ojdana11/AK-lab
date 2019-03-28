EXIT =1
WRITE =4
STDOUT =1
RETURN =0

.align 32

.section .data
hello: .ascii "Hello world!\n"
hello_len = . - hello

.global _start
_start:

mov $hello_len, %edx
mov $hello, %ecx
mov $STDOUT, %ebx
mov $WRITE, %eax
int $0x80

mov $RETURN, %ebx
mov $EXIT, %eax
int $0x80



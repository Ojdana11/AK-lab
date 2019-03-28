EXIT =1
READ =3
WRITE =4
STDOUT =1
RETURN =0

.align 32

.section .data
new_line: .ascii "\n"
new_line_len = . - new_line


.global _start
_start:

popa
mov $32, %edx
mov $STDOUT, %ebx
mov $WRITE, %eax
int $0x80

mov $new_line_len, %edx
mov $new_line, %ecx
mov $STDOUT, %ebx
mov $WRITE, %eax
int $0x80

mov $RETURN, %ebx
mov $EXIT, %eax
int $0x80

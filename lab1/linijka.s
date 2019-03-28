EXIT =1
READ =3
WRITE =4
STDOUT =1
STDIN =0
RETURN =0

.section .data

star: .ascii "*"
star_len = . - star
chain: .long 5
new_line: .ascii "\n"
new_line_len = . -new_line

.global _start
_start:

mov $0, %edi
mov $star_len, %edx

loop_start:
cmpl chain, %edi
je loop_end
inc %edi
mov $star, %ecx
mov $STDOUT, %ebx
mov $WRITE, %eax
int $0x80
jmp loop_start

loop_end:
mov $new_line_len, %edx
mov $new_line, %ecx
mov $STDOUT, %ebx
mov $WRITE, %eax
int $0x80

mov $RETURN, %ebx
mov $EXIT, %eax
int $0x80



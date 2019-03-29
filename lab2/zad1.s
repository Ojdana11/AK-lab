EXIT =1
WRITE =4
STDOUT =1
RETURN =0

.align 32

.section .data
new_line: .ascii "\n"
new_line_len = . - new_line


.global _start
.type _start, @function

_start:
pop %ecx
mov $6, %edx
pop %ecx
mov $STDOUT, %ebx
mov $WRITE, %eax
int $0x80

mov $new_line_len, %edx
mov $new_line, %ecx
mov $STDOUT, %ebx
mov $WRITE, %eax
int $0x80

pop %ecx
mov $0, %edi

loop_start:
cmpl $62, %edi
je loop_end
inc %edi
mov $32, %edx
pop %ecx
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

SYSEXIT = 1
EXIT_SUCCESS = 0
SYSWRITE = 4
STDOUT = 1
SYSREAD = 3
STDIN = 0

.bss
	.lcomm buffer, 4

.data
	text: .ascii "Podaj liczne:\n"
	text_len = . - text

.global _start
_start:

	mov $text, %ecx
	mov $text_len, %edx
	mov $STDOUT, %ebx
	mov $SYSWRITE, %eax
	int $0x80

	mov $buffer, %ecx
	mov $4, %edx
	mov $STDIN, %ebx
	mov $SYSREAD, %eax
	int $0x80
	
	movl $0, %ecx
	subl $48, buffer
	mov buffer, %ecx
	mov $0, %dh
	movl $0, buffer
	mov %ecx, buffer

	mov $0, %edi

	loop_start:
	cmpl $buffer, %edi
	je loop_end
	mov $4, %edx
	mov $buffer, %ecx
	mov $STDOUT, %ebx
	mov $SYSWRITE, %eax
	int $0x80
	jmp loop_start

loop_end: 

mov $0, %ebx
mov $1, %eax
int $0x80

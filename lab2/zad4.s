EXIT =1
WRITE =4
READ =3
STDIN =0
STDOUT =1
RETURN =0
BUFF_SIZE =100

.bss
numberOnein: .space 100
numberTwoin: .space 100


.data 
promptFirst: .ascii "Podaj pierwsza liczbe\n"
promptFirst_len = . - promptFirst
promptSecond: .ascii "Podaj druga liczbe\n"
promptSecond_len = . - promptSecond

.global _start
_start:

#"Podaje pierwsza liczbe"
mov $promptFirst_len, %edx
mov $promptFirst, %ecx
mov $WRITE, %eax
mov $STDOUT, %ebx
int $0x80

#"Wprowadzanie pierwszej liczby"
mov $numberOnein, %ecx
mov $BUFF_SIZE, %edx
mov $READ, %eax
mov $STDIN, %ebx
int $0x80

dec %eax
push %eax

#"Podaje druga liczbe"
mov $promptSecond_len, %edx
mov $promptSecond, %ecx
mov $WRITE, %eax
mov $STDOUT, %ebx
int $0x80

#"Wprowadzanie drugiej liczby"
mov $numberTwoin, %ecx
mov $BUFF_SIZE, %edx
mov $READ, %eax
mov $STDIN, %ebx
int $0x80

dec %eax
push %eax

mov $4, %edx
movl $0, %edi
loop:
movl $0, %ecx
cmpl $10, %edi
je loop_end
mov numberTwoin(,%edi,1), %cl
inc %edi
mov $WRITE, %eax
mov $STDOUT, %ebx
int $0x80
jmp loop

loop_end:
mov $RETURN, %ebx
mov $EXIT, %eax
int $0x80








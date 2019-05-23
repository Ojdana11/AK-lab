EXIT =1
READ =3
WRITE =4
STDOUT =1
STDIN =0
RETURN =0

.data

liczba1: .byte 0b11111111, 0b01111111,0b01111100, 0b11111111
one: .ascii "1"
one_len = . -one
zero: .ascii "0"
zero_len = . - zero
new_line: .ascii "\n"
new_line_len = . -new_line

.global _start
_start:


#pobranie liczby dziesietnej z liczby 
mov liczba1, %ecx
and $0b00000000011111111111111111111111, %ecx

mov $23, %edi
loop_start:
cmpl $0, %edi
je loop_end
dec %edi
btc %edi, %ecx
jnb print_one

mov $zero_len, %edx
mov $zero, %ecx
mov $STDOUT, %ebx
mov $WRITE, %eax
int $0x80
jmp loop_start

print_one:
mov $one_len, %edx
mov $one, %ecx
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

mov $EXIT, %eax
mov $RETURN, %ebx
int $0x80

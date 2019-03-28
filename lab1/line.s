EXIT =1
READ =3
WRITE =4
STDOUT =1
STDIN =0
RETURN =0

.align 32

.data
welcome: .ascii "Podaj dlugosc linijki: \n"
welcome_len = . - welcome

star: .ascii "*"
star_len = . - star

new_line: .ascii "\n"
new_line_len = . - new_line

textin: .int 0
textin_len = . - textin


.global _start
_start:

# Tekst zachęty wprowadzenia danych
mov $welcome_len, %edx
mov $welcome, %ecx
mov $STDOUT, %ebx
mov $WRITE, %eax
int $0x80

#wczytanie danych z klawiatury 
mov $READ, %eax
mov $STDIN, %edi
mov $textin, %ecx
mov $textin_len, %edx
int $0x80

# konwersja danych 
mov $0, %edx
mov textin, %edx
mov $0, %dh
sub $48, %edx
push %edx

#wyświetlenie linijki
movl $0, %edi
loop_start:
pop %edx
cmpl %edx, %edi
je loop_end
inc %edi
push %edx
mov $star, %ecx
mov $star_len, %edx
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



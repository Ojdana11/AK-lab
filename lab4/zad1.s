
WRITE =4
READ =3

STDIN =0
STDOUT =1

RETURN =0
EXIT =1

.data

upper: .space 4
lower: .space 4
number: .float 

prompt_one: .ascii "Podaj gorna granice:\n"
prompt_one_len = . - prompt_one
prompt_two: .ascii "4"
prompt_two_len = . - prompt_two

new_line: .ascii "\n"
new_line_len = . - new_line


.global _start

_start:
push $prompt_one
call printf
#podaj gorna granice
#mov $prompt_one, %ecx
#mov $prompt_one_len, %edx
#mov $STDOUT, %ebx
#mov $WRITE, %eax
#int $0x80

#pobranei gornej granicy
#mov $upper, %ecx
#mov $4, %edx
#mov $STDIN, %ebx
#mov $READ, %eax
#int $0x80

#podaj dolna granice
mov $prompt_two, %ecx
mov $prompt_two_len, %edx
mov $STDOUT, %ebx
mov $WRITE, %eax
int $0x80

#pobranie dolnej granicy
#mov $lower, %ecx
#mov $4, %edx
#mov $STDIN, %ebx
#mov $READ, %eax
#int $0x80

push $upper
call count_cos
pop %eax

push $lower
call count_cos

push %ebx

sub %eax, %ebx

mov $RETURN, %ebx
mov $EXIT, %eax
int $0x80


.type count_cos, @function
count_cos:
push %ebp
mov %esp, %ebp
mov 8(%ebp), %ebx

mov %ebx, number

finit
fld number
fcos

fst number
mov $4, %eax
mov %ebp, %esp
pop %ebp
ret

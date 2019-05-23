.include "stdio.s"
.bss 
numberOne: .space 4
numberTwo: .space 4

.data 
promptOne: .ascii "Podaj pierwsza liczbe: \n\0"
promptTwo: .ascii "Podaj druga liczbe: \n\0"
promptTwo_len = . - promptTwo

.global _start
_start:

push $promptOne
push $promptOne_len
call printf
add  $8, %esp

push $numberOne
push $4
call scanf
add  $8, %esp

push $promptTwo
push $promptTwo_len
call printf
add  $8, %esp

push $numberTwo
push $4
call scanf
add  $8, %esp

mov $0, %ebx
mov $1, %eax
int $0x80



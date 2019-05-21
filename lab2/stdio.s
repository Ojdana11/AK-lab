.type printf, @function
printf:
push %ebp
mov %esp, %ebp

#"Wypisanie tekstu"
mov 8(%ebp), %edx
mov 12(%ebp), %ecx
mov $4, %eax
mov $1, %ebx
int $0x80

mov %ebp, %esp
pop %ebp
ret

.type scanf, @function
scanf:
push %ebp
mov %esp, %ebp

#"Pobranie tekstu"
mov 8(%ebp), %edx
mov 12(%ebp), %ecx
mov $3, %eax
mov $0, %ebx
int $0x80

mov %ebp, %esp
pop %ebp
ret

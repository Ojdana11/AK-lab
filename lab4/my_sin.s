.data 
number: .float 

.type my_sin, @function
my_sin:
push %ebp
mov %esp, %ebp
mov 8(%ebp), %ebx

mov %ebx, number

finit
fld number
fsin

fst number
mov $4, %eax
mov %ebp, %esp
pop %ebp
ret




.data 
number: .float 

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




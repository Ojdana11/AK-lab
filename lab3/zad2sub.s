
SYSEXIT = 1
EXIT_SUCCESS = 0

.data

liczba1: .byte 0b01000010, 0b01100000,0b00000000, 0b00000000
liczba2: .byte 0b11000010, 0b01100000,0b00000000, 0b00000000

.global _start
_start:

mov $1, %esi
mov $0, %edi

#zapis wykładnika do rejestru
movb liczba1(%esi,%edi,4), %bh
add $0b10000001, %bh

movb liczba2(%esi,%edi,4), %bl
add $0b10000001, %bl


#przesunięcie mantysy 
mov liczba1, %ecx
and $0b00000000011111111111111111111111, %ecx
add $0b00000000100000000000000000000000, %ecx
shl %ecx, %bh

pop %ecx

mov liczba2, %ecx
and $0b00000000011111111111111111111111, %ecx
add $0b00000000100000000000000000000000, %ecx
shl %ecx, %bh

pop %ecx

#wykonanie operacji
push %eax
push %ebx
mov %ebx, %edx
mul %eax
jmp end

#zapis znaku do rejestru
mov $0, %esi
mov $0, %edi

movb liczba1(%esi,%edi,4), %ah
and $0b10000000, %ah

movb liczba2(%esi,%edi,4), %al
and $0b10000000, %al

#sprawdzenie znaku
cmp %ah, %al
je same_sign_add

cmp %ah, %al
jg add_minus:

same_sign_add:
#znak pobierany z większej liczby

end:
mov $SYSEXIT, %eax
mov $EXIT_SUCCESS, %ebx
int $0x80

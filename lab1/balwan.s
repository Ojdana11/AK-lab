EXIT =1
WRITE =4
STDOUT =1
STDIN =0
RETURN =0

.section .data

star: .ascii "*"
space: .ascii " "
space_len = . - space
star_len = . - star
size_small: .long 3
size_big: .long 5
new_line: .ascii "\n"
new_line_len = . -new_line

.global _start
_start:

mov $1, %edi

print_small_ball:
cmp size_small, %edi
jg print_small_ball_end
push %edi
push %edi
call print_line
add $8, %esp
mov %eax, %edi
inc %edi
inc %edi
jmp print_small_ball

print_small_ball_end:
mov $1, %edi

print_big_ball:
cmp size_big, %edi
jg print_big_ball_end
push %edi
push %edi
call print_line
add $8, %esp
mov %eax, %edi
inc %edi
inc %edi
jmp print_big_ball

print_big_ball_end:
push $1
call print_line
add $8, %esp
mov $RETURN, %ebx
mov $EXIT, %eax
int $0x80

.type print_line, @function
print_line:

push %ebp
mov %esp, %ebp
mov $0, %edi
mov $star_len, %edx

loop_start:
cmp %edi, 8(%ebp)
je loop_end
inc %edi
mov $star, %ecx
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

mov 12(%ebp), %eax
mov %ebp, %esp
pop %ebp
ret





























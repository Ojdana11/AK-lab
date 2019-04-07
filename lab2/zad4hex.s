EXIT =1
WRITE =4
READ =3
STDIN =0
STDOUT =1
RETURN =0
BUFF_SIZE =100

.bss
numberOnein: .space 100
numberOneHex: .space 100
numberTwoHex: .space 100
numberTwoin: .space 100


.data 
promptFirst: .ascii "Podaj pierwsza liczbe\n"
promptFirst_len = . - promptFirst
promptSecond: .ascii "Podaj druga liczbe\n"
promptSecond_len = . - promptSecond
wrong_format_text: .ascii "Niepoprawny format danych\n"
wrong_format_text_len = . - wrong_format_text
sumup: .ascii "Podane liczby to: "
sumup_len = . - sumup



.global _start
_start:

#"Podaj pierwsza liczbe"
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


mov $0, %eax
mov $0, %ebx

#Sprawdzenie formatu pierwszej liczby
mov $0, %edi
check_no_one_start:
cmp $BUFF_SIZE, %edi
je end_checking_no_one

mov numberOnein(, %edi,1), %bl
inc %edi
#znak nowej linii wczytany do bufora = 0x0a czyli 10 w dec
cmp $10, %bl
je end_checking_no_one

cmp $48, %bl
jl wrong_format
cmp $70, %bl
jg wrong_format
cmp $57, %bl
jg check_if_letter_one
jmp check_no_one_start

check_if_letter_one:
cmp $65, %bl
jl wrong_format
jmp check_no_one_start

end_checking_no_one:

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

#Sprawdzenie formatu drugiej liczby
mov $0, %edi

check_no_two_start:
cmp $BUFF_SIZE, %edi
je end_checking_no_two

mov numberTwoin(, %edi,1), %bl
inc %edi
#znak nowej linii wczytany do bufora = 0x0a czyli 10 w dec
cmp $10, %bl
je end_checking_no_two

cmp $48, %bl
jl wrong_format
cmp $70, %bl
jg wrong_format
cmp $57, %bl
jg check_if_letter_two
jmp check_no_two_start

check_if_letter_two:
cmp $65, %bl
jl wrong_format
jmp check_no_two_start

end_checking_no_two:

#"Podane liczby to: "
mov $sumup_len, %edx
mov $sumup, %ecx
mov $WRITE, %eax
mov $STDOUT, %ebx
int $0x80

#"wypisanie pierwszej liczby "
mov $BUFF_SIZE, %edx
mov $numberOnein, %ecx
mov $WRITE, %eax
mov $STDOUT, %ebx
int $0x80

#"wypisanie drugiej liczby "
mov $BUFF_SIZE, %edx
mov $numberTwoin, %ecx
mov $WRITE, %eax
mov $STDOUT, %ebx
int $0x80

jmp program_end
# Wrong format
wrong_format:
mov $0, %ecx
mov $0, %edx
mov $wrong_format_text_len, %edx
mov $wrong_format_text, %ecx
mov $WRITE, %eax
mov $STDOUT, %ebx
int $0x80

program_end:
mov $RETURN, %ebx
mov $EXIT, %eax
int $0x80








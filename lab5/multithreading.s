
.data

napisGlowny: .ascii "Funkcja glowna\n"
napisGlowny_len = . - napisGlowny
napisWatek: .ascii "Watek!\n"
napisWatek_len = . - napisWatek
id_watku: .double 1
dodatkowe_dane: .double 1
atrybuty: .double 1

.global main
main:

mov $4, %eax
mov $1, %ebx
mov $napisGlowny, %ecx
mov $napisGlowny_len, %edx
int $0x80

push dodatkowe_dane
push watek
push atrybuty
push id_watku
call pthread_create

.global watek
.type watek, @function
watek: 
mov $4, %eax
mov $1, %ebx
mov $napisWatek, %ecx
mov $napisWatek_len, %edx
int $0x80
push $0
call pthread_exit

push $0
call pthread_exit



SECTION .data
    message1: db "Podaj pierwsza liczbe: ", 0
    message2: db "Podaj druga liczbe: ", 0
    formatin: db "%d", 0
    formatout: db "%d", 10, 0 ; newline, nul terminator
    integer1: times 4 db 0 ; 32-bits integer = 4 bytes
    integer2: times 4 db 0 ;
SECTION .text
   global main 
   extern scanf 
   extern printf     

main:

   push ebx
   push ecx
   push message1
   call printf

   add esp, 4 ; sciaganie argumentow funkcji printf ze stosu
   push integer1  
   push formatin
   call scanf

   add esp, 8 ; sciaganie argumentow funkcji scanf ze stosu
   push message2
   call printf

   add esp, 4	; sciaganie argumentow funkcji printf ze stosu
   push integer2 
   push formatin 
   call scanf

   add esp, 8 ; sciaganie argumentow funkcji scanf ze stosu

   mov ebx, dword [integer1]
   mov ecx, dword [integer2]

   push ebx
   mov ebx, ecx
   push formatout
   call printf            ; wyswietlanie pierwszej podanej liczby
   add esp, 8      
   push ebx
   push formatout
   call printf              ; wyswietlanie drugiej podanej liczby
   add esp, 8                 
   pop ecx
   pop ebx ; odzyskiwanie wartości rejestrów
   mov eax, 0 ; poprawne wyjscie z programu
   ret

#include <stdio.h>
#include <stdlib.h>

int main(){
int i;
//tworzenie procesów
    for(i=0; i < 5; i++){
        if(fork() == 0) {
	    printf("Utworzono proces\n");
            exit(i+1);
        }
    }

//czekanie na zakonczenie procesu
    for (i=0;i<5;i++) {
        int status;
        int pid = wait(&status);
    }
    
    return 0;
}

#include <stdio.h>

int main(int argc, char** argv){
    int a, b;
    int res;

    scanf("%d%d", &a, &b);

    /*
    res = a+b;
    */

    __asm__(
        "mov %0, %1 \n\t"   /* Smestamo vrednost prvog operanda u 
                            adredisni registar. */
        "add %0, %2 \n\t"   /* Dodajemo na odredisni registar
                            drugi operand. */
        : "=m" (res)       /* Specificiramo da se sa odredisnim
                            operandom radi direktno u memoriji. */
        : "r" (a), "r" (b)  /* Alociramo dva nova registra za
                            ulazne podatke. */
    );

    printf("%d\n", res);
   
    return 0;
}
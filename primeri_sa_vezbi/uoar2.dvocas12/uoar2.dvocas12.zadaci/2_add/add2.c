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
        : "=&r" (res)       /* Alociramo registar opste
                            namene za rezultat. Ovaj registar
                            ce biti razlicit od svih ulaznih
                            registara. To se specificira 
                            znakom &. */
        : "r" (a), "r" (b)  /* Alociramo dva nova registra za
                            ulazne podatke. */
    );

    printf("%d\n", res);
   
    return 0;
}
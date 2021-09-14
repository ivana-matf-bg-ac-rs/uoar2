#include <stdio.h>

int main(int argc, char** argv){
    int a, b;
    int res;

    scanf("%d%d", &a, &b);

    /*
    res = a+b;
    */

    __asm__(
        "add %0, %2 \n\t"   /* Instrukcija dodaje vrednost 
                            b na vrednost a. */
        : "=r" (res)        /* Alociramo registar opste
                            namene za rezultat. */
        : "0" (a), "r" (b)  /* Alociramo isti registar od malopre
                            za ulaznu vrednost a. Alociramo jos
                            jedan registar za vrednost b. */
    );

    printf("%d\n", res);
   
    return 0;
}
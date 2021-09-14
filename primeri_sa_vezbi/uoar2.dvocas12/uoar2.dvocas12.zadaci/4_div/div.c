#include <stdio.h>

int main(int argc, char** argv){
    int a, b;
    int kol, ost;

    scanf("%d%d", &a, &b);

    /*
    kol = (int) a/b;
    ost = a%b;
    */

    __asm__(
        "cdq \n\t"                  /* Prosirujemo eax na edx:eax */
        "idiv %3 \n\t"              /* Delimo. */
        : "=a" (kol), "=d" (ost)    /* Alociramo eax za kolicnik 
                                    i edx za ostatak. */
        : "a" (a), "b" (b)          /* Alociramo ebx za deljenik i 
                                    eax za delilac. */
    );

    printf("%d = %d * %d + %d\n", a, b, kol, ost);
   
    return 0;
}
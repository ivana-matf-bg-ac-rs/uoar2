#include <stdio.h>

unsigned suma_parnih(unsigned a);

int
main(){
    unsigned a;

    scanf("%u", &a);

    printf("%u\n", suma_parnih(a));

    return 0;
}
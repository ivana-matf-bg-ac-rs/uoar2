#include <stdio.h>

unsigned suma_cifara(unsigned a);

int
main(){
    unsigned a;

    scanf("%u", &a);

    printf("%u\n", suma_cifara(a));

    return 0;
}
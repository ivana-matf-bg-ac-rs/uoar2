#include <stdio.h>

unsigned ojler(unsigned a);

int
main(){
    unsigned a;

    scanf("%u", &a);

    printf("%u\n", ojler(a));

    return 0;
}
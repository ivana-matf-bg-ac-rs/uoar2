#include <stdio.h>

unsigned nzd(unsigned a, unsigned b);

int
main(){
    unsigned a, b;

    scanf("%u%u", &a, &b);

    printf("%u\n", nzd(a, b));

    return 0;
}
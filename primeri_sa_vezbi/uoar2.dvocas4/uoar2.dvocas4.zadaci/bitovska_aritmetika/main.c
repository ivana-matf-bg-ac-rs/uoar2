#include <stdio.h>

void bitovska_aritmetika(unsigned a, unsigned b, unsigned* c, unsigned* d, unsigned* e, unsigned* f);

int
main(){
    unsigned a, b, c, d, e, f;

    scanf("%u%u", &a, &b);

    bitovska_aritmetika(a, b, &c, &d, &e, &f);

    printf("%u, %u, %u, %u\n", c, d, e, f);

    return 0;
}
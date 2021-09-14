#include <stdio.h>

void kolicnik(unsigned, unsigned, unsigned*, unsigned*);

int
main(){
    unsigned a, b, c, d;

    scanf("%u%u", &a, &b);

    kolicnik(a, b, &c, &d);

    printf("%u, %u\n", c, d);

    return 0;
}
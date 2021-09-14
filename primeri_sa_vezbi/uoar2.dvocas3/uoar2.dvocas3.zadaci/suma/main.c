#include <stdio.h>

unsigned suma(unsigned a);

int
main(){
    unsigned a;

    scanf("%u", &a);

    printf("%u\n", suma(a));

    return 0;
}
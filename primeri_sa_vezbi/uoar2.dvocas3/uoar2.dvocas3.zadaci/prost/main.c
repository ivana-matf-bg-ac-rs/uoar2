#include <stdio.h>

unsigned prost(unsigned a);

int
main(){
    unsigned a;

    scanf("%u", &a);

    printf("%u\n", prost(a));

    return 0;
}
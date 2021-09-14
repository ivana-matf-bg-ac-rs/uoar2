#include <stdio.h>

unsigned prestupna(unsigned a);

int
main(){
    unsigned a;

    scanf("%u", &a);

    printf("%u\n", prestupna(a));

    return 0;
}
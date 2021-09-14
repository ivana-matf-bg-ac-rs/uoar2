#include <stdio.h>

unsigned negacija(unsigned a);

int
main(){
    unsigned a;

    scanf("%u", &a);

    printf("%u\n", negacija(a));

    return 0;
}
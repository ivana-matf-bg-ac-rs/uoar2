#include <stdio.h>

unsigned broj_jedinica(unsigned a);

int
main(){
    unsigned a;

    scanf("%u", &a);

    printf("%u\n", broj_jedinica(a));

    return 0;
}
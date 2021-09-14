#include <stdio.h>

int savrsen_stepen(unsigned n, unsigned* m, unsigned* k);

int main(){
    unsigned n, m, k;

    scanf("%d", &n);

    if (savrsen_stepen(n, &m, &k)==0){
        printf("Nije savrsen\n");
    }else{
        printf("%u = %u^%u\n", n, m, k);
    }

    return 0;
}
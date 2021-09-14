#include <stdio.h>
#include <stdlib.h>

void izbaci_neparne(long* niz, unsigned* duzina);

int main(){
    long *niz;
    unsigned n;
    unsigned i;

    scanf("%u", &n);

    if ((niz = malloc(n*sizeof(long))) == NULL){
        printf("Greska u alokaciji memorije.\n");
        exit(1);
    }

    for (i=0; i<n; i++) 
        scanf("%ld", &niz[i]);

    izbaci_neparne(niz, &n);

    for (i=0; i<n; i++)
        printf("%ld ", niz[i]);
    printf("\n");

    return 0;
}
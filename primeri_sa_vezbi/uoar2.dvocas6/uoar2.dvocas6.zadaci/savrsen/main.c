#include <stdio.h>
#include <stdlib.h>

void niz_savrsenih(int*, int);

int main(){
    int n, *niz, i;

    scanf("%d", &n);

    if ((niz = malloc(sizeof(int)*n)) == NULL){
        printf("Greska prilikom alokacije memorije.\n");
        exit(1);
    }

    niz_savrsenih(niz, n);

    for(i=0; i<n; i++)
        printf("%d ", niz[i]);
    printf("\n");

    exit(0);
}
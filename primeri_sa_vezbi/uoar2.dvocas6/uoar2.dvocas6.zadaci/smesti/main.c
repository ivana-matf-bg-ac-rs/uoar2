#include <stdio.h>
#include <stdlib.h>

void smesti(int*, int, int*, int*);

int main(){
    int nx, *X, *Y, ny, i;

    scanf("%d", &nx);

    if ((X = malloc(sizeof(int)*nx)) == NULL){
        printf("Greska prilikom alokacije memorije.\n");
        exit(1);
    }

    if ((Y = malloc(sizeof(int)*nx)) == NULL){
        printf("Greska prilikom alokacije memorije.\n");
        exit(1);
    }

    for (i=0; i<nx; i++)
        scanf("%d", &X[i]);

    smesti(X, nx, Y, &ny);

    for(i=0; i<ny; i++)
        printf("%d ", Y[i]);
    printf("\n");

    exit(0);
}
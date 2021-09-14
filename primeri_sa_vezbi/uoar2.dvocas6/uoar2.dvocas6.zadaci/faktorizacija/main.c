#include <stdio.h>
#include <stdlib.h>

int faktorizacija(int, int*, int*);

int main(){
    int n, *A, *B, i, nn;

    scanf("%d", &n);

    if ((A = malloc(sizeof(int)*n)) == NULL){
        printf("Greska prilikom alokacije memorije.\n");
        exit(1);
    }

    if ((B = malloc(sizeof(int)*n)) == NULL){
        printf("Greska prilikom alokacije memorije.\n");
        exit(1);
    }

    nn = faktorizacija(n, A, B);

    for(i=0; i<nn; i++)
        printf("%d^%d\n ", A[i], B[i]);
    printf("\n");

    exit(0);
}
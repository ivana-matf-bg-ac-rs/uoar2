#include <stdio.h>
#include <stdlib.h>

int izdvoji_proste(int*, int, int*);

int main(){
    int na, nb;
    int *a, *b;
    int i;

    scanf("%d", &na);

    if ((a = malloc(sizeof(int)*na)) == NULL){
        printf("Greska pri alociranju memorije.\n");
        exit(1);
    }

    for(i=0; i<na; i++)
        scanf("%d", &a[i]);

    if ((b = malloc(sizeof(int)*na)) == NULL){
        printf("Greska pri alociranju memorije.\n");
        exit(1);
    }

    nb = izdvoji_proste(a, na, b);

    for(i=0; i<nb; i++)
        printf("%d ", b[i]);
    printf("\n");

    free(a);
    free(b);

    return 0;
}
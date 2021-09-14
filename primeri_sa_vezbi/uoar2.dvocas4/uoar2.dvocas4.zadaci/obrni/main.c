#include <stdio.h>
#include <stdlib.h>

void obrni(int*, int);

int main(){
    int n, *a;
    int i;

    scanf("%d", &n);

    if ((a = malloc(sizeof(int)*n)) == NULL){
        printf("Greska pri alociranju memorije.\n");
        exit(1);
    }

    for(i=0; i<n; i++)
        scanf("%d", &a[i]);

    obrni(a, n);

    for(i=0; i<n; i++)
        printf("%d ", a[i]);

    free(a);

    return 0;
}
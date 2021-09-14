#include <stdio.h>
#include <stdlib.h>

int suma_niza(int*, int);

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

    printf("%d\n", suma_niza(a, n));

    free(a);

    return 0;
}
#include <stdio.h>
#include <stdlib.h>

int najveci(int*, int);

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

    printf("%d\n", najveci(a, n));

    free(a);

    return 0;
}
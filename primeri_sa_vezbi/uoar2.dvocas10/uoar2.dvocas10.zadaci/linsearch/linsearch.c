#include <stdio.h>
#include <stdlib.h>

int linsearch(int *a, int n, int x);

int main(){
    int *a;
    int n, i, x;

    scanf("%d", &n);

    if ((a = malloc(sizeof(int) * n)) == NULL){
        printf("Greska u alokaciji memorije\n");
        exit(EXIT_FAILURE);
    }

    for(i=0; i<n; i++)
        scanf("%d", &a[i]);

    scanf("%d", &x);

    printf("%d\n", linsearch(a, n, x));

    exit(EXIT_SUCCESS);
}
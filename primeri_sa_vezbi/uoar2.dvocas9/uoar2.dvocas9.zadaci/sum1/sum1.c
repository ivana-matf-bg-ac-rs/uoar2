#include <stdio.h>
#include <stdlib.h>

int sum1(int *a, int n);

int main(){
    int *a;
    int n, i;

    scanf("%d", &n);

    if ((a = malloc(sizeof(int) * n)) == NULL){
        printf("Greska u alokaciji memorije\n");
        exit(EXIT_FAILURE);
    }

    for(i=0; i<n; i++)
        scanf("%d", &a[i]);

    printf("%d\n", sum1(a, n));

    exit(EXIT_SUCCESS);
}
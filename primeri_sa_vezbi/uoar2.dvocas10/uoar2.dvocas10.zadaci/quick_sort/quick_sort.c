#include <stdio.h>
#include <stdlib.h>

void quick_sort(int *a, int l, int r);

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

    quick_sort(a, 0, n-1);

    for(i=0; i<n; i++)
        printf("%d ", a[i]);
    printf("\n");

    exit(EXIT_SUCCESS);
}
#include <stdio.h>
#include <stdlib.h>

int binsearch(int *a, int n, int x);

void quick_sort(int *a, int l, int r);

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

    quick_sort(a, 0, n-1);

    for(i=0; i<n; i++)
        printf("%d ", a[i]);
    printf("\n");


    printf("%d\n", binsearch(a, n, x));

    exit(EXIT_SUCCESS);
}
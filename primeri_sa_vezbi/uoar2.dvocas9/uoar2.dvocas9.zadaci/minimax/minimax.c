#include <stdio.h>
#include <stdlib.h>

void minimax(int *a, int n, int *min, int *max);

int main(){
    int *a;
    int n, i;
    int min, max;

    scanf("%d", &n);

    if ((a = malloc(sizeof(int) * n)) == NULL){
        printf("Greska u alokaciji memorije\n");
        exit(EXIT_FAILURE);
    }

    for(i=0; i<n; i++)
        scanf("%d", &a[i]);

    minimax(a, n, &min, &max);

    printf("%d %d\n", min, max);

    exit(EXIT_SUCCESS);
}
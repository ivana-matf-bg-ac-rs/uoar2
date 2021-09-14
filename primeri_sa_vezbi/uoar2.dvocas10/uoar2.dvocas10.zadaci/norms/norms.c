#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

void norms(int **a, int m, int n, int *h, int *v);

int main(){
    int **a;
    int n, m;
    int i, j;
    int h, v;

    scanf("%d%d", &m, &n);

    assert(m > 0);
    assert(n > 0);

    assert((a = malloc(sizeof(int *) * m)) != NULL);
    for (i=0; i<m; i++)
        assert((a[i] = malloc(sizeof(int) * n)) != NULL);

    for (i=0; i<m; i++)
        for (j=0; j<n; j++)
            scanf("%d", &a[i][j]);

    norms(a, m, n, &h, &v);

    printf("%d %d\n", h, v);

    for (i=0; i<m; i++)
        free(a[i]);
    free(a);

    return 0;
}
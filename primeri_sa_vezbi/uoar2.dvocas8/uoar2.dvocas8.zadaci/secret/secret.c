#include <stdio.h>

int secret(int n);

int main(){
    int n;

    scanf("%d", &n);

    printf("%d\n", secret(n));

    return 0;
}
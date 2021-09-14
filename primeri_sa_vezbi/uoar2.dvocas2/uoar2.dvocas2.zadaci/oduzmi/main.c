#include <stdio.h>

int oduzmi(int a, int b);

int
main(){
    int a, b;

    scanf("%d%d", &a, &b);

    printf("%d\n", oduzmi(a, b));

    return 0;
}
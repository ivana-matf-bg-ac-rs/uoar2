#include <stdio.h>

int saberi(int a, int b);

int
main(){
    int a, b;

    scanf("%d%d", &a, &b);

    printf("%d\n", saberi(a, b));

    return 0;
}
#include <stdio.h>

int add1(int x, int y);

int main(){
    int x, y;

    scanf("%d%d", &x, &y);

    printf("%d\n", add1(x, y));

    return 0;
}
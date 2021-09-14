#include <stdio.h>

int max1(int x, int y);

int main(){
    int x, y;

    scanf("%d%d", &x, &y);

    printf("%d\n", max1(x, y));

    return 0;
}
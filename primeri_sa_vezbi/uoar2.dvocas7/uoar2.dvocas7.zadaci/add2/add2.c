#include <stdio.h>

int add2(int x, int y);

int main(){
    int x, y;

    scanf("%d%d", &x, &y);

    printf("%d\n", add2(x, y));

    return 0;
}
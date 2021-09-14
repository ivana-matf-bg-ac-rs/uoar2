#include <stdio.h>

int max2(int x, int y);

int main(){
    int x, y;

    scanf("%d%d", &x, &y);

    printf("%d\n", max2(x, y));

    return 0;
}
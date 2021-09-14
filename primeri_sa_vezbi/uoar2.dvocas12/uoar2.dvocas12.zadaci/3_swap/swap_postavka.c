#include <stdio.h>

int main(int argc, char** argv){
    int x, y;

    scanf("%d%d", &x, &y);

    printf("x=%d, y=%d\n", x, y);

    int tmp = x;
    x = y;
    y = tmp;

    printf("x=%d, y=%d\n", x, y);
   
    return 0;
}
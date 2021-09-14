#include <stdio.h>

int main(int argc, char** argv){
    int x, y;

    scanf("%d%d", &x, &y);

    printf("x=%d, y=%d\n", x, y);

    /*
    int tmp = x;
    x = y;
    y = tmp;
    */

    __asm__ (
        "mov %0, %3 \n\t"
        "mov %1, %2 \n\t"
        : "=r" (x), "=r" (y)
        : "r" (x), "r" (y)
    );

    printf("x=%d, y=%d\n", x, y);
   
    return 0;
}
#include <stdio.h>

/*
#define mul_by_3(x, y) (y = 3*(x))
#define mul_by_5(x, y) (y = 5*(x))
#define mul_by_9(x, y) (y = 9*(x))
*/

#define mul_by_3(x, y) \
__asm__(\
    "lea %0, [%0 + 2*%0]\n\t" \
    : "=r" (y) \
    : "0" (x) \
);

#define mul_by_5(x, y) \
__asm__(\
    "lea %0, [%0 + 4*%0]\n\t" \
    : "=r" (y) \
    : "0" (x) \
);

#define mul_by_9(x, y) \
__asm__(\
    "lea %0, [%0 + 8*%0]\n\t" \
    : "=r" (y) \
    : "0" (x) \
);

int main(int argc, char **argv){
    int a, a_3, a_5, a_9;

    scanf("%d", &a);

    mul_by_3(a, a_3);
    mul_by_5(a, a_5);
    mul_by_9(a, a_9);

    printf("%d\n", a_3);
    printf("%d\n", a_5);
    printf("%d\n", a_9);

    return 0;
}
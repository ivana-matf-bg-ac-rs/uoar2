#include <stdio.h>

int main(int argc, char** argv){
    int a, b;
    int kol, ost;

    scanf("%d%d", &a, &b);

    kol = (int) a/b;
    ost = a%b;

    printf("%d = %d * %d + %d\n", a, b, kol, ost);
   
    return 0;
}
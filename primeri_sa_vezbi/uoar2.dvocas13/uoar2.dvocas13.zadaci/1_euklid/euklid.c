#include <stdio.h>

int nzd(int n, int m);

int main(){
    int n, m;

    scanf("%d%d", &n, &m);

    printf("NZD(%d, %d) = %d\n", n, m, nzd(n, m));

    return 0;
}

int nzd(int n, int m){
    /*
    while(m != 0){
        int tmp = n%m;
        n = m;
        m = tmp;
    }

    return n;
    */

    __asm__(
        "petlja: \n\t"
        "cmp %[m], 0 \n\t"
        "je kraj_petlje \n\t"
        "cdq \n\t"
        "idiv %[m] \n\t"
        "mov %[n], %[m] \n\t"
        "mov %[m], edx \n\t"
        "jmp petlja \n\t"
        "kraj_petlje:"
        : "=a" (n), "=c" (m)
        : [n] "0" (n), [m] "1" (m)
        : "edx"
    );
}
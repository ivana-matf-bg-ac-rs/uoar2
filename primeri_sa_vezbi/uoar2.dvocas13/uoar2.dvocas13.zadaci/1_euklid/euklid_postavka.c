#include <stdio.h>

int nzd(int n, int m);

int main(){
    int n, m;

    scanf("%d%d", &n, &m);

    printf("NZD(%d, %d) = %d\n", n, m, nzd(n, m));

    return 0;
}

int nzd(int n, int m){
    while(m != 0){
        int tmp = n%m;
        n = m;
        m = tmp;
    }

    return n;
}
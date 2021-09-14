#include <stdio.h>

#define MAX 1024

int palindrom(char *s);

int main(){
    char s[MAX];

    scanf("%s", s);

    printf("%d\n", palindrom(s));

    return 0;
}
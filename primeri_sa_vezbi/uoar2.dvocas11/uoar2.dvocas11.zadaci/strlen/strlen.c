#include <stdio.h>

#define MAX 1024

int arm_strlen(char *s);

int main(){
    char s[MAX];

    scanf("%s", s);

    printf("%d\n", arm_strlen(s));

    return 0;
}
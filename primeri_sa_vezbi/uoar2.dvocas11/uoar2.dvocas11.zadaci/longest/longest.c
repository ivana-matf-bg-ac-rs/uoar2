#include <stdio.h>

#define MAX 1024

int longest(char *s, int *start, int *length);

int main(){
    char s[MAX];
    int start, length;

    scanf("%s", s);

    longest(s, &start, &length);

    printf("%d %d\n", start, length);


    return 0;
}
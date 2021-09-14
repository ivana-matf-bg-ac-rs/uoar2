#include <stdio.h>
#include <assert.h>
#include <string.h>

#define MAX 1024

void most_frequent(char *s, char *c, int *f);

int main(){
    char s[MAX];
    char c;
    int f;
    char *nl;

    assert(fgets(s, MAX, stdin) != NULL);

    if ((nl = strchr(s, '\n')) != NULL)
        *nl = '\0';

    most_frequent(s, &c, &f);

    printf("%c %d\n", c, f);

    return 0;
}
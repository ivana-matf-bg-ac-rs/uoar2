#include <stdio.h>

int main(int argc, char **argv){
    char msg[100];
    int len;

    scanf("%s", msg);

    len = 0;
    while(msg[len] != 0)
        len++;
    
    printf("%d\n", len);

    return 0;
}
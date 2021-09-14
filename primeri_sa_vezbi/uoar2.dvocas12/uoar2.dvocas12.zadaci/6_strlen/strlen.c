#include <stdio.h>

int main(int argc, char **argv){
    char msg[100];
    int len;

    scanf("%s", msg);

    /*
    len = 0;
    while(msg[len] != 0)
        len++;
    */

    __asm__(
        "mov rax, 0 \n\t"
        "petlja: \n\t"
        "mov dl, [%[msg] + rax]\n\t"
        "cmp dl, 0 \n\t"
        "je kraj \n\t"
        "inc rax \n\t"
        "jmp petlja \n\t"
        "kraj: \n\t"
        : [len] "=a" (len)
        : [msg] "c" (msg)
    );

    printf("%d\n", len);

    return 0;
}
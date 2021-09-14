#include <stdio.h>

int main(int argc, char** argv){

    /*
    printf(msg);
    */

    __asm__(
        "mov rdi, %[msg] \n\t"
        "call printf \n\t"
        :
        : [msg] "r" ("Hello world!\n")
    );
   
    return 0;
}
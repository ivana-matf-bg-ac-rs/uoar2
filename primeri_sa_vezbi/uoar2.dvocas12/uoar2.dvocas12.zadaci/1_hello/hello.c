#include <stdio.h>

const char msg[] = "Hello world!\n";

int main(int argc, char** argv){

    /*
    printf(msg);
    */

    __asm__(
        "lea rdi, msg \n\t"
        "call printf \n\t"
    );
   
    return 0;
}
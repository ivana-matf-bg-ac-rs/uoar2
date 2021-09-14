#include <stdio.h>
#include <stdlib.h>
#include <math.h>  

typedef struct
{ 
    int x, y; 
}Tacka; 
  
/**
 * Funkcija racuna orijentaciju uredjene troje (a, b, c)
 * vraca:
 *    *  0 ukoliko su tacke kolinearne
 *    *  1 ukoliko su tacke pozitivno orijentisane
 *    * -1 ukoliko su tacke negativno orijentisane
*/
int orijentacija(Tacka *pa, Tacka *pb, Tacka *pc) 
{ 
    /**
     * int val = (pb->x - pa->x) * (pc->y - pa->y)-(pc->x - pa->x)*(pb->y - pa->y); 
    */ 

    int val;
    __asm__ (
        "mov eax, [%[pc]] \n\t" 
        "sub eax, [%[pa]] \n\t"         // eax = (pc->x - pa->x)
        "mov ecx, [%[pb] + 4] \n\t"
        "sub ecx, [%[pa] + 4] \n\t"     // ecx = (pb->y - pa->y)
        "imul ecx \n\t"                  // eax = eax*acx
        "mov r8d, eax \n\t"
        "mov eax, [%[pb]] \n\t"
        "sub eax, [%[pa]] \n\t"         // eax = (pb->x - pa->x)
        "mov ecx, [%[pc] + 4] \n\t"
        "sub ecx, [%[pa] + 4] \n\t"     // ecx = (pc->y - pa->y)
        "imul ecx \n\t"                  // eax = eax*ecx
        "sub eax, r8d"
        : "=&a" (val)
        : [pa] "r" (pa), [pb] "r" (pb), [pc] "r" (pc)
        : "rdx", "r8", "ecx"
    );

    /**
     * if (val == 0) return 0;
     * else if(val < 0) return -1;
     * else return 1; 
    */
    __asm__ (
        "cmp %0, 0 \n\t"
        "je nula \n\t"
        "jl manje \n\t"
        "mov eax, 1 \n\t"
        "jmp kraj \n\t"
        "nula:\n\t"
        "mov eax, 0 \n\t"
        "jmp kraj \n\t"
        "manje: \n\t"
        "mov eax, -1 \n\t"
        "kraj:"
        :
        : "r" (val)
    );

} 

int  main()
{
    Tacka a, b, c;
    printf("Unesite koordinate 3 tacke: ");
    scanf("%d%d", &a.x, &a.y);
    scanf("%d%d", &b.x, &b.y);
    scanf("%d%d", &c.x, &c.y);
    printf("Orijentacija: %d", orijentacija(&a, &b, &c));

    return 0;
}

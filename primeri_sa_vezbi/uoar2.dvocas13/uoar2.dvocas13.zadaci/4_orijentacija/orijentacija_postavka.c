#include <stdio.h>
#include <stdlib.h>
#include <math.h>  

typedef struct
{ 
    int x, y; 
}Tacka; 
  
/**
 * Funkcija racuna orijentaciju uredjene trojke (a, b, c)
 * vraca:
 *    *  0 ukoliko su tacke kolinearne
 *    *  1 ukoliko su tacke pozitivno orijentisane
 *    * -1 ukoliko su tacke negativno orijentisane
*/
int orijentacija(Tacka *pa, Tacka *pb, Tacka *pc) 
{ 
   int val = (pb->x - pa->x) * (pc->y - pa->y)-(pc->x - pa->x)*(pb->y - pa->y); 
   
   if (val == 0) return 0;
   else if(val < 0) return -1;
   else return 1; 
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

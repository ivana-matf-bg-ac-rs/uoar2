#include <stdio.h>
#include <stdlib.h>

void greska(const char *msg);

void sort(int *a, int n);

void merge_sort(int *a, int *buff, int l, int d);

int main(){
    int n, *a;

    printf("Unesite velicinu niza: ");
    scanf("%d", &n);

    if (n <= 0)
        greska("Velicina niza mora biti pozitivan broj");

    if ((a = malloc(n * sizeof(int))) == NULL)
        greska("Neuspela alokacija memorije!");

    printf("Unesite elemente niza:\n");
    for(int i=0; i<n; i++)
        scanf("%d", &a[i]);

    sort(a, n);

    printf("Sortiran niz:\n");
    for(int i=0; i<n; i++)
        printf("%d ", a[i]);
    printf("\n");

    return 0;
}

void greska(const char *msg){
    fprintf(stderr, "Greska: %s", msg);
    exit(EXIT_FAILURE);
}

void sort(int *a, int n){
    int *buff;

    if ((buff = malloc(n*sizeof(int))) == NULL)
        greska("Neuspela alokacija memorije!");

    merge_sort(a, buff, 0, n-1);

    free(buff);
}

void merge_sort(int *a, int *buff, int l, int d){
    if (l >= d)
        return;

    int s = (l + d) / 2;
    merge_sort(a, buff, l, s);
    merge_sort(a, buff, s+1, d);

    int levo_i = l;
    int desno_i = s+1;
    int i = l;

    while(levo_i <= s && desno_i <= d){
        if(a[levo_i] < a[desno_i]){
            buff[i] = a[levo_i];
            levo_i++;
            i++;
        }else{
            buff[i] = a[desno_i];
            desno_i++;
            i++;
        }
    }

    while(levo_i <= s){
        buff[i] = a[levo_i];
        levo_i++;
        i++;
    }

    while(desno_i <= d){
        buff[i] = a[desno_i];
        desno_i++;
        i++;
    }

    for(int i=l; i<=d; i++)
        a[i] = buff[i];
}


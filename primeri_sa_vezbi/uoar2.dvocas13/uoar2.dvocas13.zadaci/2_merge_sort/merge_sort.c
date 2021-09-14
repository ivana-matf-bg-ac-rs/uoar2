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

    /*
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
    */
    __asm__(
        "glavna_petlja: \n\t"
        "cmp %[levo_i], %[s] \n\t"
        "jg kraj_glavne_petlje \n\t"
        "cmp %[desno_i], %[d] \n\t"
        "jg kraj_glavne_petlje \n\t"

            "mov r8d, [%[a] + 4*%[levo_i]] \n\t"
            "mov r9d, [%[a] + 4*%[desno_i]] \n\t"
            "cmp r8d, r9d \n\t"
            "jge levi_veci \n\t"
                "mov [%[buff] + 4*%[i]], r8d \n\t"
                "add %[levo_i], 1 \n\t"
                "add %[i], 1 \n\t"
                "jmp glavna_petlja \n\t"
            "levi_veci: \n\t"
                "mov [%[buff] + 4*%[i]], r9d \n\t"
                "add %[desno_i], 1 \n\t"
                "add %[i], 1 \n\t"
                "jmp glavna_petlja \n\t"

        "kraj_glavne_petlje: \n\t"

        "cleanup_levog: \n\t"
        "cmp %[levo_i], %[s] \n\t"
        "jg cleanup_levog_kraj \n\t"
            "mov r8d, [%[a] + 4*%[levo_i]] \n\t"
            "mov [%[buff] + 4*%[i]], r8d \n\t"
            "add %[levo_i], 1 \n\t"
            "add %[i], 1 \n\t"
            "jmp cleanup_levog \n\t"

        "cleanup_levog_kraj: \n\t"
        
        "cleanup_desnog: \n\t"
        "cmp %[desno_i], %[d] \n\t"
        "jg cleanup_desnog_kraj \n\t"
            "mov r8d, [%[a] + 4*%[desno_i]] \n\t"
            "mov [%[buff] + 4*%[i]], r8d \n\t"
            "add %[desno_i], 1 \n\t"
            "add %[i], 1 \n\t"
            "jmp cleanup_desnog \n\t"
        
        "cleanup_desnog_kraj: \n\t"
        :
        : [levo_i] "r" ((long) l), [desno_i] "r" ((long) s+1),
            [i] "r" ((long) l), [a] "r" (a), [buff] "r" (buff),
            [s] "r" ((long) s), [d] "r" ((long) d)
        : "r8", "r9"
    );

    for(int i=l; i<=d; i++)
        a[i] = buff[i];
}


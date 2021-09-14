#include <stdio.h>
#include <stdlib.h>

void greska(const char *msg);

int **alociraj_matricu(int n, int m);

void ucitaj_matricu(int **A, int n, int m);

void oslobodi_matricu(int **A, int n);

void ispisi_matricu(int **A, int n, int m);

int main(){
    int n, m, k, tmp;
    int **A, **B, **C;

    printf("Unesite dimenzije matrice A: ");
    scanf("%d%d", &n, &m);
    printf("Unesite dimenzije matrice B: ");
    scanf("%d%d", &tmp, &k);

    if (tmp != m)
        greska("Broj kolona prve matrice mora biti jednak broju vrsta druge matrice!"); 

    A = alociraj_matricu(n, m);
    B = alociraj_matricu(m, k);
    C = alociraj_matricu(n, k);

    printf("Unesite matricu A: \n");
    ucitaj_matricu(A, n, m);
    printf("Unesite matricu B: \n");
    ucitaj_matricu(B, m, k);

    for( int i=0; i<n; i++){
        for (int j=0; j<k; j++){
            /*
            int suma = 0;
            for(int p=0; p<m; p++){
                suma += A[i][p] * B[p][j];
            }
            C[i][j] = suma;
            */

            __asm__(
                "xor %[suma], %[suma] \n\t"
                "mov r8, [%[A] + 8*%[i]] \n\t"
                "xor r10, r10 \n\t"
                "for_petlja:"
                "cmp r10d, %[m] \n\t"
                "je for_petlja_kraj \n\t"
                "mov eax, [r8 + 4*r10] \n\t"
                "mov r9, [%[B] + 8*r10] \n\t"
                "mov r9d, [r9 + 4*%[j]] \n\t"
                "imul r9d \n\t"
                "add %[suma], eax \n\t"
                "inc r10 \n\t"
                "jmp for_petlja \n\t"

                "for_petlja_kraj: \n\t"

                : [suma] "=&r" (C[i][j])
                : [i] "r" ((long) i), [j] "r" ((long) j), [A] "r" (A), [B] "r" (B), [m] "r" (m)
                : "r8", "r9", "r10", "eax", "edx"
            );
        }
    }
    
    printf("Rezultat mnozenja A*B: \n");
    ispisi_matricu(C, n, k);

    return 0;
}

void greska(const char *msg){
    fprintf(stderr, "Greska: %s", msg);
    exit(EXIT_FAILURE);
}

int **alociraj_matricu(int n, int m){
    int **A;
    if ((A = malloc(n * sizeof(int *))) == NULL)
        greska("Neuspesna alokacija memorije!");
    for (int i=0; i<n; i++){
        if ((A[i] = malloc(m*sizeof(int))) == NULL){
            for (int j=0; j<i; j++)
                free(A[j]);
            free(A);
            greska("Neuspesna alokacija memorije!");
        }
    }
    return A;
}

void ucitaj_matricu(int **A, int n, int m){
    for (int i=0; i<n; i++){
        for (int j=0; j<m; j++)
            scanf("%d", &A[i][j]);
    }
}

void oslobodi_matricu(int **A, int n){
    for (int j=0; j<n; j++)
        free(A[j]);
    free(A);
}

void ispisi_matricu(int **A, int n, int m){
    for (int i=0; i < n; i++){
        for (int j=0; j < m; j++)
            printf("%d ", A[i][j]);
        printf("\n");
    }
}


.text

.align 2

.global minimax

@ void minimax(int *a, int n, int *min, int *max)
@ r0 --- int *a
@ r1 --- int n
@ r2 --- int *min
@ r3 --- int *max

minimax:

@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Smestamo na stek registre koje cemo koristiti
stmfd sp!, {r4-r6}

@ U r5 se nalazi Max, Max = 0
@ U r4 se nalazi Min, Min = 0
mov r5, #0
mov r4, #0

cmp r1, #0
beq end_loop

@ Prvi clan niza se postavlja da bude tekuci 
@ maksimum, ali i tekuci minimum
ldr r5, [r0], #4
mov r4, r5
sub r1, r1, #1

loop:
@ Ako je n = 0, izlazi se iz petlje
cmp r1, #0
beq end_loop

@ Ucitava se tekuci clan niza iz memorije,
@ i azurira se memorijska lokacija tekuceg
# clana niza
ldr r6, [r0], #4

@ Uporedjujemo sa tekucim maksimumom
cmp r6, r5

@ Ako je tekuci element veci, postavlja se
@ za novi tekuci maksimum
movgt r5, r6

@ Uporedjujemo sa tekucim minimumom
cmp r6, r4

@ Ako je tekuci element manji, postavlja se
@ za novi tekuci minimum
movlt r4, r6

@ Smanjuje se n za jedan
sub r1, r1, #1

@ Bezuslovno se vraca na pocetak petlje
b loop

end_loop:
@ Suma se smesta na lokacije prosledjene
@ u registrima r2 i r3 
str r4, [r2]
str r5, [r3]

@ Vracamo vrednosti registara koje smo koristili
ldmfd sp!, {r4-r6}

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}

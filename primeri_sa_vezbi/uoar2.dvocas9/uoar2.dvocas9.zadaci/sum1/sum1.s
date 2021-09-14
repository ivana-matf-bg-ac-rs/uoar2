.text

.align 2

.global sum1

@ int sum1(int *a, int n)
@ r0 --- int *a
@ r1 --- int n

sum1:

@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Postavlja se na stek vrednost registra r4 koji 
@ cemo koristiti u funkciji. Registri r4-r10
@ moraju da se cuvaju ako se koriste, po 
@ konvencijama
str r4, [sp, #-4]!

@ U r2 se nalazi i, i = 0
mov r2, #0

@ U r3 se nalazi S, S = 0
mov r3, #0

loop:
@ Ako je i = n, izlazi se iz petlje
cmp r2, r1
beq end_loop

@ Ucitava se tekuci clan niza iz memorije
ldr r4, [r0, r2, lsl #2]

@ Sabira se ucitani clan sa sumom
add r3, r3, r4

@ Povecava se i za jedan
add r2, r2, #1

@ Bezuslovno se vraca na pocetak petlje
b loop

end_loop:
@ Suma se smesta u registar za povratnu vrednost
mov r0, r3

@ Vracamo vrednost registra r4 sa steka
ldr r4, [sp], #4

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}

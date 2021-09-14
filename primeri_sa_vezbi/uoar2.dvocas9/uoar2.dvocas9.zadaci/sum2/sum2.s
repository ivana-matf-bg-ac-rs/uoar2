.text

.align 2

.global sum2

@ int sum2(int *a, int n)
@ r0 --- int *a
@ r1 --- int n

sum2:

@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ U r3 se nalazi S, S = 0
mov r3, #0

loop:
@ Ako je n = 0, izlazi se iz petlje
cmp r1, #0
beq end_loop

@ Ucitava se tekuci clan niza iz memorije,
@ i azurira se memorijska lokacija tekuceg
# clana niza
ldr r2, [r0], #4

@ Sabira se ucitani clan sa sumom
add r3, r3, r2

@ Smanjuje se n za jedan
sub r1, r1, #1

@ Bezuslovno se vraca na pocetak petlje
b loop

end_loop:
@ Suma se smesta u registar za povratnu vrednost
mov r0, r3

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}

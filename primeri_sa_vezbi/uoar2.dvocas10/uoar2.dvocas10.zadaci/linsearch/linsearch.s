.text

.align 2

.global linsearch

@ int linsearch(int *a, int n, int x);
@ r0 --- int *a
@ r1 --- int n
@ r2 --- int x

linsearch:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Na stek potiskujemo n
str r1, [sp, #-4]!

loop:
@ Dokle god je broj n > 0
cmp r1, #0
beq not_found

@ Ucitavamo sledeci element u r3 i pomeramo pokazivac
@ na sledeci element
ldr r3, [r0], #4

@ Ispitujemo da li je ucitani broj jednak x
cmp r3, r2
beq found

@ Smanjujemo n za 1 i prelazimo na sledecu iteraciju
sub r1, r1, #1
b loop

found:
@ Ucitavamo u r2 originalnu vrednosti n i od nje oduzimamo
@ umanjenu vrednost n da bismo izracunali indeks pozicije
@ na kojoj je pronadjeno x
ldr r2, [sp], #4
sub r0, r2, r1
b done

not_found:
@ Upisujemo -1 kao povratnu vrednost
mov r0, #-1

done:
@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}



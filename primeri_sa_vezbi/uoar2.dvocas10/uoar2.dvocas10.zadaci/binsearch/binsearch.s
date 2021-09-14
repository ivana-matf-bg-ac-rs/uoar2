.text

.align 2

.global binsearch

@ int binsearch(int *a, int n, int x)
@ r0 --- int *a
@ r1 --- int n
@ r2 --- int x

binsearch:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Cuvamo vrednosti registara koje cemo koristiti
stmfd sp!, {r4, r5}

@ U r4 smestamo levi indeks l = 0, a u r5 desni indeks d = n-1
mov r4, #0
sub r5, r1, #1

loop:
@ Dokle god je l <= d
cmp r4, r5
bgt not_found

@ Izracunavamo srednji indeks s = (l+d)/2
add r1, r4, r5
mov r1, r1, asr #1

@ Ucitavamo element sa izracunatim indeksom a[s]
ldr r3, [r0, r1, lsl #2]

@ Uporedjujemo ga sa x
cmp r2, r3

@ Ako je a[s] == x, vracamo izracunati indeks
beq found

@ Ako je x > a[s], tada levi indeks l postaje s+1, a ako je
@ x < a[s] tada desni indeks postaje s-1
addgt r4, r1, #1
sublt r5, r1, #1

@ Prelazimo na sledecu iteraciju
b loop

found:
@ Upisujemo izracunati indeks s u r0
mov r0, r1
b done

not_found:
@ Upisujemo -1 u r0
mov r0, #-1

done:

@ Vracamo sacuvane vrednosti sa steka
ldmfd sp!, {r4, r5}

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}



.text

.align 2

.global euler1

@ int euler1(int n)
@ r0 --- int n 
@ Odredjuje se broj celih brojeva m,
@ 1 <= m < n, takvih da su uzajamno
@ prosti sa n.

euler1:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Cuvamo na steku registre koje cemo da koristimo
stmfd sp!, {r4-r6}

@ Registar r6 ce sadrzati brojac uzajamno prostih brojeva sa n
@ Registar r5 ce sadrzati broj n
@ Registar r4 ce sadrzati tekuci broj m
mov r6, #0
mov r5, r0
mov r4, #1

@ U petlji za za m od 1 do n-1 ispituje da li je m uzajamno 
@ prosto sa n
next_number:
cmp r4, r5
beq last_number

@ Poziva se funkcija nzd(n, m)
mov r0, r4
mov r1, r5
bl nzd

@ Ako je ndz(n, m) == 1, uvecava se brojac r6 za jedan
cmp r0, #1
addeq r6, r6, #1

@ Prelazi se na sledece m
add r4, r4, #1
b next_number

last_number:
@ Upisuje se broj uzajamno prostih u rezultat
mov r0, r6

@ Skidamo sa steka vrednosti registara koje smo
@ smestili na stek
ldmfd sp!, {r4-r6}

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}

@ int nzd(int n, int m)
@ r0 --- int n
@ r1 --- int m

nzd:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Smestamo na stek registre koje cemo koristiti
stmfd sp!, {r4-r5}

@ REgistar r4 ce sadrzati n
@ Registar r5 ce sadrzati m
mov r4, r0
mov r5, r1

@ U petlji implementiramo Euklidov algoritam
next_iteration:
@ Ispitujemo da li je m jednako nula, ako jeste
@ n je upravo nzd
cmp r5, #0
beq last_iteration

@ Pozivamo funkciju za izracunavanje ostatka pri
@ deljenju n sa m, odnosno mod(n, m)
mov r0, r4
mov r1, r5
bl mod

@ n dobija vrednost m, dok m dobija vrednost n % m
mov r4, r5
mov r5, r0

@ Prelazi se na sledecu iteraciju
b next_iteration

last_iteration:
@ Vrednost n upisujemo u r0
mov r0, r4

@ Skidamo sa steka vrednosti registara koje smo koristili
ldmfd sp!, {r4-r5}

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}

@ int mod(int n, int m)
@ r0 --- int n
@ r1 --- int m

mod:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ U petlji oduzimamo m od n dokle god je n >= m.
@ Ono sto ostane na kraju je upravo ostatak pri
@ deljenju n sa m
next_substraction:
cmp r0, r1
subge r0, r0, r1
bge next_substraction

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}


.text

.align 2

.global norms

@ void norms(int **a, int m, int n, int *h, int *v)
@ r0 --- int **a
@ r1 --- int m - broj vrsta
@ r2 --- int n - broj kolona
@ r3 --- int *h - adresa lokacije na koju treba upisati maksimum
@                   po vrstama
@ [fp + 8] -- int *v - adresa lokacije na koju treba upisati maksimum
@                   po kolonama

@ arg4      int *v                  veca adresa u steku
@ lr        
@ fp        <- fp
@ sk(n-1)
@ sk(n-2)
@
@
@
@ sk(0)     <- sp                         manja adresa u steku


norms:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Alociramo lokalni niz celih brojeva duzine n na steku. Ovaj niz
@ ce se koristiti za sume apsolutnih vrednosti elemenata po kolonama.
sub sp, sp, r2, lsl #2   @ sp = sp - 4*r2

@ Cuvamo vrednosti registara koje cemo koristiti
stmfd sp!, {r4-r10}

@ Registar r10 ce biti adresa niza suma po kolonama
sub r10, fp, r2, lsl #2

@ Inicijalizujemo sume u lokalnom nizu na nule u sledecoj petlji

@ Registar r4 ce nam biti brojac u petlji
mov r4, #0

@ REgistar r5 ce sadrzati nulu na koju zelimo da Inicijalizujemo
@ clanove niza

init_next:
@ Dokle god je brojac manji od n
cmp r4, r2
beq init_last

@ Upisujemo nulu na lokaciju tekuceg elementa
str r5, [r10, r4, lsl #2]

@ Uvecavamo brojac za jedan
add r4, r4, #1

@ Prelazimo na sledeci element
b init_next

init_last:

@ Naredna petlja iterira po vrstama matrice i racuna
@ maksimum suma po vrstama

@ Registar r4 ce biti brojac spoljasnje petlje, odnosno
@ indeks vrste
mov r4, #0

@ Registar r5 ce biti maksimum sume po vrstama, nula se vec
@ nalazi u r5 registru.

next_row:
@ Dokle god je brojac manji od broja vrsti
cmp r4, r1
beq last_row

@ Unutrasnja petlja iterira kroz tekucu vrstu i racuna sumu
@ apsolutnih vrednosti njenih elemenata. Elementi se usput
@ dodaju i na sume po kolonama koje se nalaze u elementima
@ lokalnog niza.

@ REgistar r6 ce biti suma tekuce vrste
mov r6, #0

@ Registar r7 ce biti brojac unutrasnje petlje, odnosno
@ indeks po kolonama
mov r7, #0

@ Registar r8 ce biti adresa tekuce vrste
ldr r8, [r0, r4, lsl #2]

next_element:
@ Dokle god je brojac unutrasnje petlje manji od n
cmp r7, r2
beq last_element

@ Ucitavamo tekuci element vrste, racunamo njegovu 
@ apsolutnu vrednosti i dodajemo na sumu
ldr r9, [r8, r7, lsl #2]
cmp r9, #0
rsblt r9, r9, #0
add r6, r6, r9

@ Ucitavamo tekucu vrednost sume kolone kojoj pripada
@ tekuci element i uvecavamo je za vrednosti apsolutne
@ vrednosti elementa, a zatim je ponovo upisujemo
@ u memoriju.
ldr ip, [r10, r7, lsl #2]
add ip, ip, r9
str ip, [r10, r7, lsl #2]

@ Uvecavamo brojac u unutrasnjoj petlji i prelazimo
@ na sledeci element
add r7, r7, #1
b next_element

last_element:
@ Ako je suma po vrsti veca od do sada najvece, azuriramo
@ najvecu sumu
cmp r6, r5
movgt r5, r6

@ Uvecavamo brojac u spoljasnjoj petlji i prelazimo na 
@ sledecu vrstu
add r4, r4, #1
b next_row

last_row:

@ Naredna petlja odredjuje maksimalnu sumu po kolonama, kao
@ maksimum lokalnog niza u kome se te sume nalaze.

@ Registar r4 ce biti brojac u petlji
mov r4, #0

@ Registar r6 ce biti tekuci maksimum po kolonama
mov r6, #0

check_next:
@ Dokle god je brojac manji od n
cmp r4, r2
beq check_last

@ Ucitavamo tekuci element lokalnog niza i poredimo
@ sa tekucim maksimumom. Ako je veci, azuriramo
@ tekuci maksimum
ldr r7, [r10, r4, lsl #2]
cmp r7, r6
movgt r6, r7

@ Uvecavamo brojac i prelazimo na sledecu iteraciju
add r4, r4, #1
b check_next

check_last:
@ Cuvamo maksimum po vrstama na lokaciji prosledjenoj cetvrtim argumentom
str r5, [r3]

@ Cuvamo maksimum po kolonama na lokaciji prosledjenoj na steku
ldr r3, [fp, #8]
str r6, [r3]

@ Vracamo sacuvane vrednosti sa steka
ldmfd sp!, {r4-r10}

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}

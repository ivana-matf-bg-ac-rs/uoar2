.text

.align 2

.global most_frequent

@ void most_frequent(char *s, char *c, int *f)
@ r0 --- char *s - adresa pocetka niza
@ r1 --- char *c - adresa gde treba upisati najfrekventniji karakter
@ r2 --- int *f - adresa gde treba upisati broj pojavljivanja

@ lr                            visa adresa u steku
@ fp   <- sp, fp
@ bp[255]
@ bp[254]
@
@
@
@
@ bp[1]
@ bp[0]                <-sp, r3         niza adresa u steku

most_frequent:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Alociramo prostor za lokalni niz celih brojeva duzine 256.
@ Ovaj niz koristimo za brojace pojavljivanja karaktera.
sub sp, sp, #1024

@ Cuvamo na steku vrednosti registara koje cemo koristiti
stmfd sp!, {r4-r6}

@ U registar r3 smestamo adresu lokalnog niza
sub r3, fp, #1024

@ U narednoj petlji inicijalizujemo brojace na nulu. R4 ce biti
@ indeks, a r5 ce biti nula.
mov r4, #0
mov r5, #0

next:
@ Dokle god je brojac manji od 256
cmp r4, #256
beq last

@ Upisujemo nulu u element niza sa indeksom r4
str r5, [r3, r4, lsl #2]

@ Prelazimo na sledeci element u nizu
add r4, r4, #1
b next

last:

@ Ucitavamo karakter po karakter iz stringa i povecavamo 
@ odgovarajuci brojac

next_char:
@ Ucitavamo neoznaceni bajt sa adrese r0 i pomeramo pokazivac 
@ u desno
ldrb r5, [r0], #1

@ ako je dati karekter jednak nuli, izlazimo iz petlje, u suprotnom
@ povecavamo brojac

cmp r5, #0
beq last_char

@ Ucitavamo u r4 brojac karaktera sa ASCII kodom u r5, uvecavamo
@ ga za jedan a zatim vracamo u memoriju
ldr r4, [r3, r5, lsl #2]
add r4, r4, #1
str r4, [r3, r5, lsl #2]

b next_char

last_char:

@ U narednoj petlji trazimo najveci medju brojacima, kao i 
@ indeks najveceg brojaca, sto je upravo karakter koji se
@ pojavio najveci broj puta.

@ U registar r4 smestamo pocetni element niza. r4 ce biti
@ maksimum, a r6 indeks maksimalnog elementa.
ldr r4, [r3]
mov r6, #0

@ r0 ce biti brojac od 1  do < 256
mov r0, #1

next_element:
@ Dokle god je brojac r0 manji od 256
cmp r0, #256
beq last_element

@ Ucitavamo element niza sa indeksom r0
ldr r5, [r3, r0, lsl #2]

@ uporedjujemo ga sa maksimumom
cmp r5, r4
@ Azuriramo i meskimum i indeks po potrebi
movgt r4, r5
movgt r6, r0

@ Uvecavamo indeks r0 i prelazimo na sledecu iteraciju
add r0, r0, #1
b next_element

last_element:

@ Smestamo podatke u za to predvidjene lokacije
strb r6, [r1]
str r4, [r2]

@ Vracamo sa steka vrednosti registara koje smo koristili.
ldmfd sp!, {r4-r6}


@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}



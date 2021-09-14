.text

.align 2

.global longest

@ void longest(char *s, int *start, int *length)
@ r0 --- char *s
@ r1 --- int *start
@ r2 --- int *length

longest:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Postavljamo na stek vrednosti registara koje cemo koristiti
stmfd sp!, {r4-r8}

@ Registar r4 cuva pocetni indeks do sada najduze sekvence
mov r4, #0
@ Registar r5 cuva duzinu do sada najduze sekvence
mov r5, #0

@ Ucitavamo prvi karakter i proveravamo da li je nula
ldrb r3, [r0], #1
cmp r3, #0
beq store

@ Registar r6 cuva indeks pocetka tekuce sekvence
@ Registar r7 cuva tekucu duzinu tekuce sekvence
@ Registar r8 cuva prethodni karekter
mov r6, #0
mov r7, #1
mov r8, r3

next_char:
@ Ucitavamo sledeci karakter i proveravamo da li je nula
ldrb r3, [r0], #1
cmp r3, #0
beq last_char

@ Uporedjujemo tekuci karakter sa prethodnim
cmp r8, r3
beq equal

@ Ako su razliciti, to je kraj sekvence. U tom slucaju
@ poredimo duzinu tekuce sekvence sa do sada najduzom
cmp r7, r5
ble new_sequence

@ Ako je tekuca sekvenca duza, tada se azuriraju informacije
@ o najduzoj sekvenci
mov r4, r6
mov r5, r7

new_sequence:
@ Inicijalizujemo sledecu sekvencu
add r6, r6, r7
mov r7, #1

@ Tekuci karakter postaje prethodni
mov r8, r3

@ Prelazimo na sledecu iteraciju
b next_char

equal:

@ Ako su tekuci i prethodni karakteri jednaki, uvecavamo
@ duzinu tekuce sekvence
add r7, r7, #1

@ Prelazimo na sledeci karakter
b next_char

last_char:

@ Proveravamo da li je mozda poslednja sekvenca najduza
cmp r7, r5
ble store

mov r4, r6
mov r5, r7

store:
@ Cuvamo vrednosti u za to predvidjene lokacije
str r4, [r1]
str r5, [r2]

@ Vracamo vrednosti registara sa steka
ldmfd sp!, {r4-r8}

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}



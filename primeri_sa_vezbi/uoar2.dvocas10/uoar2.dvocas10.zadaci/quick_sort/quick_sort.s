.text

.align 2

.global quick_sort

@ void quick_sort(int *a, int l, int r)
@ r0 --- int *a
@ r1 --- int l
@ r2 --- int r

quick_sort:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Cuvamo na steku sadrzaje registara koje cemo koristiti
stmfd sp!, {r4-r7}

@ Izlaz iz rekurzije je za l >= r
cmp r1, r2
bge done


@ Smestamo l u r4, r u r5, i a u r6
mov r4, r1
mov r5, r2
mov r6, r0

@ r1 ce biti tekuci indeks, a r7 ce biti indeks poslednjeg
@ elementa koji je manji od pivota. Inicijalno su oba
@ jednaka l.
mov r7, r1

@ U r0 ucitavamo pivot, a to je krajnji levi element
ldr r0, [r6, r4, lsl #2]

next_element:
cmp r1, r5
bgt last_element

@ Ucitavamo tekuci element i poredimo ga sa pivotom
ldr r3, [r6, r1, lsl #2]
cmp r3, r0
bge continue

@ Ako je manji, uvecavamo r7, a zatim zamenjujemo eelemente
@ na pozicijama r7 i r1.
add r7, r7, #1
ldr r2, [r6, r7, lsl #2]
str r2, [r6, r1, lsl #2]
str r3, [r6, r7, lsl #2]

continue:
@ Uvecavamo r1 za 1 i prelazimo na sledeci element
add r1, r1, #1
b next_element

last_element:
@ Postavljamo pivot na poziciju r7
ldr r3, [r6, r7, lsl #2]
str r0, [r6, r7, lsl #2]
str r3, [r6, r4, lsl #2]

@ Pozivamo quick_sort(a, l, r7-1)
mov r0, r6
mov r1, r4
sub r2, r7, #1
bl quick_sort

@ Pozivamo quick_sort(a, r7+1, r)
mov r0, r6
add r1, r7, #1
mov r2, r5
bl quick_sort


done:
@ Vracamo vrednosti sa steka
ldmfd sp!, {r4-r7}

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}



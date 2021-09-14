.text

.align 2

.global secret

@ int secret(int n)
# r0 --- int n

secret:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Cuvamo na steku vrednosti registara koje cemo koristiti
stmfd sp!, {r4, r5}

@ U r4 cuvamo broj n
mov r4, r0

next_number:
@ Dokle god broj nije jednocifren, izdvajaju se cifre broja
cmp r4, #10
blt last_number

@ U r5 smestamo sumu cifara tekuceg broja
mov r5, #0

next_iteration:
@ Dokle god ne izdvojimo sve cifre...
cmp r4, #0
beq last_iteration

@ Racunamo ostatak pri deljenju sa 10 kako bismo
@ izdvojili poslednju cifru.
mov r0, r4
mov r1, #10
bl __modsi3

@ Izdvojenu cifru sabiramo sa sumom cifara
add r5, r5, r0

@ Racunamo celobrojni kolicnik pri deljenju broja
@ n sa 10. To ce biti nova vrednost broja n.
mov r0, r4
mov r1, #10
bl __divsi3

@ Dobijeni kolicnik se upisuje u n.
mov r4, r0

@ Prelazi se na sleducu iteraciju
b next_iteration

last_iteration:
@ Zbir cifara postaje novi broj
mov r4, r5
b next_number

last_number:
@ Smestamo tajni broj u registar za rezultat
mov r0, r4

@ Skidamo sa steka vrednosti iz registara koje smo
@ koristili
ldmfd sp!, {r4, r5}

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}



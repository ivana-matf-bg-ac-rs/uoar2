.text

.align 2

.global printbits

@ void printbits(unsigned n)
@ r0 --- unsigned n

printbits:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Smestamo na stek registre koje cemo koristiti
stmfd sp!, {r4, r5}

@ U registar r4 smestamo n
mov r4, r0

@ U registar r5 smestamo masku cija je vrednost
@ na pocetku 1000....0000
mov r5, #1
mov r5, r5, lsl #31

next_bit:
@ Dok maska ne postane nula
cmp r5, #0
beq last_bit

@ Testira se tekuci bit
tst r4, r5
beq zero

@ Ako je bit jedan, ispisuje se '1'
mov r0, #'1'
bl putchar
b continue

zero:
@ Ako je bit nula, ispisuje se '0'
mov r0, #'0'
bl putchar

continue:
@ Pomeramo masku za jednu poziciju u desno i prelazimo
@ na sledeci bit
mov r5, r5, lsr #1
b next_bit

last_bit:
@ Ispisuje se i znak za novi red
mov r0, #'\n'
bl putchar

@ Vracamo sa steka registre koje smo koristili
ldmfd sp!, {r4, r5}

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}


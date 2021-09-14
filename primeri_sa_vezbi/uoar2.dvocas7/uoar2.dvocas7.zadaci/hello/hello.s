.text

fmt: .asciz "Hello world\n"

@ Sve instrukcije su velicine 4 bajta i moraju 
@ biti poravnate na adresi koja je deljiva sa 4
.align 2

.global main

main:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Poziva se funkcije printf("Hello world\n")
adr r0, fmt
bl printf

@ Povratna vrednost je 0, pa je smestamo u 
@ registar za povratnu vrednost r0
mov r0, #0

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}

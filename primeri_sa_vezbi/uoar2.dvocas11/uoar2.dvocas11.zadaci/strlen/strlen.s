.text

.align 2

.global arm_strlen

@ int arm_strlen(char *s)
@ r0 --- char *s - adresa pocetka stringa

arm_strlen:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Registar r1 ce nam biti pokazivac na tekuci karakter u
@ stringy. Registar r0 ce biti brojac karaktera u stringu
mov r1, r0
mov r0, #0

next_char:
@ Ucitavamo neoznaceni bajt sa adrese r1 i pomeramo pokazivac 
@ u desno
ldrb r2, [r1], #1

@ Ako je dati karakter jednak nuli, dosli so do kraja stringa,
@ tako da izlazimo iz petlje, u suprotnom uvecavamo brojac.
cmp r2, #0
beq done
add r0, r0, #1
b next_char

done:
@ Broj karaktera stringa je vec u r0 sto je upravo
@ i povratna vrednost.

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}



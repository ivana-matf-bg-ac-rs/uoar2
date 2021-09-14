.text

.align 2

.global palindrom

@ int palindrom(char *s)
@ r0 --- char *s - adresa pocetka stringa

palindrom:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Adresu pocetka stringa kopiramo u pomocni registar r1. Ovaj
@ registar cemo u narednoj petlji postaviti da pokazuje na 
@ poslednji karakter u stringu.
mov r1, r0

next_char:
@ Ucitavamo karakter i proveravamo da li je terminirajuca nula
ldrb r2, [r1]
cmp r2, #0
beq last_char

@ Pomeramo r1 da pokazuje na sledeci karakter
add r1, r1, #1
b next_char

last_char:

@ Vracamo pokazivac u r1 za jedno mesto u desno, jer se
@ zaustavio na terminirajucoj nuli
sub r1, r1, #1

@ U r0 je pokazivac na pocetak niza, u r1 je pokazivac na kraj niza

@ Petlji proveravamo jednakost odgovarajucih parova karaktera.
@ Ako dodje do neslaganja, string nije palindrom. Ako su karakteri
@ jednaki pomeramo r0 u desno i r1 u levo i nastavljamo sa petljom
@ sve dok je r0 < r1.

next_pair:
@ Dokle god je r0 < r1
cmp r0, r1
bge last_pair

@ Ucitavamo karaktere
ldrb r2, [r0], #1
ldrb r3, [r1], #-1

@ Uporedjuemo ucitane karaktere.
cmp r2, r3
bne fail

b next_pair

last_pair:

@ Prosli smo sve karaktere, nismo dosli do neslaganja
@ u medjuvremenu tako da string jeste palindrom
mov r0, #1
b done

fail:
@ U slucaju neuspeha, vracamo 0
mov r0, #0

done:
@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}



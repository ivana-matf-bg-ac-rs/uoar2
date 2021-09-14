.text

.align 2

.global max_element

@ int max_element(int *a, int n)
@ r0 --- int *a
@ r1 --- int n

max_element:

@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ U r3 se nalazi Max, Max = 0
mov r3, #0

cmp r1, #0
beq end_loop

@ Prvi clan niza se postavlja da bude tekuci 
@ maksimum
ldr r3, [r0], #4
sub r1, r1, #1

loop:
@ Ako je n = 0, izlazi se iz petlje
cmp r1, #0
beq end_loop

@ Ucitava se tekuci clan niza iz memorije,
@ i azurira se memorijska lokacija tekuceg
# clana niza
ldr r2, [r0], #4

@ Uporedjujemo sa tekucim maksimumom
cmp r2, r3

@ Ako je tekuci element veci, postavlja se
@ za novi tekuci maksimum
movgt r3, r2

@ Smanjuje se n za jedan
sub r1, r1, #1

@ Bezuslovno se vraca na pocetak petlje
b loop

end_loop:
@ Suma se smesta u registar za povratnu vrednost
mov r0, r3

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}

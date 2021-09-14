.text

.align 2

.global max2

@ int max2(int x, int y)
@ r0 --- int x
@ r1 --- int y

max2:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Uporedjuju se x i y, i instrukcija mov se izvrsava
@ samo ako je uslov ispunjen
cmp r0, r1
movlt r0, r1

done:
@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}

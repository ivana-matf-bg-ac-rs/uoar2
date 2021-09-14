.text

.align 2

.global max1

@ int max1(int x, int y)
@ r0 --- int x
@ r1 --- int y

max1:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Uporedjuju se x i y
cmp r0, r1
bgt done

@ Prebacuje se y u r0 ako je vece od x
mov r0, r1

done:
@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}

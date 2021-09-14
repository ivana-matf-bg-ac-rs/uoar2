.text

.align 2

.global add1

@ int add1(int x, int y)
@ r0 --- int x
@ r1 --- int y

add1:
@ Prolog funkcije
stmfd sp!, {fp, lr}
mov fp, sp

@ Sabiranje r0 = r0 + r1
add r0, r0, r1

@ Epilog funkcije
mov sp, fp
ldmfd sp!, {fp, pc}

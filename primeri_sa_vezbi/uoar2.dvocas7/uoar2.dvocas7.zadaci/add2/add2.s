.text

.align 2

.global add2

@ int add2(int x, int y)
@ r0 --- int x
@ r1 --- int y

add2:
@ Sabiranje r0 = r0 + r1
add r0, r0, r1

@ Epilog funkcije
mov pc, lr

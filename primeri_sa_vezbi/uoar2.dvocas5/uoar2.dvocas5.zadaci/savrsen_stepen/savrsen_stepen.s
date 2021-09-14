.intel_syntax noprefix

.text

.global savrsen_stepen

##########################################################
# int savrsen_stepen(unsigned n, unsigned* m, unsigned* k)
# eax                edi         rsi          rdx
##########################################################

savrsen_stepen:

# Prolog funkcije
enter 0, 0

# m uzima vrednost od 2 do n/2
mov r8d, 2  # m
mov r10d, edi   # n
shr r10d, 1     # n/2

# rdx je potreban zbog mnozenja
# pa se smesta na pomocnu lokaciju
mov r11, rdx

petlja:
# Ako je m>n/2, broj nije savrsen
cmp r8d, r10d
ja nije

# Inicijalizuju se k na 2 i tekuci
# stepen s na m^2
mov r9d, 2  # k
mov eax, r8d    # s = m
mul r8d         # s = m^2

# Racuna se m^k, pri cemu k krece
# od 2 (vec je inicijalizovano)

petlja2:
# Poredi se m^k sa n. Ako je
# m^k == n, nadjeni su m i k
cmp eax, edi
je nadjeno

# Ako je m^k > n prelazi se na 
# sledece m
ja sledece_m

# Ako nije nista od toga, mnozimo
# tekuci proizvod sa m, i povecavamo k
mul r8d     # s*=m
inc r9d     # k++
jmp petlja2

# Povecava se m i prelazi na sledecu
# iteraciju
sledece_m:
inc r8d     # m++
jmp petlja

# Broj je savrsen, upisuju se vrednosti
# na odgovarajuce lokacije
nadjeno:
mov eax, 1
mov [rsi], r8d  # m
mov [r11], r9d  # k

jmp kraj

# Broj nije savrsen, povratna vrednost
# je nula
nije:
mov eax, 0

kraj:
# Epilog i povratak iz funkcije
leave
ret

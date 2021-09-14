.intel_syntax noprefix

.text

.global obrni

##################################
# void obrni(int∗ A, int n)
#            rdi      esi
##################################

obrni:

# Prolog funkcije
enter 0, 0

# U r8 ce biti pokazivac na tekuci
# clan sa pocetka niza
# U r9 ce biti pokazivac na tekuci
# clan sa kraja niza
mov r8, 0           # i = 0
movsx r9, esi       # j = n-1
dec r9

# Iteracija ukupno ce biti ceo deo
# od n/2 i to ce se civati u esi
shr esi, 1

petlja:
# Proverava se da li ima jos iteracija
cmp esi, 0
jle kraj

# Smanjuje se broj preostalih iteracija
# za jedan
dec esi

# Clanovi a[i] i a[j] se smestaju u
# pomocne registre r10d i r11d i
# zamenjuju im se mesta
mov r10d, [rdi + 4*r8]  # a[i] -> r10d
mov r11d, [rdi + 4*r9]  # a[j] -> r11d
mov [rdi + 4*r8], r11d  # r11d -> a[i]
mov [rdi + 4*r9], r10d  # r10d -> a[j]

# Prelazi se na sledeci clan sa pocetka
# i na prethodni clan sa kraja niza
inc r8  # i++
dec r9  # j--
jmp petlja

kraj:
# Zavrsetak programa
leave
ret

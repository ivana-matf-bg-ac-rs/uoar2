.intel_syntax noprefix

.text

.global deljiv_4

##############################
# int deljiv_4(int)
# eax          edi
##############################

deljiv_4:

# Prolog funkcije
enter 0, 0

#  X0X1X2.......X29X30X31   = edi
#   0 0 0 ........0  1  1   = 3
# & 0 0 0 ........0 X30X31  = edi & 3

# Postavlja se nula u povratnom registru
xor eax, eax

# Broj je deljiv sa 4 ukoliko su poslednje dve cifre
# nule. Vrsi se konjunkcija sa brojem 3 koji sluzi
# kao maska da bi se izdvojile dve poslednje cifre
and edi, 3
# Ukoliko nisu nule, broj nije deljiv
jne kraj

# U suprotnom broj je deljiv sa 4, pa je rezultat 1
mov eax, 1

kraj:
# Epilog funkcije
leave
# Povratak iz funkcije
ret

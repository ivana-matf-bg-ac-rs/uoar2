.intel_syntax noprefix

.text

.global nzd

########################################
# unsigned nzd(unsigned a, unsigned b)
# eax          edi         esi
########################################
# nzd(a, 0) = a; nzd(a, b) = nzd(b, a%b)
#
########################################

nzd:

# Prolog funkcije
enter 0, 0

# U eax se smesta broj a, dok se u edx smesta broj b
mov eax, edi
mov edx, esi

petlja:
# Poredi se drugo broj sa nulom, ako jeste nula,
# prvi broj je nzd
cmp edx, 0
je kraj

# Ako nije, racuna se a%b, b se smesta u esi
mov esi, edx
cdq
div esi

# Podesavaju se argumenti za sledecu iteraciju, na mesto
# a se smesta b, dok je na mestu b vec ostatak a%b
mov eax, esi
jmp petlja

kraj:
# Zavrsava se program
leave
ret



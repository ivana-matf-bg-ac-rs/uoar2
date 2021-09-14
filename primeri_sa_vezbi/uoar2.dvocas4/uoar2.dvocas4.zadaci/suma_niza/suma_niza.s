.intel_syntax noprefix

.text

.global suma_niza

##################################
# int suma_niza(int∗ A, int n)
# eax           rdi     esi
##################################

suma_niza:

# Prolog funkcije
enter 0, 0

# Prosiruje se n zato sto je za
# indirektrno adresiranje potrebno
# raditi sa 64-bitnim registrom
# odnosno sabirati indeks koji je 
# 64-bitni sa lokacijom koja je 
# takodje 64-bitna 
movsx rsi, esi

# Postavlja se suma na nulu
xor eax, eax

petlja:
# Proverava se da li ima jos
# clanova niza
cmp esi, 0
jle kraj

# Smanjuje se indeks tekuceg clana za jedan
dec esi
# Pristupa se clanu a[i] sa izracunatim indeksom i
# indirektnim adresiranjem tako sto se
# na adresu a doda 4*i
add eax, [rdi + 4*rsi]
jmp petlja

kraj:
# Zavrsava se program
leave
ret

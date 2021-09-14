.intel_syntax noprefix

.text

.global najveci

##################################
# int najveci(int∗ A, int n)
# eax           rdi     esi
##################################

najveci:

# Prolog funkcije
enter 0, 0

# Prosiruje se n zato sto je za
# indirektrno adresiranje potrebno
# raditi sa 64-bitnim registrom
# odnosno sabirati indeks koji je 
# 64-bitni sa lokacijom koja je 
# takodje 64-bitna  
movsx rsi, esi

# Proverava se da li postoji bar jedan clan 
# niza
cmp esi, 0
jle kraj

# Pristupa se poslednjem elementu u nizu i 
# on postaje maksimum
des esi
mov eax, [rdi + 4*rsi]

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
mov ecx, [rdi + 4*rsi]
cmp eax, ecx
jge petlja

# Tekuci clan postaje tekuci maksimum
mov eax, ecx
jmp petlja

kraj:
# Zavrsava se program
leave
ret


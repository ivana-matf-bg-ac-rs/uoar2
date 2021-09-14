.intel_syntax noprefix

.text

.global clan_niza

#######################################
# int clan_niza(int)
# eax           edi
#######################################

clan_niza:

# Prolog funkcije
enter 0, 0

# Prvi clan niza se smesta u eax
mov eax, 1

# Smanjuje se n za jedan posto 
# prvi clan vec imamo dat, a n
# je sigurno veci ili jednak 1
dec edi

# U petlji se proverava da li je n nula
petlja:
cmp edi, 0
jle kraj

# Ako nije n nula, izracunava se sledeci
# clan niza
shl eax, 2
add eax, 3
dec edi
jmp petlja

# Rezultat se vec nalazi u eax, tako da
# samo zavrsavamo program
kraj:
leave
ret 


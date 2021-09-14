.intel_syntax noprefix

.text

.global suma

#################################
# unsigned suma(unsigned n)
# eax           edi
#################################

suma:

# Prolog funkcije
enter 0, 0

# Inicijalizuje se suma na nulu
xor eax, eax

petlja:
# U edi ce biti tekuci broj koji ce uzimati vrednosti
# od n do 1. Ukoliko se doslo do nule, izlazi se iz petlje
cmp edi, 0
je kraj

# dodaje se tekuci broj na sumu
add eax, edi

# Smanjuje se tekuci broj za jedan
dec edi
jmp petlja

kraj:
# Epilog funkcije
leave
# Povratak iz funkcije
ret

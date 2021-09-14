.intel_syntax noprefix

.text

.global suma_parnih

#################################
# unsigned suma_parnih(unsigned n)
# eax           edi
#################################

suma_parnih:

# Prolog funkcije
enter 0, 0

# Inicijalizuje se suma na nulu
xor eax, eax

# Proverava se da li je broj paran
test edi, 1
jz petlja

# Broj je neparan, pa smanjujemo za jedan
dec edi

petlja:
# U edi ce biti tekuci broj koji ce uzimati vrednosti
# od n do 1. Ukoliko se doslo do nule, izlazi se iz petlje
cmp edi, 0
je kraj

# dodaje se tekuci broj na sumu
add eax, edi

# Smanjuje se tekuci broj za dva
sub edi, 2
jmp petlja

kraj:
# Epilog funkcije
leave
# Povratak iz funkcije
ret

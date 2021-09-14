.intel_syntax noprefix

.text

.global prost

#####################################
# unisigned prost(unsigned n)
# eax             edi
#####################################

prost:

# Prolog funkcije
enter 0, 0

# U ecx ce biti brojac i koji ce uzimati vrednosti
# od 2 do n/2
mov ecx, 2

# U esi je ceo deo od broja n/2
mov esi, edi
shr esi, 1

petlja:
# Ako je i > floor(n/2), izlazi se iz petlje i odgovor
# je da je broj prost
cmp ecx, esi
ja jeste_prost

# Deli se broj n sa i
mov eax, edi
cdq 
div ecx

# Ukoliko je deljiv, broj n nije prost
cmp edx, 0
je nije_prost

# Povecava se brojac i i prelazi se na sledecu iteraciju
inc ecx
jmp petlja

# Ukoliko je broj prost, rezultat je 1
jeste_prost:
mov eax, 1

jmp kraj

# Ukoliko nije prost, rezultat je 0
nije_prost:
mov eax, 0

kraj:
# Zavrsava se program
leave
ret

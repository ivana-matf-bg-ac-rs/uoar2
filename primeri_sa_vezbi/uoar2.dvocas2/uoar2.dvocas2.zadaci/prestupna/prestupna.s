.intel_syntax noprefix

.text

.global prestupna

###############################
# unsigned prestupna(unsigned)
# eax                edi
###############################

prestupna:

# Prolog funkcije
enter 0, 0

# Proverava se da li je deljiv sa 4
# Ukoliko nije, nije prestupna.
mov eax, edi
and eax, 3
jne nije_prestupna

# Proverava se da li je deljiv sa 100
mov eax, edi
cdq

mov esi, 100
div esi

# Ukoliko nije deljiv sa 100, jeste prestupna
cmp edx, 0
jne jeste_prestupna

# Proverava se da li je deljiv sa 400
mov eax, edi
cdq

mov esi, 400
div esi

# Ukoliko nije deljiv sa 400, nije prestupna
cmp edx, 0
jne nije_prestupna

jeste_prestupna:
# Ako jeste pretupna, rezultat je 1
mov eax, 1
jmp kraj

nije_prestupna:
# Ako nije prestupna, rezultat je 0
mov eax, 0

kraj:
# Epilog i povratak iz funkcije
leave
ret



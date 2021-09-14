.intel_syntax noprefix

.text

.global min

#####################################
# int min(int, int)
# eax     edi  esi
#####################################

min:

# Prolog funkcije
enter 0, 0

# Ukoliko je prvi veci ili jednak
# drugom prelazi se na labelu 
# prvi_veci
cmp edi, esi
jge prvi_veci

# Ukoliko je drugi veci, prvi je minimum
mov eax, edi
# Prelazi se bezuslovno na kraj
jmp kraj

prvi_veci:
mov eax, esi

kraj:
# Epilog i povratak iz funkcije
leave
ret

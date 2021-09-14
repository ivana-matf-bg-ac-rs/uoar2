.intel_syntax noprefix

.text

.global max

#####################################
# int max(int, int)
# eax     edi  esi
#####################################

max:

# Prolog funkcije
enter 0, 0

# Ukoliko je prvi veci ili jednak
# drugom prelazi se na labelu 
# prvi_veci
cmp edi, esi
jge prvi_veci

# Ukoliko je drugi veci, on je maksimum
mov eax, esi
# Prelazi se bezuslovno na kraj
jmp kraj

prvi_veci:
mov eax, edi

kraj:
# Epilog i povratak iz funkcije
leave
ret

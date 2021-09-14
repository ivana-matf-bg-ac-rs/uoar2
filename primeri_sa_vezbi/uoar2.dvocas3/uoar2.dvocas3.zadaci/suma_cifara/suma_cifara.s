.intel_syntax noprefix

.text

.global suma_cifara

########################################
# unsigned suma_cifara(unsigned n)
# eax                  edi
########################################

suma_cifara:

# Prolog funkcije
enter 0, 0

# Inicijalizuje se suma na nulu, za sumu ce se
# koristiti registar r8d
xor r8d, r8d

# Smesta se broj sa kojim se deli u pomocni registar
mov esi, 10

# U eax se smesta broj cije cifre izdvajamo
mov eax, edi

petlja:
# Ukoliko je broj nula, izlazi se iz petlje
cmp eax, 0
je kraj

# Deli se broj sa 10
cdq
div esi
add r8d, edx
jmp petlja

kraj:
# Suma se smesta u registar za rezultat
mov eax, r8d

# Zavrsava se program
leave
ret

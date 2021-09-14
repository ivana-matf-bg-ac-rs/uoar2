.intel_syntax noprefix

.text

.global izbaci_neparne

#########################################################
# void izbaci_neparne(long* niz, unsigned* duzina)
#                     rdi        rsi
#########################################################

izbaci_neparne:

# Prolog funkcije:
enter 0, 0

# Pozicija tekuceg elementa u 
# nizu cuva se u i
# Pozicija tekuceg elementa u 
# nizu tako da su svi prethodni 
# parni brojevi cuva se u j
mov r8, 0   # i=0
mov r9, 0   # j=0
mov r10d, [rsi] # n

petlja:
# Ukoliko je i>=n izlazi se iz petlje
cmp r8d, r10d
jae kraj

# Cita se a[i] i smesta u pomocni
# registar zato sto test instrukcija
# ne moze da radi sa podatkom 
# koji je direktno u memoriji.
# Proverava se da li je poslednji
# bit 1. Ako jeste, broj je neparan
# pa se samo prelazi na sledeci clan
# u nizu
mov r11, [rdi + 8*r8]   # a[i] -> r11
test r11, 1
jne sledeci

# Ako je broj paran, smesta se na 
# lokaciju a[j] i povecava se j za jedan
mov [rdi + 8*r9], r11   # a[j] = a[i]
inc r9  # j++

# Prelazi se na sledeci clan u nizu
sledeci:
inc r8  # i++
jmp petlja

# Smesta se j (duzina niza) u lokaciju
# prosledjenu drugim argumentom
kraj:
mov [rsi], r9d

# Epilog i povratak iz funkcije
leave
ret



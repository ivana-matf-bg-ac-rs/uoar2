.intel_syntax noprefix

.text

.global savrsen

##########################################
# int savrsen(int n)
# eax         edi
##########################################

savrsen:

# Prolog funkcije
enter 0, 0

mov r8d, 2      # i
mov r9d, edi    # n
shr r9d, 1      # ceo deo od n/2
mov r10d, 1     # Inicijalizuje se suma na 1
                # posto za 1 ne proveravamo
                # da li deli pocetni broj

# U petlji se proverava za brojeve od 2 do n/2
# da li dele dati broj
petlja:
cmp r8d, r9d
jg provera

# Izracunava se ostatak n%i
mov eax, edi
cdq
div r8d
cmp edx, 0
jne dalje

# Ako broj deli n, sabira se sa 
# sumom
add r10d, r8d

# U svakom slucaju prelazi se na 
# sledeci broj
dalje:
inc r8d
jmp petlja

# Proverava se da li je suma jednaka 
# pocetnom broju
provera:
cmp r10d, edi
je jeste_savrsen

# Ako suma nije jednaka pocetnom broju,
# broj nije savrsen
mov eax, 0

jmp kraj

jeste_savrsen:
mov eax, 1

kraj:
# Zavrsava se program
leave
ret

# Dodatno napravicemo funkciju
# koja smesta prvih n savrsenih brojeva
# u niz

.global niz_savrsenih

#############################################
# void niz_savrsenih(int*, int)
#                    rdi   esi
#############################################

niz_savrsenih:

# Prolog funkcije
enter 0, 0

mov r8d, 1      # Broj od koga pocinje provera

# U petlji se za svaki broj od 1
# proverava da li je taj broj savrsen.
# Ako jeste, smesta se u niz i smanjuje
# broj savrsennih koje je potrebno naci.
# Ako nije, prelazi se na sledeci broj.

petlja2:
cmp esi, 0
je kraj2

# Smestamo na stek podatke koji su nam 
# potrebni i nakon povratka iz funkcije
push rdi
push rsi
push r8

# Prvi argument funkcije se smesta u edi
mov edi, r8d
call savrsen

# Vracamo podatke sa steka
pop r8
pop rsi
pop rdi

# Proverava se povratna vrednost funkcije
cmp eax, 1
jne dalje2

# Ako broj jeste savrsen, smesta se u niz
mov [rdi], r8d
add rdi, 4

# Smanjuje se koliko brojeva treba pronaci
dec esi

# Prelazi se na sledeci broj
dalje2:
inc r8d
jmp petlja2

kraj2:
# Zavrsetak funkcije
leave
ret

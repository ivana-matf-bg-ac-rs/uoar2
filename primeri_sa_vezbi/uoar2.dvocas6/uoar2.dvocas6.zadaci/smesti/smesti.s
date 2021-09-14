.intel_syntax noprefix

.text

.global vrednost

######################################
# int vrednost(int x)
# eax          edi
######################################

vrednost:
# Prolog funkcije
enter 0, 0

mov eax, edi
mul edi
cmp eax, 24
jle kraj

mov eax, 24

kraj:
# Povratak iz funkcije
leave
ret

.global smesti

#################################################
# void smesti(int∗ X, int nx, int∗ Y, int∗ ny)
#             rdi     esi     rdx     rcx
#################################################

smesti:
# Prolog funkcije
enter 0, 0

xor r8d, 0      # Velicina drugog niza, ny

# Proverava se da li se doslo do kraja
# niza X. Ako jeste, izlazi se iz petlje
petlja:
cmp esi, 0
je kraj2

# Ako ima jos elemenata, uzima se tekuci
# element niza x i proverava se da li je paran
mov r9d, [rdi]
test r9d, 1
jne dalje

# Ako je tekuci element paran, poziva se
# funkcija vradnost. Na stek se smestaju
# vrednosti koje nam trebaju i posle
# povratka iz funkcije a koje su u 
# registrima koje funkcija moze da promeni
push rdi
push rsi
push rdx
push rcx
push r8

mov edi, r9d
call vrednost

# Vracaju se vrednosti iz registara
pop r8
pop rcx
pop rdx
pop rsi
pop rdi

# Smesta se povratna vrednost funkcije u niz Y
mov [rdx], eax
add rdx, 4
inc r8d

# U svakom slucaju se prelazi na sledeci clan
# u nizu X
dalje:
add rdi, 4
dec esi
jmp petlja

# Na kraju, velicina niza Y se smesta na
# lokaciju koja se nalazi u registru rcx
kraj2:
mov [rcx], r8d

# Zavrsava se program
leave
ret


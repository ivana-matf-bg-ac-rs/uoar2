.intel_syntax noprefix

.text

.global faktorizacija

##############################################
# int faktorizacija(int x, int ∗ A, int ∗ B)
# eax               edi    rsi      rdx
##############################################

faktorizacija:
enter 0, 0

mov r8d, 2      # Faktor
mov r9d, 0      # Visestrukost
mov r10d, 0     # Brojac u nizovima A i B
mov r11, rdx    # Smesta se adresa drugog niza
                # na pomocnu lokaciju zato sto
                # se edx koristi za deljenje

# U petlji se proverava da li je broj x
# jednak 1, ako jeste, izlazi se iz petlje
petlja:
cmp edi, 1
je kraj

# Deli se broj tekucim faktorom
# sve dok je deljiv njime
petlja2:
mov eax, edi
cdq
div r8d
cmp edx, 0
jne sledeci

# Ako faktor deli broj n, povecava se 
# visestrukost za 1, deli se broj n
# faktorom
inc r9d
mov edi, eax
jmp petlja2

# Ako broj vise nije deljiv tekucim faktorom
# proverava se da li je visestrukost razlicita
# od nule
sledeci:
cmp r9d, 0
je dalje

# Ako jeste, upisuje se u niz A faktor i u 
# niz B njegova visestrukost
mov [rsi], r8d
mov [r11], r9d
add rsi, 4
add r11, 4
inc r10d
mov r9d, 0

# Prelazi se na sledeci faktor
dalje:
inc r8d
jmp petlja

# Ako smo izdvojili sve faktore,
# velicinu nizova postavljamo u
# registar za povratnu vrednost
kraj:
mov eax, r10d

# Zavrsava se funkcija
leave
ret

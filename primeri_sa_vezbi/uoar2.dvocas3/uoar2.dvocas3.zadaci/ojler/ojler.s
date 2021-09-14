.intel_syntax noprefix

.text

.global ojler

#################################
# unsigned ojler(unsigned n)
# eax            edi
#################################

ojler:

# Prolog funkcije
enter 0, 0

# U r12d cuvace se vrednost ojlerove funkcije. Pre toga 
# potrebno je prethodnu vrednosti sacuvati na steku posto
# pozivajuca funkcija moze da racuna na tu vrednost.
push r12
xor r12d, r12d

# U esi je brojac i koji ce uzimati vrednosti 
# od 1 do n
mov esi, 1

petlja:
# Ukoliko je i>=n izlazi se iz petlje
cmp esi, edi
jae kraj

# Posto se poziva funkcija nzd, potrebno je sacuvati
# register koje ona moze promeniti, a u kojim se
# nalazi neka vrednost koja ce kasnije biti potrebna.
# Posto su esi i edi, i i n, to njih cuvamo. Na steku
# ce se civati 64-bitni podaci - rdi i rsi
push rdi
push rsi

# Poziva se funkcija. Ova funkcija ima dva argumenta
# koja treba da budu u edi i esi. Oni vec jesu u ovim 
# registrima, tako da ih ne treba smestati ponovo
call nzd

# Vracaju se vrednosti sa steka
pop rsi
pop rdi

# Proverava se da li je nzd=1, ukoliko nije prelazi se
# na labelu dalje
cmp eax, 1
jnz dalje

# Ukoliko su uzajamno prosti, povecava se suma za jedan
add r12d, 1

dalje:
# Povecava se brojac i za jedan i prelazi se na sledecu
# iteraciju
inc esi
jmp petlja

kraj:
# Smesta se rezultat u registar za rezultat
mov eax, r12d

# Sa steka se vraca vrednosti u r12
pop r12

# Zavrsava se program
leave
ret

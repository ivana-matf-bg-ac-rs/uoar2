.intel_syntax noprefix

.data
fmt: .asciz "%d\n"

.text

.global aritmetika

#####################################################################
# void aritmetika(int a, int b)
#                 edi    esi
#####################################################################
# zbir, razliku, proizvod, količnik, suprotnu vrednost, 
# bitovsku konjunkciju, bitovsku disjunkciju, bitovsku negaciju, 
# prvi broj šiftovan u levo za vrednost drugog operanda, 
# prvi broj šiftovan aritmetički u desno za vrednost drugog operanda
#####################################################################

aritmetika:

# Prolog funkcije
enter 0, 0

# Kako ce se pozivati funkcija printf("%d\n", arg1), 
# a njeni argumenti se smestaju na rdi i esi, to ce
# biti potrebno da se sacuvaju vrednosti iz
# tih registara. Oni se mogu cuvati na 
# steku ili u nekom pomocnom registru. Pristup
# steku je sporiji nego pristup registrima,
# tako da ako je moguce smestiti u registar
# to se prvo bira. Registri koji pripadaju pozivajucoj
# funkciji su ebp, rbx, r12-15, pa cemo cuvati u
# r12 i r13, odnosno u r12d i r13d posto su 
# vrednosti koje cuvamo 32-bitne.
# Sa druge strane, i nasa funkcija je pozvana iz neke 
# funkcija, koja moze da racuna na vrednosti ovih 
# registara, pa njih moramo na pocetku smestiti 
# na stek i na kraju vratiti sa steka.

push r12
push r13

mov r12d, edi
mov r13d, esi

# Poziva se funkcija printf("%d\n", arg1), pa je
# argumente funkcije potrebno smestiti u 
# rdi i esi

# Racuna se zbir
mov esi, r12d
add esi, r13d

# Smesta se "%d\n" u prvi argument, u esi
# je vec drugi argument
lea rdi, fmt

# Poziva se funkcija printf
call printf

# Racuna se razlika
mov esi, r12d
sub esi, r13d

# Poziva se funkcija printf
lea rdi, fmt
call printf

# Racuna se proizvod
mov eax, r12d
imul r13d

# Poziva se funkcija printf
lea rdi, fmt
mov esi, eax
call printf

# Racuna se kolicnik
mov eax, r12d
cdq
idiv r13d

# Poziva se funkcija printf
lea rdi, fmt
mov esi, eax
call printf

# Racuna se suprotna vrednost
mov esi, r12d
neg esi

# Poziva se funkcija printf
lea rdi, fmt
call printf

# Racuna se bitovska konjunkcija
mov esi, r12d
and esi, r13d

# Poziva se printf
lea rdi, fmt
call printf

# Racuna se bitovska disjunkcija
mov esi, r12d
or esi, r13d

# Poziva se funkcija printf
lea rdi, fmt
call printf

# Racuna se bitovska negacija
mov esi, r12d
not esi

# Poziva se funkcija printf
lea rdi, fmt
call printf

# Siftovanje za broj koji je dat preko operanda
# cemo moci da uradimo kada budemo radili petlje,
# posto siftovanje zahteva neposredni operand.

# Vracaju se vrednosti sa steka u registre
pop r13
pop r12

# Epilog i zavrsetak funkcije
leave
ret

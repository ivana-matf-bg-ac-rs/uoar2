.intel_syntax noprefix

.text

.global izdvoji_proste

############################################
# void izdvoji_proste(int*, int, int*)
# eax                 rdi   esi  rdx
############################################

izdvoji_proste:

# Prolog funkcije
enter 0, 0

# Indeks tekuceg clana u prvom nizu
# ce biti i dok ce indeks tekuceg clana 
# u drugom nizu biti j
mov r8, 0    # i
mov r9, 0    # j

petlja:
# Proverava se da li se doslo do kraja
# u prvom nizu
cmp esi, 0  # na == 0?
jle kraj

# Smanjuje se preostali broj clanova
# za jedan
dec esi     # na--

# Vrednosti koje mogu biti promenjene u 
# funkciji cuvaju se na steku, po dogovoru
# (konvenciji) o koriscenju funkcija
push rdi
push rsi
push rdx
push r8
push r9

# Tekuci clan prvog niza postavlja se
# u edi, tj kao prvi argument funkcije
# prost, i poziva se funkcija prost
mov edi, [rdi + 4*r8]
call prost

# Vracaju se vrednosti sa steka u obrnutom
# redosledu
pop r9
pop r8
pop rdx
pop rsi
pop rdi

# Povratna vrednost funkcije prost je u 
# registru eax, pa proveravamo da li je nula.
# Ako je nula broj nije prost, pa se
# prelazi na sledecu iteraciju
cmp eax, 0
je dalje

# Ako je broj prost, ponovo se ucitava iz
# memorije i smesta se u drugi niz
# pri cemu se prelazi na sledecu poziciju
# u drugom nizu
mov r10d, [rdi + 4*r8]  # a[i] -> r10d
mov [rdx + 4*r9], r10d  # r10d -> b[j]
inc r9  # j++

dalje:
# U svakom slucaju se prelazi na sledecu 
# poziciju u prvom nizu
inc r8  # i++
jmp petlja

kraj:
# Na kraju, tekuca pozicija u drugom nizu
# je ujedno i broj elemenata drugog niza
mov eax, r9d    # nb = j
# Epilog i povratak iz funkcije
leave
ret

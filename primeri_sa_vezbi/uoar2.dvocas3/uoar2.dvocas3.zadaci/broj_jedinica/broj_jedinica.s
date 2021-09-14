.intel_syntax noprefix

.text

.global broj_jedinica

#####################################
# unsigned broj_jedinica(unsigned n)
# eax                    edi
#####################################

broj_jedinica:

# Prolog funkcije
enter 0, 0

# Postavlja se suma na nulu
xor eax, eax

petlja:
# PRoverava se da li ima jos jednica u broju, ako nema
# izlazi se iz petlje
cmp edi, 0
je kraj

# Testiramo krajnji desni bit. Ukoliko je nula ide se dalje
test edi, 1
je dalje

# Ukoliko je jedinica, povecava se broj jedinica za jedan
inc eax

dalje:
# Pomera se sadrzaj logicki u desno za jedno mesto, odnosno
# izbacuje se pregledani bit i prelazi se na sledecu iteraciju
shr edi, 1
jmp petlja

kraj:
# Zavrsava se program
leave
ret

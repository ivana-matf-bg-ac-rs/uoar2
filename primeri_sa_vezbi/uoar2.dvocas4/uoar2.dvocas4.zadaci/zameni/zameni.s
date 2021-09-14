.intel_syntax noprefix

.text

.global zameni

#################################
# void zameni(int∗ a, int∗ b)
#             rdi     rsi
#################################

zameni:

# Epilog funkcije
enter 0, 0

# Na rdi i rsi se nalaze adrese. Ukoliko je potrebno smestiti
# podatke sa tih adresa u registre, koristi se indirektno
# adresiranje koji se navodi uglastim zagradama [ i ]
mov eax, [rdi]
mov ecx, [rsi]

# Podaci se smestaju na lokacije koje se nalaze u rdi i rsi
# registrima, za sta se koristi indirektno adresiranje
mov [rdi], ecx
mov [rsi], eax

# Zavrsava se program
leave
ret

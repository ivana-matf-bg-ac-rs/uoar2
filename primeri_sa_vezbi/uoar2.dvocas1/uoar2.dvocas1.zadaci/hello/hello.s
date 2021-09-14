# Program ispisuje pozdravnu poruku na izlaz

.intel_syntax noprefix

# Pocetak sekcije sa inicijalnizovanim podacima
.data

# Podatak koji predstavlja format string funkcije printf()
fmt: .asciz "Hello, world!\n"

# Pocetak sekcije sa kodom
.text

# Definicija globalnog simbola
.global main

###############################
## int main()
###############################

main:

# Prolog funkcije
enter 0, 0

# Pozivanje funkcije printf(fmt).
# U rdi se smesta adresa stringa
lea rdi, fmt
call printf

# Epilog funkcije
leave
ret

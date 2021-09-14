.intel_syntax noprefix

.text

.global izraz

#################################
# int izraz(int a, int b, int c)
# eax       edi    esi    edx
#################################
# (4a − b + 1)/2 + c/4
#
#################################

izraz:

# Prolog funkcije
enter 0, 0

# Racuna se 4a tako sto se siftuje
# u levo za dve pozicije
shl edi, 2

# Racuna se 4a-b
sub edi, esi

# Racuna se 4a-b+1
add edi, 1

# Racuna se (4a-b+1)/2
sar edi, 1

# Racuna se c/4
sar edx, 2

# Sabiraju se prethodna dva rezutltata
add edi, edx

# Smesta se rezultat u registar za rezultat
mov eax, edi

# Epilog i zavrsetak programa
leave
ret

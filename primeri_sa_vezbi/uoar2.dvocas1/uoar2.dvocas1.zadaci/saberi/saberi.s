# Program definise funkciju za sabiranje dva broja

.intel_syntax noprefix

# Zapocinje se sekcija sa kodom
.text

# Definise se simbol saberi kao globalan
# kako bi linker mogao da poveze simbole
.global saberi

##################################
# int saberi(int, int)
# eax        edi  esi
##################################

saberi:

# Prolog funkcije
enter 0, 0

# Smesta se prvi argument u eax
mov eax, edi

# i sabira se sa drugim argumentom
add eax, esi

# Rezultat je vec u eax, gde i treba 
# da bude povratna vrednost

# Epilog funkcije
leave

# Povratak iz funkcije
ret

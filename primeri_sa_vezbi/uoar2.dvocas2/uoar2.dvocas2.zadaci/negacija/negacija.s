.intel_syntax noprefix

# Pocinje sekcija sa kodom
.text

# Postavlja se simbol da bude globalni
# kako bi linker mogao da poveze simbole
.global negacija

################################
# unsigned negacija(unsigned)
# eax               edi
################################

negacija:

# Prolog funkcije
enter 0, 0

# Izracunava se negacija
not edi

# Smesta se negirano a u eax
mov eax, edi

# Epilog funkcije
leave

# Povratak iz funkcije
ret

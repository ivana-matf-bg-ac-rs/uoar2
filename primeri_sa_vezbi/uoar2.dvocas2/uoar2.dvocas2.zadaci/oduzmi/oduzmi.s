.intel_syntax noprefix

# Pocinje sekcija sa kodom
.text

# Postavlja se simbol da bude globalni
# kako bi linker mogao da poveze simbole
.global oduzmi

################################
# int oduzmi(int, int)
# eax        edi  esi
################################

oduzmi:

# Prolog funkcije
enter 0, 0

# Smesta se a u eax
mov eax, edi

# Oduzima se od njega b
sub eax, esi

# Povratna vrednosti je vec u eax

# Epilog funkcije
leave

# Povratak iz funkcije
ret

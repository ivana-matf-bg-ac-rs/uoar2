.intel_syntax noprefix

.text

.global kolicnik

##################################################################
# void kolicnik(unsigned a, unsigned b, unsigned∗ k, unsigned∗ o)
#               edi         esi         rdx          rcx
##################################################################

kolicnik:

# Prolog funkcije
enter 0, 0

# Sadrzaj registra rdx se smesta na pomocnu lokaciju
# posto ce rdx biti izmenjen pozivom cdq i div funkcija
mov r12, rdx

# Deli se prvi broj drugim brojem
mov eax, edi
cdq
div esi

# Kolicnik se smesta na lokaciju koja se nalazi u r12 registru
mov [r12], eax
# Ostatak se smesta na lokaciju koja se nalazi u rcx registru
mov [rcx], edx

# Zavrsava se program
leave
ret

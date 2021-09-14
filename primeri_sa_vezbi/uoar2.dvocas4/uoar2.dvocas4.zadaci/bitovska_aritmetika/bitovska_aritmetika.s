.intel_syntax noprefix

.text

.global bitovska_aritmetika

##########################################################################################
# void bitovska aritmetika(unsigned, unsigned, unsigned∗, unsigned∗, unsigned∗, unsigned∗)
#                          edi       esi       rdx        rcx        r8         r9
##########################################################################################

bitovska_aritmetika:

# Prolog funkcije
enter 0, 0

# Racuna se bitovska konjunkcija i rezultat se smesta 
# na lokaciju koja se nalazi u rdx registru
mov eax, edi
and eax, esi
mov [rdx], eax

# Racuna se bitovska disjunkcija i rezultat se smesta
# na lokaciju koja se nalazi u rcx registru
mov eax, edi
or eax, esi
mov [rcx], eax

# Racuna se bitovska ekskluzivna disjunkcija i rezultat se smesta
# na lokaciju koja se nalazi u r8 registru
mov eax, edi
xor eax, esi
mov [r8], eax

# Racuna se bitovska negacija i rezultat se smesta 
# na lokaciju koja se nalazi u r9 registru
not edi
mov [r9], edi

# Zavrsava se program
leave
ret


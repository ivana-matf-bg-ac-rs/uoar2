.intel_syntax noprefix

.text

.global fibonaci

###################################
# void fibonaci(int, int*)
# eax           edi  rsi
###################################

fibonaci:

# Prolog funkcije
enter 0, 0

# Ukoliko je n nula zavrsava se
# program
cmp edi, 0
jle kraj

# Ukoliko je n bar jedan, smesta se
# prvi clan (vrednost 1) u niz
mov eax, 1
mov [rsi], eax

# Ukoliko je n = 1 zavrsava se
# program
cmp edi, 1
je kraj

# Ukoliko je n bar dva, smesta se 
# drugi clan (vrednost 1) u niz
mov [rsi + 4], eax

# Podesavaju se brojaci tako da
# se ostali clanovi izracunavaju
# u petlji
mov rcx, 2  # i
mov r8, 1   # k = i-1
mov r9, 0   # j = i-2

# U edi ce biti broj preostalih iteracija
sub edi, 2

petlja:
# Proverava se da li ima jos iteracija
cmp edi, 0
je kraj

# Smanjuje se broj preostalih iteracija 
# za jedan
dec edi

# Izracunava se a[i] na osnovu prethodna
# dva clana
mov r10d, [rsi + 4*r8]   # a[i-1]
add r10d, [rsi + 4*r9]   # a[i-2]
mov [rsi + 4*rcx], r10d  # a[i] = a[i-1] + a[i-2]

# Azuriraju se indeski tekuceg clana
# i prethodna dva clana
inc ecx     # i++
inc r8d     # k++
inc r9d     # j++
jmp petlja

kraj:
# Epilg i povratak iz funkcije
leave
ret

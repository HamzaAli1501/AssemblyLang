INCLUDE Irvine32.inc

.data
data byte "Enter your password <4 character>",0
welcome byte "Welcome to your account",0
info2 byte "Author: Hamza Ali",0
error_404 byte "Entered password is incorrect",0
try byte "Try again",0
pass byte 4 dup(?)
steric dword "****"
.code
main PROC
mov edx,0
mov edx, offset data
call writestring
call crlf
mov ecx,4
mov eax,0
mov ebx,0
L1:
call readchar
mov pass[ebx],al
inc ebx
mov eax,steric
call writechar
loop L1

cmp dword ptr [pass],"4321"
jne _FALSE
call crlf
mov edx, offset welcome
call writestring
call crlf
mov edx, offset info
call writestring
call crlf
mov edx, offset info2
call writestring
call crlf
jmp quit
_FALSE:
call crlf
mov edx,offset error_404
call writestring
call crlf
mov edx,offset try
call writestring
call crlf
call main

quit:
call waitmsg
exit
main ENDP
end MAIN

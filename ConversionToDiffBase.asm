Include irvine32.inc
.data
num dword ?
confirm byte "Enter y if you want to enter again",0
c_char dword ?
data byte "Enter the number you want to enter",0
data1 byte "Press 1 for binary",0
data2 byte "Press 2 for integer",0
data3 byte "Press 3 for Decimal",0
data4 byte "Press 4 for HexaDecimal",0
data5 byte "Press 5 for color ",0
dta byte "Your number is ",0
.code
main PROC

mov eax,0
mov edx,0
mov edx,offset data
call writestring
call crlf

call readint
mov num,eax

mov edx,offset data1
call writestring
call crlf

mov edx,offset data2
call writestring
call crlf

mov edx,offset data3
call writestring
call crlf

mov edx,offset data4
call writestring
call crlf

mov edx,offset data5
call writestring
call crlf

mov eax,0
call readint

cmp eax,1
je toBin


cmp eax,2
je toInt


cmp eax,3
je toDec


cmp eax,4
je toHex


cmp eax,5
je Color


toBin:
call TO_BIN
jmp Confirmation
jmp exit1

toInt:
call TO_INT
jmp Confirmation
jmp exit1

toDec:
call TO_DEC
jmp Confirmation
jmp exit1

toHex:
call TO_HEX
jmp Confirmation
jmp exit1

Color:
call COLOR_c
jmp Confirmation
jmp exit1

Confirmation:
mov edx,0
mov edx,offset confirm
call writestring
call crlf
call readchar

cmp al,'y'
je INPUT_1
jne exit1

Input_1:
call main
call exit1

TO_BIN PROC
mov eax,num
call writebin
call crlf
ret
TO_BIN ENDP

TO_INT PROC
mov eax,num
call writeint
call crlf
ret
TO_INT ENDP

TO_DEC PROC
mov eax,num
call writedec
call crlf
ret
TO_DEC ENDP

TO_HEX PROC
mov eax,num
call writehex
call crlf
ret
TO_HEX ENDP

COLOR_c PROC
mov eax,green+(blue*16)
call settextcolor
mov edx,offset dta
call writestring
mov eax,num
call writeint
mov eax,white+(black*16)
call settextcolor
call Crlf
ret
COLOR_c ENDP


exit1:
call waitmsg
exit
main ENDP
end MAIN

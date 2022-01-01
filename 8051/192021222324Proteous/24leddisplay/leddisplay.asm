;LCD DISPLAY
ORG 00H
AGAIN:MOV A,#38H       ; move 38h to A
ACALL CW                ; call cw
ACALL DELAY             ; call delay routine
MOV A,#0EH              ; move 0E to A
ACALL CW                ; call cw
ACALL DELAY             ; call delay routine
MOV A,#01H              ; move 01H to A
ACALL CW                ; call cw
ACALL DELAY             ; call delay routine
MOV A,#06H              ; move 06H to A
ACALL CW                ; call cw
ACALL DELAY             ; call delay routine
MOV DPTR,#MYBYTE        ; move the byte to memory
D1:CLR A                ; set A to 0
MOVC A,@A+DPTR
ACALL DWR               ; call delay routine
INC DPTR                ; increment memory address
SJMP D1                 ; transfer D1 to execution
DWR:MOV P1,A            ; move A to p1
SETB P2.0 
CLR P2.1
SETB P2.2
ACALL DELAY             ; call delay routine
ACALL DELAY
ACALL DELAY
ACALL DELAY
CLR P2.2                ; clear the pin p2.2
RET
CW:MOV P1,A             ; move A to p1
CLR P2.0                ; clear the pin p2.0
CLR P2.1                ; clear the pin p2.1
SETB P2.2               ; set the pin p2.2
ACALL DELAY             ; call delay routine
CLR P2.2                ; clear the pin p2.2
RET
DELAY:MOV R3,#50       ; move the value to R3 register
HERE2:MOV R4,#200      ; move the valur R2 register
HERE:DJNZ R4,HERE
DJNZ R3,HERE2
RET
MYBYTE: DB "HELLO",0    ; the string to be displayed
END

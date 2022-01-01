org 100H
.MODEL SMALL
.STACK 100H
.DATA
STR1 DB "RUThRA$"   ; load the string
LEN DB 0            ; set length of the string to 0
.CODE
MOV AX,@DATA        ; move the value of data to AX
MOV DS,AX           ; move AX to DS
MOV SI,OFFSET STR1  
UP:                 ;Perform operation
MOV AL,[SI]         ; move the content of SI to AL
CMP AL,'$'          ; compare al with the string
JZ DN               ; jump if zero flag is 1
INC LEN             ; increment length of the string
INC SI              ; increment SI
LOOP UP 
DN:
MOV DL,LEN          ; move the length to DL
ADD DL,48           ; add 48 to DL
MOV AH,2            ; move the value 2 to AH
INT 21H             ; interrupt call
MOV AH,4CH          ; move 4CH to AH
INT 21H             ; interrupt call 
RET
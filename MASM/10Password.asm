ASSUME CS:CODE,DS:DATA
DATA SEGMENT                                    ; define password and its length
PASSWORD DB 'MASM1234'                          
LEN EQU ($-PASSWORD)
MSG1 DB 10,13,'ENTER YOUR PASSWORD:$'           ; define messages to be displayed on screen
MSG2 DB 10,13,'WELCOME TO ELECTRONIC WORLD!!$'

MSG3 DB 10,13,'INCORRECT PASSWORD!$'
NEW DB 10,13,'$'
INST DB 10 DUP(0)           ; create an array of size 10
DATA ENDS                   ; end of data segment
CODE SEGMENT                ; start of code segment
START: MOV AX,DATA          ; start of code segment
MOV DS,AX                   ; copy content of AX to DS
LEA DX,MSG1
MOV AH,09H                  ; write msg1 on screen
INT 21H
MOV SI,00                   ; initialize source index to 00
UP1: MOV AH,08H             ; read characters into array by comparing each character with character return
INT 21H 
CMP AL,0DH
JE DOWN
MOV [INST+SI],AL
MOV DL,'*'
MOV AH,02H
INT 21H
INC SI
JMP UP1
DOWN: MOV BX,00             ; if enter key is pressed move to loop for comparing passwords  
MOV CX,LEN                  ; move contents of len to CX
CHECK: MOV AL,[INST+BX]     ; move first character of entered password to AL
MOV DL,[PASSWORD+BX]        ; move first character of original password to DL
CMP AL,DL                   ; compare characters
JNE FAIL                    ;move to check to compare the next character
INC BX                      ; if password match,displaymsg 2 on screen
LOOP CHECK                  ; move to check to compare the next character
LEA DX,MSG2                 ; if passwords match,displaymsg 2 on screen
MOV AH,09H
INT 21H
JMP FINISH                  ; jump to finish
FAIL: LEA DX,MSG3           ; if password do not match display msg3 on screen
MOV AH,009H                 ; break from code and stop
INT 21H
FINISH: NOP                 ; break from code and stop
CODE ENDS
END START
END

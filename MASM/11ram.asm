ASSUME CS:CODE,DS:DATA
DATA SEGMENT
MSG DB 'MEMORY SIZE IN KILOBYTES ='     ; initializing required constants
ASCRES DB 4 DUP(?),'HEX',0CH,0AH,'$'
RES DW ?
HEXCODE DB '0123456789ABCDEF'
DATA ENDS                               ; end of data segment
CODE SEGMENT
HEX_ASC PROC                            ; start of procedure
MOV DL,10H                              ; move 10h to DL
MOV AH,0                                ; make higher order bytes of AX as 0
MOV BX,0                                ; make BX as 0
DIV DL                                  ; divide lower order byte of memory size by 10h 
MOV BL,AL                               ; move quotient to BL
MOV DH,HEXCODE[BX]                      ; move hex equivalent of quotient to DH
MOV BL,AH                               ; move remainder to BL
MOV DL,HEXCODE[BX]                      ; move hex equivalent of quotient to DHS
RET                                     
HEX_ASC ENDP                            ; end of procedure 
MAIN:MOV AX,DATA                        ; move the message start data to AX
MOV DS,AX                               ;move the content to DS
INT 12H                                 ; stores RAM memory size in hex in KB to AX
MOV RES,AX                              ; stores RAM size in data segment location res
MOV AL, BYTE PTR RES                    ;a byte of data pointed by res is stored in AL
CALL HEX_ASC                            ; calling the procedure
MOV [ASCRES+2],DH                       ; storing the lowest order byte of ram size in ACRES+2 mem location
MOV [ASCRES+3],DL                       ; storing the lowest order byte of ram size in ACRES+3 mem location
MOV AL,BYTE PTR RES+1                   ; get start address of msg in DX
CALL HEX_ASC                            ; calling the procedure
MOV [ASCRES],DH                         ; storing the next lowest order byte of ram size in ACRES mem location
MOV [ASCRES+1],DL                       ; storing the next lowest order byte of ram size in ACRES+1 mem location
MOV DX,OFFSET MSG                       ; get start address of msg in DX
MOV AH,09H                              ; to display data
INT 21H                                 ; interrupt for bios
MOV AH,4CH                              ; to return ms-dos
INT 21H                                 ; interrupt for bios
CODE ENDS                               ; forcing the assembler to start next address which is divisible by 16
END MAIN                                ; ending the main program

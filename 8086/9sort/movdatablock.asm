ASSUME CS:CODE,DS:DATA
DATA SEGMENT
X DB 01H,02H,03H,04H,05H    ; initializes data segments memory locations
DATA ENDS
CODE SEGMENT
START:MOV AX,DATA           ; initialize ds to start of the memory
MOV DS,AX                   ; set aside for storing of data
MOV CX,05H                  ; load counter
LEA SI,X+04                 ; SI pointer pointed to top of the memory block
LEA DI,X+04+05              ; 05 is displacement of non overlapping DI pointed to top of dest block
UP: MOV BL,[SI]             ; move the SI content to BL register
MOV [DI],BL                 ; move the BL register to content of DI
DEC SI                      ; update si and di
DEC DI
DEC CX                      ; decrement the counter till it becomes zero
JNZ UP
MOV AH,4CH
INT 21H
CODE ENDS
END START
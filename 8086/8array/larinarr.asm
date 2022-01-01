;mov si,1100h
;mov di,1200h
;mov cl,[si]
;inc si
;mov al,[si]
;dec cl
;again:
;inc si
;mov bl,[si]
;cmp al,bl
;ahead:
;dec cl
;jnz again
;mov [di],al
;hlt

org 100h
MOV SI,1100H    ;Set SI register as point.
MOV CL,[SI]     ;Set CL as count for element.
INC SI          ;Increment address point
MOV AL,[SI]     ;Get first data
DEC CL          ;Decrement count
L2: INC SI      ;Increment SI
CMP AL,[SI]     ;Compare current smallest and next
JNB L1          ;If carry is not set,AL is largest and go to ahead
MOV AL,[SI]     ;MOV BL to AL
L1: DEC CL      ;Decrement count register
JNZ L2          ; If ZF=0,repeat comparison
MOV DI,1200H    ; Store largest data in memory
MOV [DI],AL     ; Initialize DI with1200h
HLT             ;Halt the program.
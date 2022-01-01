; REVERSE STRING
NAME "REVERSE"
ORG 100H
JMP START
STRING1 DB '!MICROPROCCESOR$'   ; the string to be printed
START: 
    LEA BX, STRING1             ; load address of the string
    MOV SI, BX                  ; move the content of BX to SI
NEXT_BYTE: 
    CMP [SI],'$'                ; compare the value of SI with the given string
    JE FOUND_THE_END            ; else push it in the stack
    INC SI                      ; increment SI
    JMP NEXT_BYTE               ; jump to the next byte
FOUND_THE_END: 
    DEC SI                      ; decrement SI
DO_REVERSE: 
    CMP BX, SI                  ; compare bx with the string 
    JAE DONE
    MOV AL, [BX]                ; move the content of BX to AL
    MOV AH, [SI]                ; move the content of SI to AH
    MOV [SI], AL                ; move AL to the address of SI
    MOV [BX], AH                ; move ah to the content of BX
    INC BX                      ; increment BX
    DEC SI                      ; decrement SI
JMP DO_REVERSE
DONE:
    LEA DX,STRING               ; load the address of the string
    MOV AH,09H
    INT 21H                     ; interrupt call
MOV AH,0                        ; move 0 to AH
INT 16H                         ; interrupt call
RET
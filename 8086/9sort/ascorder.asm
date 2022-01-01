org 100h
MOV SI,1100H    ; move the address to SI
MOV CL,[SI]     ; move the content of to CL
DEC CL          ; decrement CL
REPEAT:
MOV SI,1100H     ; move the address to SI
MOV CH,[SI]      ;move the content of SI to CH
DEC CH           ; decrement ch
INC SI           ; increment si
REPCOM:
MOV AL,[SI]      ; move the content of si to al
INC SI           ; increment si
CMP AL,[SI]      ; compare the content of si with al
JC AHEAD         ; jump if carry
XCHG AL,[SI]     ;exchange the content of si with al
XCHG AL,[SI-1]   ; exchange the content of si-1 register with al
AHEAD:
DEC CH           ; decrement ch
JNZ REPCOM       ; jump if zero flag is set to 0
DEC CL           ; decrement cl
JNZ REPEAT       ; repeat the process
HLT
RET
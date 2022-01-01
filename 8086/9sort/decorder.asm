org 100h
MOV SI,1100H    ; move the value to SI
MOV CL,[SI]     ; move the content of SI to cl
DEC CL          ; decrement cl
REPEAT:
MOV SI,1100H    ; repeat the steps
MOV CH,[SI]     ; move the content of SI to ch
DEC CH          ; decrement ch
INC SI          ; increment SI
REPCOM:
MOV AL,[SI]     ; move the content of SI to al
INC SI          ; increment SI
CMP AL,[SI]     ; compare the content of SI with al
JNC AHEAD       ; jump if no carry to ahead
XCHG AL,[SI]    ;exchange the content of si with al
XCHG AL,[SI-1]  ; exchange the content of si-1 with al
AHEAD:
DEC CH          ; decrement ch
JNZ REPCOM      ; jump if no zero flag to repcom
DEC CL          ; decrement cl
JNZ REPEAT      ; jump if no zero flag to repeat
HLT
RET
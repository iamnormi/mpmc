org 100h
MOV AL, [1200]  ; initialize AL with memory offset 1200
MOV AL,30h      ; load the value in AL
MOV AH,AL       ; move the content of al to ah
AND AH,0Fh      ; AND 0Fh with AH
MOV BL, AH      ; move the content of AH to BL
AND AL,0F0h     ; AND F0h with AL
MOV CL,04       ; load CL with 4
ROR AL, CL      ; rotate AL to write 4 times
MOV BH,0Ah      ; load BH with 0Ah
MUL BH          ; multiply BH with AL
ADD AL, BL      ;add AL and BL
MOV [1400], AL  ;store AL into memory
HLT
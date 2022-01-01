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
;jc  ahead
;mov al,bl
;ahead:
;dec cl
;jnz again
;mov [di],al
;hlt


org 100h
MOV SI, 1100H   ;Set DI register as pointer
MOV DI, 1200H   ;Set DI register as pointer for result
MOV CL, [SI]    ;Set CL as count for element
INC SI          ;Increment address
MOV AL,[SI]     ;Get first data
DEC CL          ;Decrement count
INC SI          ;Increment SI
L1:CMP AL,[SI]  ;Compare current smallest & next
JC L2           ;If carry is set,AL is the smallest here go to ahead
MOV AL,[SI]     ;Store lower byte in AL
L2:INC SI       ; increment
LOOP L1         ; repeat l1
MOV [DI],AL     ; move AL to the content of
DI
HLT
ret
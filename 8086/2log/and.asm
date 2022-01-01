MOV AX, 1F21H   ;move data 1F21 to the register AX
MOV BX, 1134H   ;move data 1134 to the register BX
AND AX, BX      ;AND operation
MOV [DI], AX;
HLT

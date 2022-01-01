MOV AX, 1200H   ;move data to AX
MOV BX, 1100H   ;move data to BX
XOR AX, BX      ;Logical XOR operation
MOV DI, AX      ;move result to DI
HLT
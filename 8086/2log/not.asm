MOV AX, 1100H   ;move data 1100H to the register AX
NOT AX          ;logical NOT operation
MOV [DI], AX    ;Store the result in DI HLT
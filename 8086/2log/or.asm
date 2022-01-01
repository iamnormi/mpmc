MOV AX, 1200H   ;MOV data 1200 to AX register
MOV BX, 1100H   ;MOV data to BX register
OR AX, BX       ;OR logical operation
MOV [DI], AX       ;Store the result in DI
HLT
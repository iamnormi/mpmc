MOV SI,1100H    ;Load the address of data in SI
MOV DI,1200H    ;Load the result address in DI
MOV AX,[SI]     ;Move the contents of SI to AX register
ADD AX, [SI+4]  ;Add AX register with contents of SI
MOV [DI],AX     ;Move AX reg to DI
MOV AX,[SI+2]   ;Move the contents of SI+2 to AX register
ADC AX, [SI+6]  ;Add carry to AX register
MOV [DI+2],AX   ;Move AX to contents of DI+2
LAHF            ;Load AH to Flag
MOV [DI+4],AX   ;Move AX to the contents of DI+4
HLT             ;Halt the program
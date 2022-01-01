MOV SI,1100H    ;Load the address of data in SI
MOV DI,1200H    ;Load the result address in DI
MOV AX,[SI+4]   ;Move contents of SI+4 to AX register
SUB AX,[SI+4]   ;Subtract contents AX register from contents of [SI+4]
MOV [DI],AX     ;Move AX reg to DI
MOV AX,[SI+2]   ;Move the contents of SI+2 to AX register
SBB AX,[SI+6]   ;Subtract AX register
MOV [DI+2],AX   ;AX to contents of DI+4
LAHF            ;Load AH to Flag
MOV [DI+4],AX   ;Move AX to the contents of DI+4
HLT             ;Halt the program
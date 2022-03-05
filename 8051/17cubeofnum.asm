MOV dptr,#9000H     ;Load address of dptr
MOVX A,@dptr        ;Move content of dptr to accumulator
MOV A,#04           ;Move data to A
MOV R0,A            ;Move content of A to R0 register
MOV B,A             ;Move content of A to B
MUL AB              ;Multiply A and B
MOV B,A             ;Move content of A to B
MOV A,R0            ;Move content of R0 to A
MUL AB              ;Multiply both A and B
INC dptr            ;Increment dptr
MOVX @dptr,A        ;Store the result in memory
HERE:SJMP HERE      ;Stop the program
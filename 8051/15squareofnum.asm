MOV dptr,#9000H     ;Load the address of dptr
MOVX A,@dptr        ;Move the content of dptr to A
MOV A,#04           ;Move data to A
MOV R0,A            ;Move content of A to R0 register
MOV B,A             ;Move content of A to B
MUL AB              ;Multiply A and B
INC dptr            ;Increment dptr
MOVX @dptr,A        ;Store the result in memory
HERE: SJMP HERE     ;Stop the program
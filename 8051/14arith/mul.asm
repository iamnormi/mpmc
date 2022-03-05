MOV A,#02           ;Move 1st data in accumulator
MOV B,#04           ;Move 2nd data in accumulator
MUL AB              ;Multiply both data
MOV dptr,#4150      ;Load the address of data pointer
MOVX @dptr, A       ;Store the lower byte
INC dptr            ;Increment data pointer
MOV A,B             ;Move content of B to A
MOVX @dptr, A       ;Store the result in memory
HERE: SJMP HERE     ;Stop the program
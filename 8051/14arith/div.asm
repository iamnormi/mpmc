MOV A,#05           ;Move 1st data in accumulator
MOV B,#05           ;Move 2nd data in accumulator
DIV AB              ;Divide content of A by B
MOV dptr,#4150      ;Load the address of data pointer
MOVX @dptr,A        ;Store quotient in memory
INC dptr            ;Increment data pointer
MOV A,B             ;Move content of B to A
MOVX @dptr,A        ;Store remainder in memory
HERE:SJMP HERE      ;Stop the program
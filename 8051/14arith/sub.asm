MOV A,#55H      ;Move 1st data in accumulator
MOV R0,#05H     ;Move 2nd data in R0 Register
SUBB A,R0       ;Subtract 2nd data from 1st data
MOV dptr,#4150  ;Load the address in data pointer
MOVX @dptr,A    ;Store the result in memory
HERE: SJMP
HERE            ;Stop the program